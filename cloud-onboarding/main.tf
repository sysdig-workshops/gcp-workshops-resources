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

variable "SYSDIG_TOKEN" {
  type = string
  description = "TF_VAR_SYSDIG_TOKEN environment var"
}

variable "PROJECT_ID" {
  type = string
  description = "TF_VAR_PROJECT_ID environment var"
}

provider "sysdig" {
  sysdig_secure_url       = "https://app.us4.sysdig.com"
  sysdig_secure_api_token = SYSDIG_TOKEN
}

provider "google" {
  project = TF_VAR_PROJECT_ID
  region  = "us-central1"
}

provider "google-beta" {
  project = PROJECT_ID
  region  = "us-central1"
}

module "single-project" {
  source = "sysdiglabs/secure-for-cloud/google//examples/single-project"
}
