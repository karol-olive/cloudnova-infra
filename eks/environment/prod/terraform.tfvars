## COMMON
project_name = "cloudnova"
region       = "eu-west-1"


## EKS - GENERAL
k8s_version = "1.32"

## EKS - NETWORKING
ssm_private_subnets = [
  "/cloudnova/subnets/private/eu-west-1a/cn-private-1a",
  "/cloudnova/subnets/private/eu-west-1b/cn-private-1b",
  "/cloudnova/subnets/private/eu-west-1c/cn-private-1c"
]

ssm_pod_subnets = [
  "/cloudnova/subnets/private/eu-west-1a/cn-pods-1a",
  "/cloudnova/subnets/private/eu-west-1b/cn-pods-1b",
  "/cloudnova/subnets/private/eu-west-1c/cn-pods-1c"
]

## EKS - CAPACITY
auto_scale_options = {
  min     = 2
  max     = 10
  desired = 2
}

nodes_instance_sizes = [
  "t3.large",
  "t3a.large"
]
