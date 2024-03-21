/*
variable "user_names" {
  type = list
  default = ["user-0","user-1", "user-2", "user-3"]
}
*/

resource "aws_iam_user" "setUsers" {
  for_each =  toset( ["user-0","user-1", "user-2", "user-3"] )
  name = each.key
}

resource "aws_iam_user" "family" {
  name  = var.iamusers[count.index]
  path  = "/system/"
  count = 3
  tags = {
    tag-key = "tag-value"
  }
}



