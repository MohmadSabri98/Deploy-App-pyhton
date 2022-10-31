resource "google_container_cluster" "private-cluster" {
  name                     = "private-cluster"
  location                 = "us-central1-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.myvpc.id
  subnetwork               = google_compute_subnetwork.restrictedsubnet.id

  node_locations = [
    "us-central1-b"
  ]

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.0.0/24"
      display_name = "managment-cidr-range"
    }
  }

  ip_allocation_policy {

  }
   addons_config {
    http_load_balancing {
      disabled = true
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}

