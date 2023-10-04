resource "google_cloud_run_v2_service" "main" {
  provider     = google-beta
  launch_stage = "BETA"

  name     = local.name
  location = local.location

  ingress = local.ingress

  template {
    service_account = google_service_account.main.email
    scaling {
      max_instance_count = local.max_instance_count
      min_instance_count = local.min_instance_count
    }
    # main container
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
      resources {
        cpu_idle = local.cpu_idle
        limits = {
          "memory" : local.memory,
          "cpu" : local.cpu
        }
      }
      ports {
        container_port = local.port
      }
      dynamic "env" {
        for_each = var.imports.secrets != null ? var.imports.secrets : tomap({})
        content {
          name = env.key
          value_source {
            secret_key_ref {
              secret  = env.value
              version = "latest"
            }
          }
        }
      }
    }
    # sidecars
    dynamic "containers" {
      for_each = { for s in var.presets.sidecars : s.name => s }
      content {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
        name  = containers.value.name
      }
    }
  }

  traffic {
    percent = 100
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
  }

  lifecycle {
    ignore_changes = [
      client,
      client_version,
      template.0.revision,
      template.0.containers
    ]
  }
}

resource "google_cloud_run_v2_service_iam_member" "invoker" {
  for_each = var.imports.invokers != null ? toset(var.imports.invokers) : toset()

  project  = google_cloud_run_v2_service.main.project
  location = google_cloud_run_v2_service.main.location
  name     = google_cloud_run_v2_service.main.name
  role     = "roles/run.invoker"
  member   = each.value == "allUsers" ? "allUsers" : "serviceAccount:${each.value}"
}
