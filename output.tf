output "vpc_id" {
    value = aws_vpc.eks_vpc.id
    description = "vpc id"
}


output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}