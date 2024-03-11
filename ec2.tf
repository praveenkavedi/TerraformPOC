provider "aws" {
    region = "ap-south-1"
    
    
}
resource "aws_instance" "myvm" {
    ami = "ami-0ba259e664698cbfc"
    instance_type = "t2.micro"

    tags = {
      Name = "My First VM"
    }

}
