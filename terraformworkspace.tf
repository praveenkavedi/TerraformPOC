

resource "aws_instance" "WorkspaceInstance" {
  ami           = "ami-0ba259e664698cbfc"
  instance_type = lookup(var.ins_type,terraform.workspace)

  tags = {
      Name = "workspaceInstance"
  }
  
}
variable "ins_type" {
    type = map
    default = {
        default = "t2.micro"
        dev     = "t2.small"
        prod    = "t2.large"
    }
}

