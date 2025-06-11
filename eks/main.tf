module "eks" {
  source = "git::https://github.com/karol-olive/cn-eks.git?ref=d43595f29e6007e9c8f49c882df4c76ccf651c7a" #v1.7.0

  project_name = var.project_name

  k8s_version       = var.k8s_version
  addon_cni_version = var.addon_cni_version

  ssm_vpc             = data.aws_ssm_parameter.vpc.value
  ssm_private_subnets = data.aws_ssm_parameter.private_subnets[*].value
  ssm_pod_subnets     = data.aws_ssm_parameter.pod_subnets[*].value

  auto_scale_options   = var.auto_scale_options
  nodes_instance_sizes = var.nodes_instance_sizes

  karpenter_capacity = var.karpenter_capacity
}
