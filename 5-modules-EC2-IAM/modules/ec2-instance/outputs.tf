# Output the instance ID
output "instance_id" {
  description = "The ID of the EC2 instance"
  value = aws_instance.ec2_instance.id
}