output "cloud_run_service_account_email" {
  value = google_service_account.main.email
}

output "cloud_build_service_account_email" {
  value = google_service_account.build.email
}

output "cloud_run_name" {
  value = google_cloud_run_v2_service.main.name
}

output "cloud_run_uri" {
  value = google_cloud_run_v2_service.main.uri
}

output "cloud_run_id" {
  value = google_cloud_run_v2_service.main.id
}
