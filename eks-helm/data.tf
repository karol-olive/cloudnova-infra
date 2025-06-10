data "aws_eks_cluster" "main" {
  name = format("%s-eks", var.project_name)
}

data "aws_eks_cluster_auth" "default" {
  name = data.aws_eks_cluster.main.id
}

