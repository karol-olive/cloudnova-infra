## COMMON
variable "project_name" {
  type        = string
  description = "The project name to compose the resources name"
}

variable "region" {
  type        = string
  description = "The region where the resources will be deployed"
}

## HELM
variable "helm_metrics_server_version" {
  type        = string
  description = "The helm metric server version"
}

variable "helm_kube_state_metrics_version" {
  type        = string
  description = "The helm metric server version"
}
