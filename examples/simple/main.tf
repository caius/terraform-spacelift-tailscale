terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
    }
  }
}

provider "spacelift" {}

resource "spacelift_space" "this" {
  name            = "examples-simple-this"
  parent_space_id = "root"
}

module "spacetail" {
  source = "../../"

  space_id = spacelift_space.this.id
  context_labels = [
    "autoattach:runtime:spacelift-tailscale",
    "terraform:true",
  ]
}
