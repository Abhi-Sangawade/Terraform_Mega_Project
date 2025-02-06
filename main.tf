resource "aws_instance" "my_terraform" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  user_data = file("userdata.sh")  # Attach user data script

  tags = {
    Name = "Terraform-WebServer"
  }
}
