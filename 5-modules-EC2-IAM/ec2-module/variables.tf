variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "my-vm"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.nano"
}

variable "user_data" {
  description = "EC2 instance users data"
  type        = string
  default     = ""
}

variable "instance_role_name" {
  description = "Name of the IAM role for the EC2 instance"
  type        = string
  default     = "ec2-instance-role"
}