variable "subnet-cidr" {
 default  = ["10.0.1.0/24", "10.0.1.0/24"] 
}

variable "aws-subnet-name" {
    description = "aws subnet name"
    type = list(string)
    default = [ "tf-public-subnet-1", "tf-public-subnet-2" ]
}

variable "aws-sg-name" {
  type = string
  default = "tf-sg"
}

  variable "ami_id" {
  type = string
  default = "ami-07a00cf47dbbc844c"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "name" {
  type = list(string)
  default = [ "tf-webserver-1", "tf-webserver-2" ]
}

variable "environment" {
  type = string
  default = "dev"
}