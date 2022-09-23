locals {
  userdata = templatefile("userdata/user_data.sh", {
    ssm_cloudwatch_config = aws_ssm_parameter.cw_agent.name
  })
}

# Ressource EC2 qui sera créée
resource "aws_instance" "prod-5src2-gr3-cloudwatch-agent" {
  ami                         = data.aws_ami.cloudwatch-agent-server.id
  instance_type               = "t2.micro"
  iam_instance_profile        = data.aws_iam_role.ec2_role_ssm.name
  associate_public_ip_address = "true"
  vpc_security_group_ids      = [aws_security_group.allow_http.id]
  subnet_id                   = aws_subnet.subnet.id
  user_data                   = local.userdata
  tags                        = merge(local.aws_tags, { Name = "Cloudwatch-agent-${var.env}" })
}

