resource "google_service_account" "main" {
  account_id   = "run-${local.name}"
  display_name = "Service Account for Cloud Run ${local.name}"
}

resource "google_service_account" "build" {
  account_id   = "build-${local.name}"
  display_name = "Service Account for Cloud Build ${local.name}"
}

resource "google_storage_bucket_iam_member" "build" {
  bucket = "${var.project.id}_cloudbuild"

  role   = "roles/storage.objectUser"
  member = "serviceAccount:${google_service_account.build.email}"
}

resource "google_project_iam_member" "build" {
  project = var.project.id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.build.email}"
}
