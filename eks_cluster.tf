resource "aws_iam_role" "eks_cluster_role" {
  name = "eks_cluster_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "eks-role"
  }
}


resource "aws_iam_role_policy_attachment" "eks-role-attach" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}


resource "aws_eks_cluster" "eks" {
  name     = "eks"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
     endpoint_private_access = false

     endpoint_public_access = true

     subnet_ids = [ 
         aws_subnet.public_subnet_1.id,
         aws_subnet.public_subnet_2.id,
         aws_subnet.private_subnet_1.id,
         aws_subnet.private_subnet_2.id
     ]
  }

  version = "1.19"

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-role-attach
     
  ]
}
