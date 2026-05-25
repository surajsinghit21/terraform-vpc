variable "sg_id" {
  type = string
}

variable "subnet_id" {
  type = list(string)
}


variable "vpc_id" {
  type = string
}

variable "instance" {
  description = "instance id for attachment group"
  type = list(string)
}