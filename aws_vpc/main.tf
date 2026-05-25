# VPC
resource "aws_vpc" "aws_vpc_main" {
  cidr_block = "9.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "tf_vpc"
  }
}

# 2 Subnet
resource "aws_subnet" "main" {
    count = length(var.aws-subnet-cidr)
    vpc_id     = aws_vpc.aws_vpc_main.id
    cidr_block = var.aws-subnet-cidr[count.index]
    availability_zone = data.aws_availability_zones.availability_zones.names[count.index]
    map_public_ip_on_launch = true
    tags = {
        Name = var.aws-subnet-name[count.index]
    }
}


# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.aws_vpc_main.id

  tags = {
    Name = "tf-igw"
  }
}


# Route Table
resource "aws_route_table" "route-Table" {
  vpc_id = aws_vpc.aws_vpc_main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "tf-route-table"
  }
}


# Route Table association
resource "aws_route_table_association" "route_table_association" {
  count = length(var.aws-subnet-cidr)
  subnet_id      = aws_subnet.main[count.index].id
  route_table_id = aws_route_table.route-Table.id
}
