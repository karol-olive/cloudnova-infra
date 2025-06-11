## COMMON
project_name = "cloudnova"
region       = "eu-west-1"


## EKS - GENERAL
k8s_version = "1.32"

## EKS - ADDON
addon_cni_version = "v1.19.5-eksbuild.3"

## EKS - NETWORKING
ssm_vpc = "/cloudnova/vpc/id"

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

## KARPENTER_CAPACITY
karpenter_capacity = [
  {
    name               = "cloudnova-critical"
    workload           = "critical-workload"
    ami_family         = "AL2023"
    ami_ssm            = "/aws/service/eks/optimized-ami/1.32/amazon-linux-2023/x86_64/standard/recommended/image_id"
    instance_family    = ["t3", "t2"]
    instance_sizes     = ["large", "medium"]
    capacity_type      = ["on-demand"]
    availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  },
  {
    name               = "cloudnova-chip"
    workload           = "chip-workload"
    ami_family         = "AL2023"
    ami_ssm            = "/aws/service/eks/optimized-ami/1.32/amazon-linux-2023/x86_64/standard/recommended/image_id"
    instance_family    = ["t3", "t2"]
    instance_sizes     = ["medium", "large"]
    capacity_type      = ["on-demand"]
    availability_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  }
]
