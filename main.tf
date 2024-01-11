

provider "aws" {
  region = "us-east-2"  
}


resource "aws_instance" "dev_instance" {
  ami           = "ami-05fb0b8c1424f266b"  
  instance_type = "t2.micro"              

  tags = {
    Name = "dev-instance"
  }
}


resource "aws_instance" "prod_instance" {
  ami           = "ami-05fb0b8c1424f266b"  
  instance_type = "t2.micro"             

  tags = {
    Name = "prod-instance"
  }
}

