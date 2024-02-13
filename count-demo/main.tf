provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = "ami-032598fcc7e9d1c7a"
  instance_type = "t2.micro"
  
  #it will create 3 instaces
  count = 3

}