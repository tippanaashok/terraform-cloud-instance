resource "aws_instance" "web" {
  ami                         = "ami-04505e74c0741db8d" #Ubuntu 20.04 LTS Free Tier Image
  instance_type               = "t3.micro"
  key_name                    = "ansible-key"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_http_ssh.id]
  user_data                   = file("nginx-install.sh")
  availability_zone           = "us-east-1d"
  associate_public_ip_address = true

  tags = {
    "Name" = "WebApp-terraform"
  }
}
