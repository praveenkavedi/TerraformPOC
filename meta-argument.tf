resource "aws_instance" "meta-argument" {
  ami           = "ami-0ba259e664698cbfc"
  instance_type = "t2.micro"

  tags = {
    Name = "dev"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}