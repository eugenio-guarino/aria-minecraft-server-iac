resource "google_compute_instance" "aria_server" {
  name         = var.instance_name
  machine_type = "n2-highmem-4"
  zone         = var.zone
  tags         = ["minecraft-server"]

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-13"
      size  = 10
      type  = "pd-balanced"
    }
  }

  attached_disk {
    source      = "aria-minecraft-server-data"
  }

  network_interface {
    network    = "minecraft-aria-network"
    subnetwork = "minecraft-aria-subnet-euw8"
    access_config {}
  }

  service_account {
    email  = var.service_account
    scopes = ["cloud-platform"]
  }

  scheduling {
    preemptible                 = true
    automatic_restart           = false
    provisioning_model          = "SPOT"
    instance_termination_action = "DELETE"
  }

  metadata = {
    enable-oslogin  = "TRUE"
    startup-script  = file("./scripts/config.sh")
    shutdown-script = file("./scripts/shutdown.sh")
  }

  labels = {
    app = "aria-minecraft-server"
  }
}
