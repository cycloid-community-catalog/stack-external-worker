terraform {
  required_version = ">= 0.13"
  required_providers {
    scaleway = {
      source  = "scaleway/scaleway"
      version = "~> 1.17.2"
    }
  }
}
