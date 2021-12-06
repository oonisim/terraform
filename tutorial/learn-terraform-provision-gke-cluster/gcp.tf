variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}


#--------------------------------------------------------------------------------
# GCP Service Account Impersonation
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#impersonating-service-accounts
# The local user to run Terraform must have the roles/iam.serviceAccountTokenCreator
# on the service account resource to impersonate it.
#--------------------------------------------------------------------------------
variable "SERVICE_ACCOUNT_ID" {
  type        = string
  description = "GCP Service account for Terraform execution to impersonate"
}

provider "google" {
  project = var.project_id
  region  = var.region
  # impersonate_service_account = var.SERVICE_ACCOUNT_ID
}

