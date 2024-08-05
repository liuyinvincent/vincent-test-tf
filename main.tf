# Configure the Google Cloud provider
provider "google" {
  project = "vincentliu-sandbox"
  region  = "us-central1"  # You can change this to your preferred region
}

# Create the VPC
# resource "google_compute_network" "co2_vpc" {
#   name                    = "co2-vpc"
#   auto_create_subnetworks = false
# }

# Create a subnet
resource "google_compute_subnetwork" "test_network" {
  name          = "test-network"
  ip_cidr_range = "10.100.0.0/24"  # Adjust this range as needed
  network       = "co2-vpc"       # Should match the name of the VPC created above: co2-vpc
  region        = "us-central1"  # Should match the provider's region
}





  source_ranges = ["10.0.0.0/24"]  # Should match the subnet's CIDR
}

# Create a firewall rule to allow SSH access (for management)
# resource "google_compute_firewall" "allow_ssh" {
#   name    = "allow-ssh"
#   network = google_compute_network.co2_vpc.name

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }

#   source_ranges = ["0.0.0.0/0"]  # Be cautious with this; consider restricting to your IP
# }

# Output the VPC and subnet details
# output "vpc_id" {
#   value = google_compute_network.co2_vpc.id
# }

# output "subnet_id" {
#   value = google_compute_subnetwork.test_network.id
# }
