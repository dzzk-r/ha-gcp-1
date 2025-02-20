package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformBasicSetup(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../",
		NoColor:      true,
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	vpcName := terraform.Output(t, terraformOptions, "vpc_name")
	assert.NotEmpty(t, vpcName, "VPC name should not be empty")

	instanceCount := terraform.Output(t, terraformOptions, "instance_count")
	assert.NotEmpty(t, instanceCount, "Instance count should not be empty")
}
