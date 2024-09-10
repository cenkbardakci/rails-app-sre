resource "aws_instance" "rails_app" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  key_name = aws_key_pair.deployer.key_name

  security_groups = [
    aws_security_group.rails_sg.name
  ]
}