resource "google_secret_manager_secret" "main" {
  secret_id = local.id
  labels    = var.labels
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "data" {
  secret = google_secret_manager_secret.main.id

  secret_data = local.data
}

resource "google_secret_manager_secret_iam_member" "service_account" {
  for_each = local.service_accounts

  secret_id = google_secret_manager_secret.main.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${each.value}"
}
