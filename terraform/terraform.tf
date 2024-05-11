terraform {

required_version = "1.8.3"

  required_providers {
    scaleway = {
    source = "scaleway/scaleway"
    version = "2.40.0"
    }
    helm= {
      source = "hashicorp/helm"
     version = "~>2.7.1"
    }
  }
}


provider "scaleway" {
  alias = "p2"
  profile = "myProfile"
}