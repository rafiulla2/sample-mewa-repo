#VMs to be created
vms = {
  rafi-stg-win-ad-1 = {
    name         = "stg-prtl-ad1"
    data_disk    = "false"
    disk_type    = "pd-ssd"
    disk_size    = "150"
    subnet       = "ad-staging-subnet"
    ip_add       = "192.168.1.2"
    network_tag  = ["ad", "win-vm"]
    machine_type = "n2-custom-12-32768"
    sa_account   = ""
    zone         = "me-central2-a"
    server_type  = "ad"
  },
  rafi-stg-win-sql-1 = {
    name         = "stg-prtl-db1"
    data_disk    = "false"
    disk_type    = "pd-ssd"
    disk_size    = "150"
    subnet       = "ad-staging-subnet"
    ip_add       = "192.168.1.4"
    network_tag  = ["sql", "win-vm"]
    machine_type = "n2-custom-18-49152"
    sa_account   = ""
    zone         = "me-central2-a"
    server_type  = "sql"
  },
  rafi-stg-win-shr-1 = {
    name         = "stg-prtl-app1"
    data_disk    = "false"
    disk_type    = "pd-ssd"
    disk_size    = "150"
    subnet       = "ad-staging-subnet"
    ip_add       = "192.168.1.6"
    network_tag  = ["shr-app", "win-vm"]
    machine_type = "n2-custom-12-32768"
    sa_account   = ""
    zone         = "me-central2-a"
    server_type  = "shr"
  },
}

#Reserved internal IPs for VMs
internal_ips = {
  rafi-stg-win-ad-1 = {
    name      = "stg-prtl-ad1"
    subnet    = "ad-staging-subnet"
    addr_type = "INTERNAL"
    address   = "192.168.1.2"
    region    = "me-central2"
  },
  rafi-stg-win-sql-1 = {
    name      = "stg-prtl-db1"
    subnet    = "ad-staging-subnet"
    addr_type = "INTERNAL"
    address   = "192.168.1.4"
    region    = "me-central2"
  },
  rafi-stg-win-shr-1 = {
    name      = "stg-prtl-app1"
    subnet    = "ad-staging-subnet"
    addr_type = "INTERNAL"
    address   = "192.168.1.6"
    region    = "me-central2"
  },
}