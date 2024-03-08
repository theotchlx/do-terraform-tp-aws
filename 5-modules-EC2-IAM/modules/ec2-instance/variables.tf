variable "instance_name" {
  description = "EC2 instance name"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "instance_role_name" {
  description = "Name of the IAM role for the EC2 instance"  // LabRole role's instance profile
}