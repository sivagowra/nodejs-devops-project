provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "web_sg" {
  name = "nodejs-sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "node_server" {

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "nodejs-devops-server"
  }
}