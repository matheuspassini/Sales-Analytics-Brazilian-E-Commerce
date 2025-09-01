# S3 Module Variables
variable "name_bucket" {
  type        = string
  description = "Bucket name"
}

variable "versioning_bucket" {
  type        = string
  description = "Define if bucket versioning is enabled"
}

variable "files_bucket" {
  type        = string
  description = "Folder containing Python scripts for processing"
}

variable "files_data" {
  type        = string
  description = "Folder containing data files"
}
