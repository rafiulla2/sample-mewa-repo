resource "google_compute_address" "internal-ips" {
  for_each     = var.internal_ips
  name         = each.value.name
  subnetwork   = "projects/${var.project_id}/regions/${var.region}/subnetworks/${each.value.subnet}"
  address_type = each.value.addr_type
  address      = each.value.address
  region       = each.value.region
  depends_on = [ google_compute_network.vpc-staging ]
}