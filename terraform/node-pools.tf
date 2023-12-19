resource "google_container_node_pool" "general" {
  name       = var.node_pool.name
  cluster    = google_container_cluster.primary.id
  node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = var.node_pool.machine_type

    labels = {
      role = "general"
    }

    service_account = google_service_account.this.email
    
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

    autoscaling {
      min_node_count = 0
      max_node_count = 5
  }
}

# resource "google_container_node_pool" "spot" {
#   name    = "spot"
#   cluster = google_container_cluster.primary.id

#   management {
#     auto_repair  = true
#     auto_upgrade = true
#   }

  # autoscaling {
  #   min_node_count = 0
  #   max_node_count = 10
  # }

#   node_config {
#     preemptible  = true
#     machine_type = "e2-small"

#     labels = {
#       team = "devops"
#     }

#     taint {
#       key    = "instance_type"
#       value  = "spot"
#       effect = "NO_SCHEDULE"
#     }

#     service_account = google_service_account.kubernetes.email
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
# }
