output "workstations" {
  value = [aws_instance.workstation.*.public_ip]
}

output "workstation_webterminal_links" {
  value = formatlist(
    "https://%s",
    aws_instance.workstation.*.public_ip,
  )
}

output "workstation_password" {
  value = var.training_password
}

output "workstation_username" {
  value = var.training_username
}