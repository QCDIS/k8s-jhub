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

## Deployment

To use these files with a helm deployment, add the following to the `values.yaml`:

```yaml
hub:
  initContainers:
    - name: git-clone-templates
      image: alpine/git
      args:
        - clone
        - --single-branch
        - --branch=lifeWatch
        - --depth=1
        - --
        - https://github.com/QCDIS/k8s-jhub.git
        - /etc/jupyterhub/custom
      securityContext:
        runAsUser: 0
      volumeMounts:
        - name: hub-templates
          mountPath: /etc/jupyterhub/custom
    - name: copy-static
      image: busybox:1.28
      command: ["sh", "-c", "mv /etc/jupyterhub/custom/static/* /usr/local/share/jupyterhub/static/external"]
      securityContext:
        runAsUser: 0
      volumeMounts:
        - name: hub-templates
          mountPath: /etc/jupyterhub/custom
        - name: hub-static
          mountPath: /usr/local/share/jupyterhub/static/external
  extraVolumes:
    - name: hub-templates
      emptyDir: { }
    - name: hub-static
      emptyDir: { }
  extraVolumeMounts:
    - name: hub-templates
      mountPath: /etc/jupyterhub/custom
    - name: hub-static
      mountPath: /usr/local/share/jupyterhub/static/external
  extraConfig:
    templates: |
      c.JupyterHub.template_paths = ['/etc/jupyterhub/custom/templates']
```
