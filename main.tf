//connections.tf
provider "aws" {
  region = "us-east-1"
}
data "aws_ami" "amazon_linux_latest" {
  most_recent = true
  owners      = ["amazon"] # Official Amazon Linux AMIs are owned by 'amazon'

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # Pattern for Amazon Linux 2 AMI
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "example_instance" {
  ami           = data.aws_ami.amazon_linux_latest.id
  instance_type = "t2.micro"
  tags = {
    Name = "MyLatestAmazonLinuxInstance"
  }
}