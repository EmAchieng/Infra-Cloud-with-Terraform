# Defines a NAT gateway resource associated with an Elastic IP (EIP)
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_ids[0]

  tags = {
    Name = "NAT Gateway"
  }
}

# Defines an Elastic IP (EIP) resource that will be associated with the NAT gateway.
resource "aws_eip" "nat" {
  tags = {
    Name = "NAT EIP"
  }
}

# Description: Provides the ID of the NAT gateway created
output "nat_gateway_id" {
  value = aws_nat_gateway.this.id
}