resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb" #devops-practice
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.roboshop-all.id ]

  tags = {
    Name = "HelloTerraform"
  }
}

resource "aws_security_group" "roboshop-all"{ #this is terraform name ,for only terraform reference only
  name = var.sg-name #this is for aws 
  description = var.sg-description


  ingress    {
    description = "Allow All Ports"
    from_port = var.inbound-from-port #o means all ports
    to_port = 0
    protocol = "tcp"
    cidr_blocks = var.cidr_blocks

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

   tags = {
    Name = "allow_tls"
  }
}