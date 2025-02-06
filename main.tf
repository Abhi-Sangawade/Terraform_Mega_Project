resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = file("userdata.sh")  # Attach user data script

  tags = {
    Name = "Terraform-WebServer"
  }
}
