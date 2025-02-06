provider "aws" {
  region = "us-east-1" # Change to your preferred AWS region
}

resource "aws_instance" "web" {
  ami           = "ami-085ad6ae776d8f09"  # Amazon Linux 2 AMI (Check for the latest AMI)
  instance_type = "t2.micro"              # Free-tier eligible
  key_name      = "database.pem"         # Replace with your actual key pair name

  security_groups = [aws_security_group.web_sg.name]  # Attach security group

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>Welcome to Terraform</h1>" > /var/www/html/index.html
  EOF

  tags = {
    Name = "Terraform-Instance"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from any IP (Not secure, restrict it in production)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
