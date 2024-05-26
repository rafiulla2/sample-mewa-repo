terraform {
  backend "gcs" {
    # Please check these values 
    bucket = "tf-state-rafi-staging"
    prefix = "terraform/landing_zone_staging/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.00"
    }
  }
}

provider "google" {
  # add project name and zone 
  project = var.project_id
  region  = var.region
  zone    = var.zone
}