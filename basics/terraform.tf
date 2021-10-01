#--------------------------------------------------------------------------------
# [terraform configuration block]
# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
#--------------------------------------------------------------------------------
terraform {
  #--------------------------------------------------------------------------------
  # required_version
  # https://www.terraform.io/docs/language/expressions/version-constraints.html
  # Version Constraints
  # https://www.terraform.io/docs/language/expressions/version-constraints.html
  #--------------------------------------------------------------------------------
  required_version = "~> 1.0.0"

  #--------------------------------------------------------------------------------
  # workspace backend
  # https://www.terraform.io/docs/language/state/workspaces.html
  # The persistent data stored in the backend belongs to a workspace.
  #--------------------------------------------------------------------------------
  backend "gcs" {
    bucket  = "to_be_replaced"
    prefix  = "terraform/state"
  }

  #--------------------------------------------------------------------------------
  # required_providers
  #--------------------------------------------------------------------------------
  required_providers {
    google = {
      #--------------------------------------------------------------------------------
      # [Google Cloud Platform Provider (overview)]
      # * https://registry.terraform.io/providers/hashicorp/google/latest/docs
      # The Google provider is used to configure your Google Cloud Platform infrastructure.
      # The provider reference for more details on authentication/configuration.
      #
      # [GCP provider latest version]
      # https://registry.terraform.io/providers/hashicorp/google/latest
      #
      # [Impersonating Service Accounts]
      # https://cloud.google.com/iam/docs/creating-short-lived-service-account-credentials
      #--------------------------------------------------------------------------------
      source = "hashicorp/google"
      version = "3.86.0"
    }
  }
}
