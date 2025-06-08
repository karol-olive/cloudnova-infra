################################################################## START COMMON ####################################################################
project_name = "cloudnova"
region       = "eu-west-1"
################################################################## END COMMON ######################################################################

################################################################## START EKS #######################################################################
k8s_version = "1.32"

ssm_private_subnets = [
  "/cloudnova/subnets/private/eu-west-1a/cn-private-1a",
  "/cloudnova/subnets/private/eu-west-1a/cn-private-1b",
  "/cloudnova/subnets/private/eu-west-1a/cn-private-1c"
]

ssm_pod_subnets = [
  "/cloudnova/subnets/private/eu-west-1c/cn-pods-1a",
  "/cloudnova/subnets/private/eu-west-1c/cn-pods-1b",
  "/cloudnova/subnets/private/eu-west-1c/cn-pods-1c"
]

auto_scale_options = {
  min     = 2
  max     = 10
  desired = 2
}

nodes_instance_sizes = [
  "t3.large",
  "t3a.large"
]

################################################################## END EKS ###########################################################################
