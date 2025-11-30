variable "IMAGE_REGISTRY" {
  default = "ghcr.io"
}

variable "IMAGE" {
  # Source image (with tag) used for FROM
  default = "ubuntu:22.04"
}

variable "IMAGE_NAMESPACE" {
  # Namespace / username part: ghcr.io/<namespace>/
  default = "username"
}

variable "NAME" {
  # Primary tag name
  default = "ubuntu"
}

variable "TAG" {
  # Version tag
  default = "latest"
}

group "default" {
  targets = ["ubuntu"]
}

target "ubuntu" {
  context    = "./ubuntu"
  dockerfile = "Dockfile"

  platforms = ["linux/amd64"]

  args = {
    IMAGE = IMAGE
  }

  tags = [
    "${IMAGE_REGISTRY}/${IMAGE_NAMESPACE}/${NAME}:${TAG}",
  ]
}
