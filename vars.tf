variable "api_services" {
  description = "List of API services to enable"
  type        = set(string)
  default = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "cloudbilling.googleapis.com",
    "storage.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "networksecurity.googleapis.com"
  ]
}

variable "vms" {
  type = map(object({
    data_disk    = string
    disk_type    = string
    disk_size    = string
    subnet       = string
    ip_add       = string
    network_tag  = list(string)
    machine_type = string
    name         = string
    sa_account   = string
    zone         = string
    server_type  = string

  }))
  description = "The list of vms being created"
}

variable "project_id" {
  type    = string
  default = "rafi-sandbox-rafi"
}

variable "region" {
  type    = string
  default = "me-central2"
}

variable "zone" {
  type    = string
  default = "me-central2-a"
}

variable "internal_ips" {
  type = map(object({
    name      = string
    subnet    = string
    addr_type = string
    address   = string
    region    = optional(string)
  }))
  description = "The list of internal IPs being reserved for VMs"
}