resource "aws_vpc" "moduleVPC" {
  cidr_block       = "10.100.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "moduleVPC"
  }
}


resource "aws_security_group" "SGModules" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.moduleVPC.id
  tags = {
    Name = "allow_tls"
  }
}

locals {
  https = 8080
}

locals {
  ssh = 22
}
resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.SGModules.id
  cidr_ipv4         = aws_vpc.moduleVPC.cidr_block
  from_port         = local.https
  ip_protocol       = "tcp"
  to_port           = local.https
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.SGModules.id
  cidr_ipv4         = aws_vpc.moduleVPC.cidr_block
  from_port         = local.ssh
  ip_protocol       = "tcp"
  to_port           = local.ssh
}

##Below ingress is for elastic IP

