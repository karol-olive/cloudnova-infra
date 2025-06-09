module "eks" {
  source = "git::https://github.com/karol-olive/cn-eks.git?ref=2f11d1a2eaf193ae3fe100f441519391e22d698c" #v1.5.4

  project_name = var.project_name

  k8s_version       = var.k8s_version
  addon_cni_version = var.addon_cni_version

  ssm_private_subnets = data.aws_ssm_parameter.private_subnets[*].value
  ssm_pod_subnets     = data.aws_ssm_parameter.pod_subnets[*].value

  auto_scale_options   = var.auto_scale_options
  nodes_instance_sizes = var.nodes_instance_sizes

  karpenter_capacity = var.karpenter_capacity
}
