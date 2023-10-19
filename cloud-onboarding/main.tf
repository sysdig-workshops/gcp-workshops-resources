terraform { 
  required_providers { 
    sysdig = { 
      source = "sysdiglabs/sysdig" 
    } 
    google = { 
      source  = "hashicorp/google" 
      version = "< 5.0.0" 
    } 
    google-beta = { 
      source = "hashicorp/google-beta" 
      version = "< 5.0.0" 
    } 
  }
}

provider "sysdig" {
  sysdig_secure_url       = "https://app.us4.sysdig.com"
  sysdig_secure_api_token = TF_VAR_SYSDIG_TOKEN
}

provider "google" {
  project = TF_VAR_PROJECT_ID
  region  = "us-central1"
}

provider "google-beta" {
  project = TF_VAR_PROJECT_ID
  region  = "us-central1"
}

module "single-project" {
  source = "sysdiglabs/secure-for-cloud/google//examples/single-project"
}
