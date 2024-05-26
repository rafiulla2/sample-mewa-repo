
# enabling apis
resource "google_project_service" "enabled_apis" {
  for_each                   = var.api_services
  service                    = each.key
  disable_dependent_services = true
}

# granting the service account with the appropiate permissions
resource "google_service_account" "compute" {
  account_id   = "compute-sa"
  display_name = "Custom SA for VM Instances"
  depends_on   = [google_project_service.enabled_apis]
}