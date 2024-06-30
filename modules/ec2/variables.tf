variable "public_subnet_id" {
  description = "Public subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}