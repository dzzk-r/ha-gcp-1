#!/usr/bin/env python3
import json
import sys

def collect_resources(module, resources=None):
    """Recursively collect resources from a given module."""
    if resources is None:
        resources = []
    resources.extend(module.get("resources", []))
    for child in module.get("child_modules", []):
        collect_resources(child, resources)
    return resources

def parse_tfplan(json_file):
    """Parse the tfplan.json file and return a list of resources."""
    try:
        with open(json_file, "r") as f:
            data = json.load(f)
    except (json.JSONDecodeError, FileNotFoundError) as e:
        print(f"Error loading JSON: {e}")
        return []

    root_module = data.get("planned_values", {}).get("root_module", {})
    if not root_module:
        print("No root module found in tfplan.json")
        return []

    resources = collect_resources(root_module)
    print(f"Total resources parsed from tfplan.json: {len(resources)}")  # Debug print
    return resources

def find_connections(resources):
    """Find connections between resources based on known reference attributes."""
    connections = []
    resource_map = {res["address"]: res for res in resources}

    for resource in resources:
        resource_address = resource.get("address")
        resource_type = resource.get("type")
        expressions = resource.get("expressions", {})

        # Check for references in the expressions field
        for attr, details in expressions.items():
            references = details.get("references", [])
            for ref in references:
                if ref in resource_map:
                    connections.append((resource_address, ref))
                else:
                    print(f"Warning: {ref} not found in resource map")  # Debug print
    print(f"Total connections found: {len(connections)}")  # Debug print
    return connections

def group_resources(resources):
    """Group resources into packages."""
    grouped = {
        "GKE Resources": [],
        "Compute Resources": [],
        "IAM Resources": [],
        "Other Resources": []
    }

    for resource in resources:
        resource_type = resource.get("type", "unknown")
        if "google_container" in resource_type:
            grouped["GKE Resources"].append(resource)
        elif "google_compute" in resource_type:
            grouped["Compute Resources"].append(resource)
        elif "google_iam" in resource_type:
            grouped["IAM Resources"].append(resource)
        else:
            grouped["Other Resources"].append(resource)

    return grouped

def parse_costs(cost_file):
    """Parse a cost JSON file and return a mapping of resources to their costs."""
    try:
        with open(cost_file, "r") as f:
            data = json.load(f)
    except (json.JSONDecodeError, FileNotFoundError) as e:
        print(f"Error loading cost JSON: {e}")
        return {}

    costs = {}
    for project in data.get("projects", []):
        for detail in project.get("breakdown", {}).get("resources", []):
            resource_name = detail.get("name")
            resource_cost = detail.get("monthlyCost")
            print(f"Parsing cost for resource: {resource_name}, cost: {resource_cost}")  # Debug print
            if resource_name and resource_cost is not None:
                costs[resource_name] = resource_cost
            else:
                print(f"Skipping resource: {resource_name} due to missing cost data")  # Debug print
    print(f"Total costs parsed: {len(costs)}")  # Debug print
    return costs

def generate_plantuml(resources, connections, costs):
    """Generate PlantUML output from resources, connections, and costs."""
    output = ["@startuml"]

    # Group resources into packages
    grouped = group_resources(resources)
    for package_name, package_resources in grouped.items():
        output.append(f"package \"{package_name}\" {{")
        for resource in package_resources:
            resource_name = resource.get("address", "unnamed")
            output.append(f"  [{resource_name}]")

            # Add cost note if available
            if resource_name in costs:
                cost = costs[resource_name]
                output.append(f"  note right of [{resource_name}] : Cost: ${cost}/mo")
        output.append("}")

    # Add connections
    for src, dst in connections:
        output.append(f"[{src}] --> [{dst}]")

    output.append("@enduml")
    return "\n".join(output)

def main():
    if len(sys.argv) < 3:
        print("Usage: tfplan_to_plantuml.py <tfplan.json> <costs.json>")
        return

    json_file = sys.argv[1]
    cost_file = sys.argv[2]
    resources = parse_tfplan(json_file)
    costs = parse_costs(cost_file)

    if resources:
        connections = find_connections(resources)
        plantuml_output = generate_plantuml(resources, connections, costs)
        print(plantuml_output)
    else:
        print("No resources found in tfplan.json")

if __name__ == "__main__":
    main()
