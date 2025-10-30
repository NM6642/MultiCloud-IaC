# AWS EC2 Instance
resource "aws_instance" "ec2_instance" {
  ami                         = var.aws_ami_id
  instance_type               = var.aws_instance_type
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "AWS_VM"
  }
}
