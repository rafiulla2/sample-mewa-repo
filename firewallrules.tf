# Allow domain traffic

resource "google_compute_firewall" "allow_domain_traffic" {
  name        = "allow-domain-traffic"
  network     = google_compute_network.vpc-staging.name
  description = "Firewall rules allowing domain traffic in network"
  allow {
    protocol = "tcp"
    ports    = ["53", "636", "135", "445", "3280", "3281", "5985"]
  }
  source_ranges = ["0.0.0.0/0"]

}


# Allow Sharepoint traffic
resource "google_compute_firewall" "allow_sharepoint" {
  name        = "allow-sharepoint-inbound-traffic"
  network     = google_compute_network.vpc-staging.name
  description = "Firewall rules targeting Sharepoint instances"
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "32843", "32844", "16500-16519", "135", "49152-65535", "808", "22233-22236"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["sharepoint"]

}

# Allow traffic from Sharepoint servers to SQL 
resource "google_compute_firewall" "allow_sharepoint_to_sql" {
  name        = "allow-sharepoint-ito-sql-traffic"
  network     = google_compute_network.vpc-staging.name
  description = "Firewall rules allowing traffic from Sharepoint to SQL servers"
  allow {
    protocol = "tcp"
    ports    = ["1433"]
  }
  source_tags = ["sharepoint"]
  target_tags = ["sql"]
}

# Allow IAP inbound traffic
resource "google_compute_firewall" "allow_iap" {
  name          = "allow-iap-22"
  network       = google_compute_network.vpc-staging.name
  source_ranges = ["35.235.240.0/20"]
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  target_tags = ["iap"]
}

# Allow domain traffic and traffic to domain controllers
resource "google_compute_firewall" "allow_ad_traffic" {
  name          = "allow-ad-traffic"
  network       = google_compute_network.vpc-staging.name
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports    = ["389", "636", "445", "464", "135", "53"]
  }
  target_tags = ["dc"]
}