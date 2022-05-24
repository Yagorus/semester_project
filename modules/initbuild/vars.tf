variable "aws_region" { }
variable "aws_profile" { }
variable "environment" { }
variable "app_name" { }
variable "bucket_name" { }
variable "working_dir" { }
variable "image_tag" { }

locals {
  working_dir_path = format("%s-%s", path.cwd , var.working_dir)
}
