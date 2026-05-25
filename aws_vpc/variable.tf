variable "aws-subnet-cidr" {
    description = "aws subnet cidr"
    type = list(string)
}

variable "aws-subnet-name" {
    description = "aws subnet name"
    type = list(string)
    default = [ "tf-public-subnet-1", "tf-public-subnet-2" ]
}