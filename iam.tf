resource "aws_iam_user" "family" {
  name = var.iamusers[count.index]
  path = "/system/"
  count=3
  tags = {
    tag-key = "tag-value"
  }
}