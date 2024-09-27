# k8s-jhub
UI customization for JupyterHub deployed on Kubernetes

## Development

1. Run Keycloak:

  ```shell
  git clone https://github.com/NaaVRE/NaaVRE-dev-integration
  cd NaaVRE-dev-integration
  tilt up keycloak keycloak-postgresql keycloak-keycloak-config-cli
  ```

2. Run JupyterHub:

  ```shell
  cd .../path/to/k8s-jhub
  tilt up --port 10351
  ```
