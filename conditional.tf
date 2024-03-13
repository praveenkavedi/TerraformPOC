
variable "istest" {}

resource "aws_instance" "test" {
    ami = "ami-0ba259e664698cbfc"
    instance_type = "t2.micro"
    count = var.istest == true ? 2 : 0

    tags = {
      Name = "My Test VM"
    }

}

resource "aws_instance" "prod" {
    ami = "ami-0ba259e664698cbfc"
    instance_type = "t3.large"
    count = var.istest == false ? 1 : 0

    tags = {
      Name = "My Prod VM"
    }

}