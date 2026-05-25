module "vpc" {
  source = "./aws_vpc"
  aws-subnet-cidr = var.subnet-cidr
  aws-subnet-name = var.aws-subnet-name
}

module "sg" {
  source = "./aws_sg"
  name = var.aws-sg-name
  vpcid = module.vpc.vpc_id
  depends_on = [ module.vpc ]
}

module "ec2" {
    source = "./aws_ec2"
    name = var.name
    environment = var.environment
    instance_type = var.instance_type
    sg_id = module.sg.sg_id
    ami_id = var.ami_id
    subnet_id = module.vpc.subnet_id
  depends_on = [ module.vpc, module.sg ]
}

module "alb" {
  source = "./aws_alb"
  vpc_id = module.vpc.vpc_id
  sg_id = module.sg.sg_id
  subnet_id = module.vpc.subnet_id
  depends_on = [ module.vpc, module.sg, module.ec2 ]
  instance = module.ec2.instance
}