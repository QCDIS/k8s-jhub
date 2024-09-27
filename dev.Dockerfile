FROM quay.io/jupyterhub/k8s-hub:3.3.7

COPY --chown=jovyan:jovyan ./templates/ /etc/jupyterhub/custom/templates/
COPY --chown=jovyan:jovyan ./static/ /usr/local/share/jupyterhub/static/