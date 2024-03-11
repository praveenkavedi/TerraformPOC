provider "aws" {
    region = "ap-south-1"
    #access_key = "AKIAXYKJSZ2JAI6D2FP7"
    
}
resource "aws_instance" "myvm" {
    ami = "ami-0ba259e664698cbfc"
    instance_type = "t2.micro"

    tags = {
      Name = "My 1st VM"
    }

}
