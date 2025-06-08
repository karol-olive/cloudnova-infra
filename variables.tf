################################################################## START GENERAL #################################################################
variable "project_name" {
  type        = string
  description = "The project name to compose the resources name"
}

variable "region" {
  type        = string
  description = "The region where the resources will be deployed"
}
################################################################## END GENERAL #####################################################################



################################################################## START NETWORKING #################################################################

## VPC ##
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "vpc_additional_cidrs" {
  type        = list(string)
  description = "CIDR's block addicional list"
  default     = []
}

## SUBNETS ##
variable "public_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
  description = "Public subnets list"
}

variable "private_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
  description = "Private subnets list"
}

variable "database_subnets" {
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
  default     = []
  description = "Database subnets list. This kind of subnet is private and doens't have connection with internet and need to have network acl's"
}

## Network ACL's ##
variable "netacl_rules" {
  type = list(object({
    rule_number = number
    rule_action = string
    protocol    = string
    cidr_block  = string
    from_port   = number
    to_port     = number
  }))
  default     = []
  description = <<EOD
    List of Network ACL's for database subnet if applicable.

    Must contain:
      * rule_number: Number of the rule. Remember that rules are evaluated starting with the lowest numbered, more information here. https://docs.aws.amazon.com/vpc/latest/userguide/nacl-rules.html
      * rule_action: Allow or Deny.
      * protocol: The kind of protocol, to all use "-1" 
      * cidr_block: From where cidr the request will income.
      * from_port: original port
      * to_port: destination port
  EOD
}
################################################################## END NETWORKING #####################################################################

################################################################## START EKS ##########################################################################


## EKS - GENEARL
variable "k8s_version" {
  type        = string
  description = "The kubernetes version"
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

################################################################## END EKS ###########################################################################
