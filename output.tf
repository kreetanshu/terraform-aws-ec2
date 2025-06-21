output "inststance_id" {
    value = aws_instance.ec2_vm.id
}
output "public_ip" {
    value = aws_instance.ec2_vm.public_ip
}