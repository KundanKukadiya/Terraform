variable "server-names" {
  type = list(string)
}

resource "aws_instance" "db-server" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"
  count = length(var.server-names)

  tags = {
    Name = var.server-names[count.index]
  }
}

output "PrivateIP" {
  value = [aws_instance.db-server.*.private_ip]
}