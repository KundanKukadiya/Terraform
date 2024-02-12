provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "db-server" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Sever"
  }
}

resource "aws_instance" "web-server" {
  ami             = "ami-032598fcc7e9d1c7a"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web-traffic.name]
  user_data       = file("server-script.sh")

  tags = {
    Name = "web Server"
  }

}

resource "aws_eip" "web-ip" {
  instance = aws_instance.web-server.id
}

variable "ingress" {
  type    = list(number)
  default = [80, 443]
}

variable "egress" {
  type    = list(number)
  default = [80, 443]
}

resource "aws_security_group" "web-traffic" {
  name = "Allow web Traffic"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "PrivateIP" {
  value = aws_instance.db-server_ip
}

output "PublicIP" {
  value = aws_eip.web-ip.public_ip
}