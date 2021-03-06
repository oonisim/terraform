terraform {
  backend "s3" {
    encrypt = true
  }
}

#--------------------------------------------------------------------------------
# Common/global configuration store
#--------------------------------------------------------------------------------
data "terraform_remote_state" "common" {
  backend = "s3"
  config = {
    encrypt = "true"
    bucket  = var.BACKEND_BUCKET
    key     = "${var.backend_key_common}"
  }
}

#--------------------------------------------------------------------------------
# S3
#--------------------------------------------------------------------------------
data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    encrypt = "true"
    bucket  = var.BACKEND_BUCKET
    key     = var.backend_key_s3
  }
}
