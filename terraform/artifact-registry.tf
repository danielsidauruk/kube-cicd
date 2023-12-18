resource "google_artifact_registry_repository" "this" {
  depends_on = [ google_project_service.this["artifactregistry"] ]
  
  location      = var.region
  repository_id = var.repository_id
  description   = "Artifact Registry for Dockerize apps"
  format        = "DOCKER"
}