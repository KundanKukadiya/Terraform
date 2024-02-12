resource "aws_instance" "db-server" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"

  tags = {
    Name = "DB Sever"
  }
}

output "PrivateIP" {
  value = aws_instance.db-server_ip
}