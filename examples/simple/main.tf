terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}

data "spacelift_space" "root" {
  space_id = "root"
}

module "spacetail" {
  source = "../../"

  space_id = data.spacelift_space.root.id
  context_labels = [
    "autoattach:runtime:spacelift-tailscale",
    "terraform:true",
  ]
}
