module "eks" {
  source = "git::https://github.com/karol-olive/cn-eks.git?ref=6b4da84a945dcb9827b79b26f6ce32dc46b20832" #v1.6.0

  project_name = var.project_name

  k8s_version       = var.k8s_version
  addon_cni_version = var.addon_cni_version

  ssm_private_subnets = data.aws_ssm_parameter.private_subnets[*].value
  ssm_pod_subnets     = data.aws_ssm_parameter.pod_subnets[*].value

  auto_scale_options   = var.auto_scale_options
  nodes_instance_sizes = var.nodes_instance_sizes

  karpenter_capacity = var.karpenter_capacity
}
