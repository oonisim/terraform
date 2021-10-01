#--------------------------------------------------------------------------------
# Enable Google API
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
#--------------------------------------------------------------------------------
resource "google_project_service" "iam" {
  service = "iam.googleapis.com"
  timeouts {
    create = "20m"
    update = "20m"
  }
  disable_dependent_services = true
}

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
  timeouts {
    create = "20m"
    update = "20m"
  }
  disable_dependent_services = true
  disable_on_destroy = true
}
