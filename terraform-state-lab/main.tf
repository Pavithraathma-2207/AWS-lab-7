terraform {
  backend "s3" {
    bucket         = "terraform-state-pavithra"  # Replace with your S3 bucket
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-00a929b66ed6e0de6"  # Replace with a valid AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Test-Instance"
  }
}
