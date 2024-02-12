provider "aws"{
    region = "us-east-2"
}

module "ec2module" {
  source = "./ec2"
  ec2Name = "Name from Modules"
}

output "module-output" {
  value = module.ec2module.instance_id
}