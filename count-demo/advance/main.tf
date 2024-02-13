provider "aws" {
  region = "us-east-2"
}

module "db" {
  source = "./db"
  server-names = [ "mariadb","mysql","mssql" ]

}

output "private_ips" {
  value = module.db.PrivateIP
}