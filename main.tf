module "networking" {
  source = "git::https://github.com/karol-olive/cn-networking.git?ref=v1.0.2"

  project_name = var.project_name

  vpc_cidr             = var.vpc_cidr
  vpc_additional_cidrs = var.vpc_additional_cidrs

  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets
  database_subnets = var.database_subnets
  netacl_rules     = var.netacl_rules
}

module "eks" {
  source = "git::https://github.com/karol-olive/cn-eks.git?ref=v1.1.0"

  project_name = var.project_name

  k8s_version = var.k8s_version

  ssm_private_subnets = var.ssm_private_subnets
  ssm_pod_subnets     = var.ssm_pod_subnets

  auto_scale_options   = var.auto_scale_options
  nodes_instance_sizes = var.nodes_instance_sizes
}
