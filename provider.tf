##################################################################################
# PROVIDDER
##################################################################################
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.65.0"
    }
  }
}

provider "google" {
  project = "thandiwekhalaki"
  region  = var.region
  zone    = var.zone
}
provider "google-beta" {
  version = "~> 3.38"
  
}