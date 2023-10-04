resource "google_artifact_registry_repository" "main" {
  location      = local.region
  labels        = var.labels
  repository_id = local.repository_name
  format        = "DOCKER"
}

resource "google_artifact_registry_repository_iam_member" "default" {
  for_each = toset(var.imports.service_accounts)

  location   = google_artifact_registry_repository.main.location
  repository = google_artifact_registry_repository.main.name
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${each.value}"
}
