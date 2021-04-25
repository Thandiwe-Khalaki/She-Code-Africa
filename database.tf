
# ##################################################################################
# # RESOURCES
# ##################################################################################

resource "google_sql_database" "database" {
  name     = "polls-database"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_database_instance" "instance" {
  name             = "pollinstancedb"
  database_version = "POSTGRES_12"
  region           = "us-central1"
  settings {
    tier           = "db-f1-micro"
  }
}

resource "google_sql_user" "users" {
  name     = "polls-user"
  instance = google_sql_database_instance.instance.name
  host     = "host"
  password = "password"
}