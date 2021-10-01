data "google_project" "current" {
  #--------------------------------------------------------------------------------
  # [Datarouce google_project]
  # https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project
  # [Resource google_project]
  # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project
  #--------------------------------------------------------------------------------
  project_id = var.PROJECT_ID
}

output "project_number" {
  value = data.google_project.current.number
}

output "project_id" {
  value = data.google_project.current.project_id
}
variable "GCP_TERRAFORM_SERVICE_ACCOUNT_ID" {
  type = string
  description = "Service account to impersonate"
}

provider "google" {
  #--------------------------------------------------------------------------------
  # [Google Provider Configuration Reference]
  # https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
  # https://www.terraform.io/docs/language/providers/configuration.html
  #--------------------------------------------------------------------------------
  project = var.PROJECT_ID
  region = var.REGION
  impersonate_service_account = var.GCP_TERRAFORM_SERVICE_ACCOUNT_ID
}
