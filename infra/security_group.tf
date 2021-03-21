resource "aws_security_group" "elephone_elb_sg" {
  name = "elephone_elb_sg"
  description = "Elephone elastic load balancer security group"
  vpc_id = "vpc-e31e3984"

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "elephone_ecs_sg" {
  name = "elephone_ecs_sg"
  description = "Elephone elastic container service security group"
  vpc_id = "vpc-e31e3984"

  ingress {
    protocol = "tcp"
    to_port = 0
    from_port = 0
    security_groups = [aws_security_group.elephone_elb_sg.id]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
}

resource "aws_security_group" "elephone_db_sg" {
  name = "elephone_db_sg"
  description = "Elephone database security group"
  vpc_id = "vpc-e31e3984"

  ingress {
    from_port = 0
    protocol = "tcp"
    to_port = 0
    security_groups = [aws_security_group.elephone_ecs_sg.id]
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
}