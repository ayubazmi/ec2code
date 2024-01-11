provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "dev_instance" {
  ami           = "ami-05fb0b8c1424f266b"
  instance_type = "t2.micro"

  key_name = "todo-key"  

  vpc_security_group_ids = ["${aws_security_group.instance_sg.id}"]

  tags = {
    Name = "dev-instance"
  }
}

resource "aws_instance" "prod_instance" {
  ami           = "ami-05fb0b8c1424f266b"
  instance_type = "t2.micro"

  key_name = "todo-key"  

  vpc_security_group_ids = ["${aws_security_group.instance_sg.id}"]

  tags = {
    Name = "prod-instance"
  }
}

resource "aws_security_group" "instance_sg" {
  name        = "instance_sg"
  description = "Security group allowing all traffic, SSH, HTTP, and HTTPS"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22   # SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80   # HTTP
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443   # HTTPS
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
