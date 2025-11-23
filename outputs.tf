
output "container_id" {
  description = "ID of the Debian container"
  value       = docker_container.linux_vm.id
}

output "container_name" {
  description = "Name of the Debian container"
  value       = docker_container.linux_vm.name
}
