output "dev_instance_id" {
  description = "Dev EC2 Instance ID"
  value       = aws_instance.dev_server.id
}

output "dev_instance_public_ip" {
  description = "Dev EC2 Instance Public IP"
  value       = aws_instance.dev_server.public_ip
}

output "prod_instance_id" {
  description = "Prod EC2 Instance ID"
  value       = aws_instance.prod_server.id
}

output "prod_instance_public_ip" {
  description = "Prod EC2 Instance Public IP"
  value       = aws_instance.prod_server.public_ip
}

output "security_group_id" {
  description = "Security Group ID"
  value       = aws_security_group.web_sg.id
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}