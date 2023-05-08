locals{
    app_name="Mine_IT"
}
resource "aws_instance" "MineITInstance" {
  count = var.instance_count
  ami = "ami-0d630c1e9377ae6d1"
  instance_type = var.instance_type
  key_name = var.key_name
  root_block_device {
    volume_size = var.volume_size
  }
  vpc_security_group_ids=[aws_security_group.Mine-IT_SG.id]
  associate_public_ip_address=true
  subnet_id=var.subnet_id
  iam_instance_profile = var.instance_profile_id
  depends_on  = [aws_security_group.Mine-IT_SG]
   tags = {
    Name = "${local.app_name}-Instance"
  }
}

resource "aws_security_group" "Mine-IT_SG" {
  description = var.sec_group_description
  vpc_id      = var.vpc_id
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress = [
    for port in var.port_list:
    {
      cidr_blocks = [
      for ip in var.ip_list:
      ip
      ]
      description = ""
      from_port = port
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "tcp"
      security_groups = []
      self = false
      to_port = port
    }
  ]
  name = var.sec_group_name
   tags = {
    Name = "${local.app_name}-security-group"
  }
} 
