resource "aws_instance" "mymoduleVM" {
  ami           = "ami-0ba259e664698cbfc"
  instance_type = var.VMtype

  tags = {
      Name = "Projects"
  }
  
}