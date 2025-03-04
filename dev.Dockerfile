FROM quay.io/jupyterhub/k8s-hub:4.1.0

COPY --chown=jovyan:jovyan ./templates/ /etc/jupyterhub/custom/templates/
COPY --chown=jovyan:jovyan ./static/ /usr/local/share/jupyterhub/static/external/