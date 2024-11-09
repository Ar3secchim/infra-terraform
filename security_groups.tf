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

  tags = {
    Name = "allow_http_rule"
  }
}

#security group for ec2 egress
resource "aws_vpc_security_group_egress_rule" "allow_all_egress" {
  security_group_id = aws_security_group.allow_http.id

  cidr_ipv4   = var.INTERNET_GATEWAY
  ip_protocol = "-1"
  to_port     = 0
  from_port   = 0

  tags = {
    Name = "allow_all_egress"
  }
}

# security group for load balancer
resource "aws_security_group" "allow_lb" {
  name        = "allow_lb"
  description = "Allow trafiic http "
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_lb"
  }
}

# security group for load balancer ingress
resource "aws_security_group_rule" "load_balancer_allow_http" {
  cidr_blocks = [aws_vpc.main.cidr_block]

  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "-1"
  security_group_id = aws_security_group.allow_lb.id
}

