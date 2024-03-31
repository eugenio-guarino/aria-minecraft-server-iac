resource "google_compute_instance" "aria_server" {

  name         = var.instance_name
  machine_type = "n2-highmem-4"
  tags         = ["minecraft-server"]
  zone         = var.zone

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }

  service_account {
    email  = var.service_account
    scopes = ["storage-rw", "monitoring"]
  }

  scheduling {
    preemptible                 = true
    automatic_restart           = false
    provisioning_model          = "SPOT"
    instance_termination_action = "DELETE"
  }

  metadata = {
    # Enable compute os-login GCP role at instance level
    enable-oslogin = "TRUE"
    startup-script = file("./scripts/config.sh")
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }
}

resource "google_compute_attached_disk" "aria-data-disk" {
  disk     = "aria-minecraft-data"
  instance = google_compute_instance.aria_server.id
}