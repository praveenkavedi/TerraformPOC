provider "aws" {
  region = "ap-south-1"
}

locals {
  common_tag = {
    Name = "From Local Praveen"
  }

}
resource "aws_instance" "myvm" {
  ami           = "ami-0ba259e664698cbfc"
  instance_type = "t2.micro"

  tags = local.common_tag

/*
  lifecycle {
    prevent_destroy = true
  }
*/

 lifecycle {
    ignore_changes = [tags]
  }
  
}
/*
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
*/


output "EIP" {
  value = aws_eip.lb.public_ip
}