output "vpc_id" {
  value = aws_vpc.aws_vpc_main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}