terraform {
  backend "gcs" {
    bucket = "cicd-gke-tf-state"
    prefix = "terraform/state"
  }
}