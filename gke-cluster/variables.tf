variable "deployment_name" {
  default = "example"
}

variable "google_domain_name" {
  default = "example.com"
}

variable "google_project_id" {
  default = "get-from-console"
}

variable "cluster_name" {
  default = "example"
}

variable "google_region" {
  default = "us-central1"
}

variable "cluster_node_count" {
  default = "3"
}

variable "cluster_version" {
  default = "1.15"
}

variable "google_credentials_json" {
  default = "service-account.json"
}

