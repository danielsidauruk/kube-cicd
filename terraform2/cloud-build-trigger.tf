resource "google_cloudbuild_trigger" "manual-trigger" {
  name        = var.trigger_name
  
  depends_on = [google_project_service.this["cloudbuild"]]

  source_to_build {
    uri       = var.github_repo_url
    ref       = "refs/heads/main"
    repo_type = "GITHUB"
  }

  git_file_source {
    path      = "cloudbuild.yaml"
    uri       = var.github_repo_url
    revision  = "refs/heads/main"
    repo_type = "GITHUB"
  }

  approval_config {
     approval_required = true 
  }

  # service_account = google_service_account.this.email
}