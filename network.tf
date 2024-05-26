#### Create VPC for prod network and one subnet ####

resource "google_compute_network" "vpc-staging" {
  project                 = var.project_id
  auto_create_subnetworks = false
  description             = "Staging env VPC network"
  name                    = "rafi-staging-vpc"
}

## Create subnets in VPC ##
resource "google_compute_subnetwork" "ad-staging-subnet" {
  name                     = "ad-staging-subnet"
  region                   = var.region
  description              = "Subnet dedicated to Active Directory servers in staging environment"
  network                  = google_compute_network.vpc-staging.id
  ip_cidr_range            = "192.168.1.0/24"
  private_ip_google_access = true
}


# Creating a router for the project
resource "google_compute_router" "default" {
  project = var.project_id
  region  = var.region
  name    = "default-router"
  network = google_compute_network.vpc-staging.self_link
}

# Creating a NAT for the project
resource "google_compute_router_nat" "default" {
  name                               = "default-nat"
  project                            = var.project_id
  region                             = var.region
  router                             = google_compute_router.default.name
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}