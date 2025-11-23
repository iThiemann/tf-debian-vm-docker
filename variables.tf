
variable "container_name" {
  type        = string
  default     = "local-debian-vm"
  description = "Name of the Debian container used as local linux VM"
}

variable "debian_image" {
  type        = string
  default     = "debian:bookworm-slim"
  description = "Docker image for the Debian container"
}

variable "cloud_init_config_base64" {
  type        = string
  default     = ""
  description = "Optional Base64-encoded cloud-init style user-data (placeholder)"
}

variable "host_data_dir" {
  type        = string
  default     = "./data"
  description = "Host directory to mount into the container"
}
