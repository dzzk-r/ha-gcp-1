resource "google_compute_security_policy" "cloud_armor_policy" {
  name = "cloud-armor-policy"
}

#####
#####
#####  Rule 1: Slow-Loris attack ~ Job upon hearing ;)
#####  rule {
#####    action   = "deny(403)"
#####    priority = 1000
#####    match {
#####      expr {
#####        expression = "request.headers['Content-Length'].intValue() > 0 && ...
#####           request.headers['Content-Length'].intVal....
#####      }
#####    }
#####    description = "Block Slow-Loris by filtering requests."
#####  }
#####
#####  Rule 2: Rate limit requests ~ DDoS Mitigation
#####  rule {
#####    action   = "rate_based_ban"
#####    priority = 1100
#####    match {
#####      versioned_expr = "SRC_...
#####    }
#####    rate_limit_options {
#####      enforce_on_key         = "...
#####      rate_limit_threshold {
#####        count        = XXX
#####        interval...
#####      }
#####      ban... 770
#####    }
#####    description = "Limit requests to ..."
#####  }
#####
#####  Rule 3: Block...
#####  rule {
#####    action   = "deny(403)"
#####    priority = 1299
#####    ...
#####    description = "Block traffic ..."
#####  }
#####
#####  Rule 4: Allow all other
#####  rule {
#####    action   = "allow"
#####    priority = 2147483647
#####    match {
#####      ve........
#####    }
#####    description = "Allow others."
#####  }
#####
#####. Rule 6:   description = "SQL Injection / XSS "
#####. Rule 11:   ...
