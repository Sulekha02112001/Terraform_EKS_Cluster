
  
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

   
  tags = {
    Name = "public"
  }
}


  
resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw1.id
  }

   
  tags = {
    Name = "private1"
  }
}

  
resource "aws_route_table" "private_2" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw2.id
  }

   
  tags = {
    Name = "private2"
  }
}

# route table association

resource "aws_route_table_association" "public_1" {
  subnet_id = aws_subnet.public_subnet_1.id

  route_table_id = aws_route_table.public.id
  
}



resource "aws_route_table_association" "public_2" {
  subnet_id = aws_subnet.public_subnet_2.id

  route_table_id = aws_route_table.public.id
  
}


resource "aws_route_table_association" "private_1" {
  subnet_id = aws_subnet.private_subnet_1.id

  route_table_id = aws_route_table.private_1.id
  
}


resource "aws_route_table_association" "private_2" {
  subnet_id = aws_subnet.private_subnet_2.id

  route_table_id = aws_route_table.private_2.id
  
}
