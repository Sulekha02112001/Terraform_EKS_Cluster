
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = "192.168.0.0/18"

  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true


  tags = {
    Name = "public_subnet_1"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb" = 1
  }
}


resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = "192.168.64.0/18"

  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true


  tags = {
    Name = "public_subnet_2"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/elb" = 1
  }
}




resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = "192.168.128.0/18"

  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true


  tags = {
    Name = "private_subnet_1"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}


resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.eks_vpc.id
  cidr_block = "192.168.192.0/18"

  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true


  tags = {
    Name = "private_subnet_2"
    "kubernetes.io/cluster/eks" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}
