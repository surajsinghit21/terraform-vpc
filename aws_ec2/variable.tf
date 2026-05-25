  variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = list(string)
}

variable "sg_id" {
  type = string
}

variable "name" {
  type = list(string)
  default = [ "tf-webserver-1", "tf-webserver-2" ]
}

variable "environment" {
  type = string
}