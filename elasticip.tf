
resource "aws_eip" "lb" {
  instance = aws_instance.myvm.id
  domain   = "vpc"
}
## this is commented, bco to reduce the cost