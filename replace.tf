resource "aws_instance" "replace_instance" {
  ami           = "ami-0ba259e664698cbfc"
  instance_type = "t2.micro"

  tags = {
    Name = "replace_instance"
  }

}