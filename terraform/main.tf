provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "rails_sg" {
  name        = "rails_sg"
  description = "Allow SSH, HTTP, and monitoring ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "rails_app" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  key_name = aws_key_pair.deployer.key_name

  security_groups = [
    aws_security_group.rails_sg.name
  ]

  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo amazon-linux-extras install -y ruby3.0
  sudo yum install -y git postgresql redis nodejs yarn

  cd /home/ec2-user
  git clone https://github.com/your_username/your_repo.git
  cd your_repo

  chmod +x provision.sh
  ./provision.sh
  EOF

  tags = {
    Name = "rails_app_server"
  }
}

output "ec2_instance_public_ip" {
  value = aws_instance.rails_app.public_ip
}

