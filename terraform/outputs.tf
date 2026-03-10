output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.node_server.id
}

output "instance_public_ip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.node_server.public_ip
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.web_sg.id
}