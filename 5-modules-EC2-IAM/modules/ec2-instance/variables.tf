variable "instance_name" {
  description = "EC2 instance name"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = list(string)
}

variable "instance_role_name" {
  description = "Name of the IAM role for the EC2 instance"  // LabRole role's instance profile
  type        = list(string)
}