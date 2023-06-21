# Configure the Google Cloud provider
provider "google" {
  credentials = file("Nabil-Sa.json")
  project     = "newproject-387311"
  region      = "us-central1"
}

# Create a Google Cloud Storage (GCS) bucket
resource "google_storage_bucket" "bucket" {
  name     = "ahmed-bucket-newproject-387311"
  location = "us-central1"
}

# Configure the Cloud Build trigger
resource "google_cloudbuild_trigger" "trigger" {
  name        = "push-trigger"
  description = "Whenever a new file is pushed to the repo, it will be triggered"
  project     = "newproject-387311"

  trigger_template {
    project_id  = "newproject-387311"
    repo_name   = "AhmedNabilSharawy/GCP_Final_Project"
    branch_name = "main"
  }

  filename = "cloudbuild.yaml"
}
