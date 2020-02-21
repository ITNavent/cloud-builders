# Skaffold

This Container Builder build step runs java 11 for Google Cloud Platform

## Using this builder

This builder is derived from the [`gcloud` builder](gcr.io/cloud-builders/gcloud) and therefore supports the same environment variables.

## Building this builder

To build this builder and push the resulting image to the Container Registry
in your project, run the following command in this directory:

    $ gcloud builds submit . --config=cloudbuild.yaml

