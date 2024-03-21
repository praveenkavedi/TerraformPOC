resource "aws_instance" "myec2" {
   ami = "ami-0ba259e664698cbfc"
   instance_type = "t2.micro"
   key_name = "terraform_provisioner"

   

   connection {
   type     = "https"
   user     = "ec2-user"
   private_key = file("./terraform_provisioner.pem")
   host     = self.public_ip
    }

 provisioner "remote-exec" {
   inline = [
    # Updating with the latest command for Amazon Linux machine
     "sudo yum install -y nginx",
     "sudo systemctl stop nginx"
   ]
 }
}