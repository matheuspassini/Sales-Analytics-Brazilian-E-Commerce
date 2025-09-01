# s3 Variables

variable "name_bucket" {
  type        = string
  description = "S3 bucket name"
}

variable "files_bucket" {
  type        = string
  description = "Folder containing Python jobs for processing"
}

variable "files_data" {
  type        = string
  description = "Folder containing data files"
}