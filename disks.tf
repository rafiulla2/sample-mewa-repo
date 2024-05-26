resource "google_compute_disk" "data-disk" {
  for_each = { for k, v in var.vms : k => v if v.data_disk == "true" }
  name     = each.value.name
  type     = each.value.disk_type
  zone     = each.value.zone
  size     = each.value.disk_size
}