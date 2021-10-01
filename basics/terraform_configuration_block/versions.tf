#--------------------------------------------------------------------------------
# [terraform configuration block]
# https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
#
# Lock and Upgrade Provider Versions
# https://learn.hashicorp.com/tutorials/terraform/provider-versioning?in=terraform/configuration-language
# When multiple users or automation tools run the same Terraform configuration,
# they should all use the same versions of their required providers.
# There are two ways for you to manage provider versions in your configuration.
# 1. Specify provider version constraints in your configuration's terraform block.
# 2. Use the dependency lock file
#
# [terraform.lock.hcl]
# When you initialize a Terraform configuration for the first time with Terraform
# 0.14 or later, Terraform will generate a new .terraform.lock.hcl file in the
# current working directory. You should include the lock file in your version
# control repository to ensure that Terraform uses the same provider versions
# across your team and in ephemeral remote execution environments.
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
