
resource "docker_image" "debian" {
  name = var.debian_image
}

resource "docker_container" "linux_vm" {
  name  = var.container_name
  image = docker_image.debian.image_id

  # Keep the container alive
  command     = ["sleep", "infinity"]
  tty         = true
  stdin_open  = true
  restart     = "unless-stopped"

  # Placeholder for future cloud-init usage
  env = [
    "CLOUD_INIT_CONFIG_BASE64=${var.cloud_init_config_base64}"
  ]

  # Mount a local folder for data/configs, logs, etc.
  volumes {
    host_path      = abspath(var.host_data_dir)
    container_path = "/mnt/data"
  }
}
