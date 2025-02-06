output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.my_terraform.id
}

output "public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.my_terraform.public_ip
}
