variable "instance_id" {
  type = string

}

resource "aws_eip" "web-ip" {
  instance = var.instance_id
}

output "PublicIP" {
  value = aws_eip.web-ip.public_ip
}