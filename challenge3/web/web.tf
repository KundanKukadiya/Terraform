resource "aws_instance" "web-server" {
  ami             = "ami-032598fcc7e9d1c7a"
  instance_type   = "t2.micro"
  security_groups = [module.sg.sg_name]
  user_data       = file("./web/server-script.sh")

  tags = {
    Name = "web Server"
  }

}

output "public_ip" {
  value = module.eip.PublicIP
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.web-server.id
}

module "sg" {
  source = "../sg"
}