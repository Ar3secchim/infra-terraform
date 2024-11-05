# Description: This file contains the configuration of the VPC, subnets, internet gateway, nat gateway and route table.
resource "aws_vpc" "main" {
  cidr_block = var.VPC-CIDR

  tags = {
    Name = "main-vpc"
  }
}

# subnet public-a
resource "aws_subnet" "public-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-public-a"
  }

  depends_on = [aws_vpc.main]
}

# subnet public-b
resource "aws_subnet" "public-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet-public-b"
  }

  depends_on = [aws_vpc.main]
}

# subnet public-c
resource "aws_subnet" "public-c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "subnet-public-c"
  }

  depends_on = [aws_vpc.main]
}

# internet gateway public 
resource "aws_internet_gateway" "gw-public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "gw-public"
  }

  depends_on = [aws_vpc.main]
}

# Allocation ip (Elastic IP) public-a
resource "aws_eip" "eip-nat-public-a" {
  depends_on = [aws_internet_gateway.gw-public]
}

# nat gateway public-a
resource "aws_nat_gateway" "nat-gateway-public-a" {
  allocation_id = aws_eip.eip-nat-public-a.id
  subnet_id     = aws_subnet.public-a.id

  tags = {
    Name = "nat-public-a"
  }

  depends_on = [aws_internet_gateway.gw-public]
}

# Allocation ip (Elastic IP) public-b
resource "aws_eip" "eip-nat-public-b" {
  depends_on = [aws_internet_gateway.gw-public]
}

# Nat gateway public-b
resource "aws_nat_gateway" "nat-gateway-public-b" {
  allocation_id = aws_eip.eip-nat-public-b.id
  subnet_id     = aws_subnet.public-b.id

  tags = {
    Name = "nat-public-b"
  }

  depends_on = [aws_internet_gateway.gw-public]
}

# Allocation ip (Elastic IP) public-c
resource "aws_eip" "eip-nat-public-c" {
  depends_on = [aws_internet_gateway.gw-public]
}

#nat gateway public-c
resource "aws_nat_gateway" "nat-gateway-public-c" {
  allocation_id = aws_eip.eip-nat-public-c.id
  subnet_id     = aws_subnet.public-c.id

  tags = {
    Name = "nat-public-c"
  }

  depends_on = [aws_internet_gateway.gw-public]
}

# route table public
resource "aws_route_table" "route-public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.INTERNET_GATEWAY
    gateway_id = aws_internet_gateway.gw-public.id
  }

  tags = {
    Name = "route-public"
  }
}

# ASOCIACION DE TABLE ROUTES PUBLICS
# route table association public-a 
resource "aws_route_table_association" "route-public-a-association" {
  subnet_id      = aws_subnet.public-a.id
  route_table_id = aws_route_table.route-public.id
}

# route table association public-b
resource "aws_route_table_association" "route-public-b-association" {
  subnet_id      = aws_subnet.public-b.id
  route_table_id = aws_route_table.route-public.id
}

# route table association public-c
resource "aws_route_table_association" "route-public-c-association" {
  subnet_id      = aws_subnet.public-c.id
  route_table_id = aws_route_table.route-public.id
}


#CREATE MODULE FOR PRIVATE SUBNETS
# subnet privada-a
resource "aws_subnet" "subnet-private-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-privada-a"
  }

  depends_on = [aws_vpc.main]
}

# subnet privada-b
resource "aws_subnet" "subnet-private-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet-privada-b"
  }

  depends_on = [aws_vpc.main]
}

# subnet privada-c
resource "aws_subnet" "subnet-private-c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "subnet-privada-c"
  }

  depends_on = [aws_vpc.main]
}

# CREATE ROUTE TABLE FOR PRIVATE SUBNETS
# route table privada-a
resource "aws_route_table" "route-table-private-a" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.INTERNET_GATEWAY
    nat_gateway_id = aws_nat_gateway.nat-gateway-public-a.id
  }

  route {
    cidr_block = var.VPC-CIDR
    gateway_id = "local"
  }

  tags = {
    Name = "route-table-private-a"
  }
}

#route table association privada-b
resource "aws_route_table" "route-table-private-b" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.INTERNET_GATEWAY
    nat_gateway_id = aws_nat_gateway.nat-gateway-public-b.id
  }

  route {
    cidr_block = var.VPC-CIDR
    gateway_id = "local"
  }

  tags = {
    Name = "route-table-private-b"
  }
}

# route table privada-c
resource "aws_route_table" "route-table-private-c" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = var.INTERNET_GATEWAY
    nat_gateway_id = aws_nat_gateway.nat-gateway-public-c.id
  }

  route {
    cidr_block = var.VPC-CIDR
    gateway_id = "local"
  }

  tags = {
    Name = "route-table-private-c"
  }
}

# ASOCIACION DE TABLE ROUTES PRIVATE
# route table association privada-a
resource "aws_route_table_association" "route-private-a-association" {
  subnet_id      = aws_subnet.subnet-private-a.id
  route_table_id = aws_route_table.route-table-private-a.id
}

# route table association privada-b
resource "aws_route_table_association" "route-private-b-association" {
  subnet_id      = aws_subnet.subnet-private-b.id
  route_table_id = aws_route_table.route-table-private-b.id
}

# route table association privada-c 
resource "aws_route_table_association" "route-private-c-association" {
  subnet_id      = aws_subnet.subnet-private-c.id
  route_table_id = aws_route_table.route-table-private-c.id
}

# CREATE MODULE FOR DATABASE SUBNETS
# subnet database-a
resource "aws_subnet" "subnet-database-a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.8.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-database-a"
  }

  depends_on = [aws_vpc.main]
}

# subnet database-b
resource "aws_subnet" "subnet-database-b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.9.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet-database-b"
  }

  depends_on = [aws_vpc.main]
}

# subnet database-c 
resource "aws_subnet" "subnet-database-c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "subnet-database-c"
  }

  depends_on = [aws_vpc.main]
}

# route table database
resource "aws_route_table" "route-table-database" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.VPC-CIDR
    gateway_id = "local"
  }

  tags = {
    Name = "route-table-database"
  }
}

# route table association database-a
resource "aws_route_table_association" "route-database-a-association" {
  subnet_id      = aws_subnet.subnet-database-a.id
  route_table_id = aws_route_table.route-table-database.id
}

# route table association database-b
resource "aws_route_table_association" "route-database-b-association" {
  subnet_id      = aws_subnet.subnet-database-b.id
  route_table_id = aws_route_table.route-table-database.id
}

# route table association database-c
resource "aws_route_table_association" "route-database-c-association" {
  subnet_id      = aws_subnet.subnet-database-c.id
  route_table_id = aws_route_table.route-table-database.id
}
