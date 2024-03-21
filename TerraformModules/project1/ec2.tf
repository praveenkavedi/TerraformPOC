provider "aws" {
  region = "ap-south-1"
}

module "myModuleec2" {
    source = "../appserver"
    VMtype = "t2.micro"
}
