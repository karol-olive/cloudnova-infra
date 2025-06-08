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
