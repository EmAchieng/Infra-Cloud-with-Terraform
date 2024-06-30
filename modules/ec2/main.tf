# Define a security group resource named "web_sg" for the VPC specified by var.vpc_id
resource "aws_security_group" "web_sg" {
  vpc_id = var.vpc_id

  # Ingress rule: Allow TCP traffic on port 22 (SSH) from any source, for testing
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  # Ingress rule: Allow TCP traffic on port 80 (HTTP) from any source, for testing
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # allow http traffic from anywhere
  }

  # Egress rule: Allow all outbound traffic (-1) from the instance
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags for identifying and organizing resources
  tags = {
    Name = "web_sg"
  }
}

# Define an EC2 instance resource named "web" using the specified AMI and instance type
resource "aws_instance" "web" {
  ami           = "ami-0c577783b0a2933b7"
  instance_type = "t3.micro"
  subnet_id     = var.public_subnet_id

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World" > /usr/share/nginx/html/index.html
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
            EOF

  tags = {
    Name = "HelloWorldInstance"
  }
}

# Output to display the public IP address of the "web" instance
output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
