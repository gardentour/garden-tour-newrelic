terraform {
    required_providers {
        newrelic = {
            version = "3.13.0"
            source = "newrelic/newrelic"
        }
    }

    required_version = ">-= 0.13"

    backend "s3" {
        bucket = "garden-tour-newrelic-state-file"
        key = "statefile"
        region = "us-east-1"
    }
}

