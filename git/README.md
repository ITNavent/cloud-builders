# Git

Builder creado para clonar y realizar un checkout a un commit/tag determinado

## Usando este builder

Este builder es derivado de [Official Git Cloud Builder](https://github.com/GoogleCloudPlatform/cloud-builders/tree/master/git) 

Las variables de entorno a setear son:

* CUSTOM_REPO_USER: Usuario en Github
* CUSTOM_REPO_PASSWORD: Password de Github
* CUSTOM_REPO_URL: Url sin el scheme, sin https. Ejemplo github.com/GoogleCloudPlatform/community
* CUSTOM_REPO_COMMIT: También puede ser un tag


## Building this builder

To build this builder and push the resulting image to the Container Registry
in your project, run the following command in this directory:

    $ gcloud builds submit . --config=cloudbuild.yaml

