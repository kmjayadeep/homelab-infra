terraform {
  required_providers {
    minio = {
      source = "aminueza/minio"
      version = "2.5.0"
    }
  }
  required_version = "~> 1.9.2"
}

provider "minio" {
  minio_server = "minio.cosmos.cboxlab.com"
  minio_ssl = true
}
