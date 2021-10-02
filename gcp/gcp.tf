provider "google" {
  #--------------------------------------------------------------------------------
  # [Google Provider Configuration Reference]
  # https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
  # https://www.terraform.io/docs/language/providers/configuration.html
  #--------------------------------------------------------------------------------
  project                     = var.PROJECT_ID
  region                      = var.REGION
  zone                        = var.ZONE
  impersonate_service_account = var.SERVICE_ACCOUNT_ID
}
