provider "aws"{
    region = "us-east-2"
}

resource "aws_vpc" "TerraformVPC" {
  cidr_block = "198.168.0.1/24"
  tags = {
    Name = "TerraformVPC"
  }
}