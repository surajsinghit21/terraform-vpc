resource "aws_instance" "ec2_instance" {
  count = length(var.name)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  #key_name                    = var.key_name

  subnet_id                   = var.subnet_id[count.index]
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  availability_zone = data.aws_availability_zones.availability_zones.names[count.index]
  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name        = var.name[count.index]
    Environment = var.environment
  }
}
