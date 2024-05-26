resource "google_compute_instance" "ksa-rafi-stg-win-vm" {
  for_each = var.vms

  dynamic "attached_disk" {
    for_each = each.value.data_disk == "true" ? [1] : []
    content {
      device_name = each.value.name
      source      = "projects/${var.project_id}/zones/${var.zone}/disks/${each.value.name}"
      mode        = "READ_WRITE"
    }

  }


  boot_disk {
    auto_delete = true
    device_name = each.value.name

    initialize_params {
      image = "projects/windows-cloud/global/images/windows-server-2022-dc-v20240214"
      size  = 200
      type  = "pd-ssd"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    server-type = each.value.server_type
  }

  machine_type = each.value.machine_type
  name         = each.value.name

  network_interface {
    network_ip  = each.value.ip_add
    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/${var.project_id}/regions/${var.region}/subnetworks/${each.value.subnet}"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = google_service_account.compute.email #each.value.sa_account
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  tags       = each.value.network_tag
  zone       = each.value.zone
  depends_on = [google_compute_disk.data-disk, google_compute_network.vpc-staging]
}