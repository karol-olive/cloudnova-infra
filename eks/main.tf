module "eks" {
  source = "git::https://github.com/karol-olive/cn-eks.git?ref=v1.1.0"

  project_name = var.project_name

  k8s_version = var.k8s_version

  ssm_private_subnets = var.ssm_private_subnets
  ssm_pod_subnets     = var.ssm_pod_subnets

  auto_scale_options   = var.auto_scale_options
  nodes_instance_sizes = var.nodes_instance_sizes
}
