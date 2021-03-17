resource "aws_security_group" "lb_sg" {
  name        = "${local.app_name}-ALB-SG"
  description = "Security Group For load balancer"
  vpc_id      = module.aws_core_infra.vpc_id
  tags = {
    Name = "${local.app_name}-ALB-SG"
  }
  ingress {
   from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "ec2_sg" {
  name        = "${local.app_name}-EC2-SG"
  description = "Security Group For EC2"
  vpc_id      = module.aws_core_infra.vpc_id
  tags = {
    Name = "${local.app_name}-EC2-SG"
  }
  ingress {
   from_port    = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [
      aws_security_group.lb_sg.id,
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}