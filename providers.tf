
terraform {
  required_version = ">= 1.14.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

provider "docker" {
  # Default: uses unix:///var/run/docker.sock
  # For Docker Desktop on macOS/Windows, this is usually fine
  # as soon as Docker Desktop is running and "docker ps" works.
  #
  # If you ever need to override:
  # host = "unix:///var/run/docker.sock"
}
