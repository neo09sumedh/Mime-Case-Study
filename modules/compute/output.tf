output "instance_id" {
  value = aws_instance.MineITInstance[*].id
}
output "security_group_id"{
    value = aws_security_group.Mine-IT_SG.id
}