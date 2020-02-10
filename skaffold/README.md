# Skaffold

This Container Builder build step runs
[`skaffold`](https://github.com/GoogleCloudPlatform/skaffold/) for Google
Kubernetes Engine (GKE) clusters.

## Using this builder

This builder is derived from the [`helm` builder](https://github.com/GoogleCloudPlatform/cloud-builders-community/tree/master/helm)
and therefore supports the same environment variables. Read the `helm` builder
documentation to use Skaffold builder.

## Example: Deploying to Google Kubernetes Engine

To run `skaffold run` in your cloudbuild.yaml, include this step with the
correct Kubernetes Engine cluster name and compute zone:

```
steps:
- name: gcr.io/$PROJECT_ID/skaffold:alpha
  args: ['run', '-f=skaffold.yaml']
  env:
  - 'CLOUDSDK_COMPUTE_ZONE=us-central1-a'
  - 'CLOUDSDK_CONTAINER_CLUSTER=[YOUR_CLUSTER_NAME]'
  ```

## Building this builder

To build this builder and push the resulting image to the Container Registry
in your project, run the following command in this directory:

    $ gcloud builds submit . --config=cloudbuild.yaml

