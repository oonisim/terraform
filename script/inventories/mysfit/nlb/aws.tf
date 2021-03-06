provider "aws" {
  region      = var.REGION
  # access_key  = ${var.aws_access_key} # To be provided with AWS_ACCESS_KEY_ID  environment variable
  # Make it faster by skipping something
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

#--------------------------------------------------------------------------------
# AWS data sources in the defined region
# Availability zones can differ depending on the region, hence retrieve facts.
# DO NOT hard-code e.g. AZ-A as there may not be 'AZ-A' in a region.
#--------------------------------------------------------------------------------
# The available AZs in the region defined in the provider will be retrieved into
# "aws_availability_zones" data source object.
data "aws_availability_zones" "all" {
}

data "aws_region" "current" {
}

# https://www.terraform.io/docs/providers/aws/d/caller_identity.html
data "aws_caller_identity" "current" {
}

