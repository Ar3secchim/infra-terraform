# aws_instance ec2 zona a
resource "aws_instance" "ec2-zona-a" {
  ami               = "ami-063d43db0594b521b"
  instance_type     = "t2.micro"
  subnet_id         = aws_subnet.subnet-private-a.id
  availability_zone = "us-east-1a"

  vpc_security_group_ids = [aws_security_group.allow_http.id]

  tags = {
    Name = "ec2-zona-a"
  }
}

# aws_instance ec2 zona b
resource "aws_instance" "ec2-zona-b" {
  ami               = "ami-063d43db0594b521b"
  instance_type     = "t2.micro"
  subnet_id         = aws_subnet.subnet-private-b.id
  availability_zone = "us-east-1b"

  vpc_security_group_ids = [aws_security_group.allow_http.id]

  tags = {
    Name = "ec2-zona-b"
  }
}

# aws_instance ec2 zona c
resource "aws_instance" "ec2-zona-c" {
  ami               = "ami-063d43db0594b521b"
  instance_type     = "t2.micro"
  subnet_id         = aws_subnet.subnet-private-c.id
  availability_zone = "us-east-1c"

  vpc_security_group_ids = [aws_security_group.allow_http.id]

  tags = {
    Name = "ec2-zona-c"
  }
}
