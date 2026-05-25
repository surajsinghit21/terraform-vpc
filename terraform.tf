terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

    #  backend setup to store terraform state file to in s3
    #backend "s3" {
    #    bucket = "terraform-remote-backend-s3"
    #    key = "dev/terraform.tfstate"
    #    region = "ap-south-1"
    #}
}