provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.58.0"
    }
  }
  backend "gcs" {
    bucket = "aria-minecraft-server"
    prefix = "terraform"
  }
}
