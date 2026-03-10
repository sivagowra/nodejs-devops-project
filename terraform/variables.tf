variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the existing AWS key pair to attach to instances"
  type        = string
  default     = ""
}
