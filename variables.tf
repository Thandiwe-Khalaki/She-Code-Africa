##################################################################################
# VARIABLES
##################################################################################
# variable region {
#   default = "us-central1"
# }

# variable network {
#   default = "default"
# }

variable zone {
  default = "us-central1-a"
}

variable organization_id {}
variable project_name {}
variable credentials_path {}
variable billing_account {}
variable project_id {}

variable "cluster_name" {
  description = "The name for the GKE cluster"
  default     = "gke-cluster"
}
variable "env_name" {
  description = "The environment for the GKE cluster"
  default     = "dev"
}
variable "region" {
  description = "The region to host the cluster in"
  default     = "us-central1-a"
}
variable "network" {
  description = "The VPC network created to host the cluster in"
  default     = "gke-network"
}
variable "subnetwork" {
  description = "The subnetwork created to host the cluster in"
  default     = "gke-subnet"
}
variable "ip_range_pods_name" {
  description = "The secondary ip range to use for pods"
  default     = "ip-range-pods"
}
variable "ip_range_services_name" {
  description = "The secondary ip range to use for services"
  default     = "ip-range-services"
}
