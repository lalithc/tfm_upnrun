terraform {
    required_version = ">= 0.12, < 0.13"
}

provider "aws" {
    region = "us-east-2"
    version = "~>2.0"
}

resource "aws_instance" "example" {
    ami             =   "ami-0c55b159cbfafe1f0"
    instance_type   =   "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]
    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p ${var.server_port} &
                EOF  

    tags = {
        Name = "terraform-example"
 
    }            
}

resource "aws_security_group" "instance" {

    name = var.security_group_name
    vpc_id = "vpc-ef1fd284"

    lifecycle {
        create_before_destroy = true
    }    

    ingress {
        from_port   =   var.server_port
        to_port     =   var.server_port
        protocol    =   "tcp"
        cidr_blocks =   ["0.0.0.0/0"]
    }
    egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    }

    
  
}


