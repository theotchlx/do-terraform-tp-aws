// Module outputs
output "ec2_instance_ids" {
  description = "The IDs of the deployed EC2 instances"
  value = module.ec2-instance.instance_ids
}