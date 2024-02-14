locals {
  spacelift_tailscale_setup_commands = [
    "spacetail up",
    "trap 'spacetail down' EXIT",
    "export HTTP_PROXY=http://127.0.0.1:8080 HTTPS_PROXY=http://127.0.0.1:8080",
  ]
  spacelift_tailscale_teardown_commands = [
    "unset HTTP_PROXY HTTPS_PROXY",
    # Spacelift currently saves env to disk *before* calling the after_apply hook, unlike all the other
    # phases. Work around that here for now, otherwise it breaks spacelift-worker uploading changes.
    "sed -e '/HTTP_PROXY=/d' -e /HTTPS_PROXY/d -i /mnt/workspace/.env_hooks_after",
  ]
}

variable "context_labels" {
  description = "List of labels for the Spacelift Context. eg. [\"autoattach:runtime:spacelift-tailscale\"]"
  type        = list(string)
}

variable "space_id" {
  description = "The ID of the Spacelift Space to create the resources inside"
}

resource "spacelift_context" "spacelift-tailscale-runtime" {
  name        = "spacelift-tailscale runtime"
  description = "Configuration for the caius/spacelift-tailscale runtime"
  space_id    = var.space_id

  labels = var.context_labels

  before_plan = local.spacelift_tailscale_setup_commands
  after_plan  = local.spacelift_tailscale_teardown_commands

  before_apply = local.spacelift_tailscale_setup_commands
  after_apply  = local.spacelift_tailscale_teardown_commands

  before_perform = local.spacelift_tailscale_setup_commands
  after_perform  = local.spacelift_tailscale_teardown_commands

  before_destroy = local.spacelift_tailscale_setup_commands
  after_destroy  = local.spacelift_tailscale_teardown_commands
}
