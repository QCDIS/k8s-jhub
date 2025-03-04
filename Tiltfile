allow_k8s_contexts('naavre-dev-vm')

load('ext://helm_resource', 'helm_resource')

helm_resource(
  'jupyterhub-custom',
  labels=['NaaVRE-jupyter'],
  chart='https://jupyterhub.github.io/helm-chart/jupyterhub-4.1.0.tgz',
  flags=[
    '--values=./helm-values.yaml',
    ],
  deps=['./helm-values.yaml'],
  image_deps=['qcdis/k8s-hub'],
  image_keys=[('hub.image.name', 'hub.image.tag')],
  links=['https://naavre-dev.minikube.test/naavre-jupyterhub-custom/'],
  )

custom_build(
  'qcdis/k8s-hub',
  'docker buildx build . -f ./dev.Dockerfile -t $EXPECTED_REF --push',
  [
    './dev.Dockerfile',
    './static',
    './templates',
    ],
  skips_local_docker=True,
  disable_push=True,
  )
