## COMMON
variable "project_name" {
  type        = string
  description = "The project name to compose the resources name"
}

variable "region" {
  type        = string
  description = "The region where the resources will be deployed"
}

## EKS - GENEARL
variable "k8s_version" {
  type        = string
  description = "The kubernetes version"
}

## EKS - ADDON
variable "addon_cni_version" {
  type        = string
  default     = ""
  description = "AddOn CNI version"
}


## EKS - NETWORKING
variable "ssm_private_subnets" {
  type        = list(string)
  description = "Private subnetes ssm parameter id"
}

variable "ssm_pod_subnets" {
  type        = list(string)
  description = "Pod subnetes ssm parameter id"
}


## EKS - CAPACITY
variable "auto_scale_options" {
  type = object({
    min     = number
    max     = number
    desired = number
  })
  description = "The values for auto scale"
}

variable "nodes_instance_sizes" {
  type        = list(string)
  description = "The type instance of the nodes"
}

