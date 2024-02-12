provider "aws"{
    region = "us-east-2"
}

resource "aws_instance" "ec2" {
  ami = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"
}

resource "aws_eip" "elasticIP" {
  instance = aws_instance.ec2.id
}

output "Eip" {
  value = aws_eip.elasticIP.public_ip
}