resource "google_container_node_pool" "cluster-pool" {
  name           = "cluster-pool"
  cluster        = google_container_cluster.private-cluster.id
  node_count     = 1

  autoscaling {
    max_node_count = 1
    min_node_count = 1
  }
  max_pods_per_node = 110

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = true
    disk_size_gb = 10
    machine_type = "e2-medium"

    labels = {
      role = "cluster-pool"
  }

  oauth_scopes = [
    "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
        "https://www.googleapis.com/auth/cloud-platform"
  ]

  service_account = google_service_account.node-service-account.email
  }

}