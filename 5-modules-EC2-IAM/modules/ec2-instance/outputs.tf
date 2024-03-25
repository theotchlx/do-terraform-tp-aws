// Output the instance ID
output "instance_ids" {
  description = "The IDs of the EC2 instances"
  value       = [for instance in aws_instance.ec2_instance : instance.id]
}