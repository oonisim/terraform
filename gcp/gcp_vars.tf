#--------------------------------------------------------------------------------
# [Target environment control variables]
# Scope: Global (hence all capital letters)
# Requirements:
#   Use dependency injection to set values to keep the code independent from the
#   environmental configurations -> Separation of concern (code <-> configuration)
#
#   Options:
#     - TF_VAR_<variable_name> to inject from the environment variables
#       See https://www.terraform.io/docs/cli/config/environment-variables.html#tf_var_name
#     - -var-file command line option to define values in a file.
#       See https://www.terraform.io/docs/language/values/variables.html#variable-definitions-tfvars-files
#     - GOOGLE_[PROJECT|REGION|ZONE] environment variables
#       See https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#full-reference
#
#     - CLOUDSDK_CORE_PROJECT, CLOUDSDK_COMPUTE_REGION, CLOUDSDK_COMPUTE_ZONE
#       GCP SDK has the convention to override the named configuration property
#       with an environment variable of the form 'CLOUDSDK_CATEGORY_PROPERTY',
#       e.g. CLOUDSDK_CORE_PROJECT for the 'core/project' property.
#       See https://cloud.google.com/sdk/gcloud/reference/config
#
#   TF_VAR or --var-file would be Terraform native way, wheras CLOUDSDK_CATEGORY_PROPERTY
#   is more GCP SDK native way.
#--------------------------------------------------------------------------------
variable "PROJECT_ID" {
  type        = string
  description = "GCP Project ID to which deploy the resources"
  default     = "To be injected at execution"
}
variable "REGION" {
  type        = string
  description = "GCP Region"
  default     = "To be injected at execution"
}
variable "ZONE" {
  type        = string
  description = "GCP Zone"
  default     = "To be injected at execution"
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
