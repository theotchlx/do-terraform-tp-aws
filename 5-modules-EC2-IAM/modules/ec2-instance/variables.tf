variable "ec2_instances" {
  description = "List of EC2 instances to deploy"
  type        = map(object({
    instance_name = string  // EC2 instance name
    instance_type = string  // EC2 instance type
    user_data     = string  // Custom user data for the EC2 instance
  }))
}

variable "instance_role_name" {
  description = "Name of the IAM role for the EC2 instance"  // LabRole role's instance profile
  type        = string
}