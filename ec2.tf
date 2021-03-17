data "aws_ami" "linux_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}
resource "aws_instance" "media_ec2" {
  ami                  = data.aws_ami.linux_ami.id
  instance_type        = "t2.micro"
  key_name             = aws_key_pair.keypair.key_name
  subnet_id            = module.aws_core_infra.pri_sub1
  user_data            = data.template_file.user_data.rendered
  tags = {
    Name = "${local.app_name}-APP-SERVER" 
  }
  root_block_device {
    volume_size           = 30
    delete_on_termination = "true"
    encrypted             = "true"
  }
  volume_tags = {
    Name       = "${local.app_name}-APP-SERVER-EBS"
  }
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}