variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}

variable "region" {
  type        = string
  description = "Default Region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "us-central1-a"
}

variable "network" {
  type = object({
    name                = string
    subnetwork_name     = string
    nodes_cidr_range    = optional(string, "10.128.0.0/20")
    pods_cidr_range     = optional(string, "10.4.0.0/14")
    services_cidr_range = optional(string, "10.8.0.0/20")
  })
  description = "value for VPC Network"
}

variable "gke" {
  type = object({
    name     = string
    regional = optional(bool, false)
    zones    = list(string)
  })
  description = "value for GKE Cluster"
}

variable "node_pool" {
  type = object({
    name               = string
    machine_type       = optional(string, "e2-small")
    spot               = optional(bool, true)
    initial_node_count = optional(number, 2)
    max_count          = optional(number, 4)
    disk_size_gb       = optional(number, 10)
  })
  description = "value for GKE Node Pool"
}

variable "service_account" {
  type = object({
    name  = string
    roles = list(string)
  })
  description = "Service Account for GKE"
}

variable "services" {
  type = list(string)
  description = "List of services to enable"
  default = [
    "cloudresourcemanager",
    "compute",
    "container",
    "iam",
    "servicenetworking",
    "artifactregistry",
    "cloudbuild",
  ]
}

variable "repository_id" {
  type = string
  description = "ID of the Artifact Registry repository"
  default = "docker-repo"
}

variable "trigger_name" {
  type = string
  description = "ID of the Cloud Build trigger"
  default = "docker-build"
}

variable "github_repo_url" {
  type = string
  description = "URL of the GitHub repository"
}

variable "github_branch" {
  type = string
  description = "Branch of the GitHub repository to use"
  default = "main"
}