## SECURITY GROUPS 
# security group for ec2 access
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow trafiic on port 80"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_http"
  }
}

# security group for acess http
resource "aws_vpc_security_group_ingress_rule" "allow_http_rule" {
  security_group_id = aws_security_group.allow_http.id

  cidr_ipv4   = "10.0.0.0/16"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}


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
