provider "aws" {
  region     = "us-east-2"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
resource "aws_security_group" "sgPublic" {
  name        = "ec2_sg"
  description = "Allow http and SSH traffic"
  vpc_id      = "vpc-b9d4bbd2"
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP Inbound"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    to_port     = 0
    from_port   = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "name" = "Basic Security Group"
  }
}
resource "aws_instance" "webserver" {
  ami                         = var.ami_id
  instance_type               = "t2.micro"
  key_name                    = var.ssh_key
  associate_public_ip_address = true
  subnet_id                   = "subnet-40d2e60c"
  vpc_security_group_ids      = [aws_security_group.sgPublic.id]
  user_data = "${file("install_apache.sh")}"

  tags = {
    "name" = "Basic Webserver"
  }
}