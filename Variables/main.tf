# variable type : String
variable "vpcname" {
  type = string
  default = "myvpc"
}

# variable type : number
variable "sshport" {
  type = number
  default = 22
}

# variable type : boolean
variable "enabled" {
  default = true
}


