# Setup of CX Portal & IAM for local development

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.6.0](https://img.shields.io/badge/AppVersion-1.6.0-informational?style=flat-square) ![Tag](https://img.shields.io/static/v1?label=&message=LeadingRepository&color=green&style=flat)

This helm chart installs the CX Portal and the CX IAM Keycloak instances.

It is meant for the local setup of the those components in order to aid the local development.

## Installation

To install the helm chart into your local Minikube cluster:

Make sure to clone the [portal-cd](https://github.com/eclipse-tractusx/portal-cd) repository beforehand, then execute the following commands:

```shell
$ cd charts/localdev/
$ helm dependency update
$ helm install portal-iam-dev .
```

To set your own configuration and secret values, install the helm chart with your own values file:

```shell
$ helm install -f your-values.yaml portal-iam-dev .
```
In order to enable the local access via ingress, enable the according addon for Minikube:

```shell
$ minikube addons enable ingress
```

And adjust your local hosts file so that the chosen hostnames resolve to the IP address of your Minikube.

To find out the IP address of your Minikube:
```shell
$ minikube ip
```
TLS:

openssl genrsa -out ca.key 2048
cp /etc/ssl/openssl.cnf openssl-with-ca.cnf

add in openssl-with-ca.cnf under '[ v3_ca ]' the following:
basicConstraints = critical,CA:TRUE
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer:always

openssl req -x509 -new -nodes -key ca.key -sha256 -days 1024 -out ca.crt -extensions v3_ca -config openssl-with-ca.cnf

cat "ca.crt" | base64


## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://eclipse-tractusx.github.io/charts/dev | centralidp | 1.2.0 |
| https://eclipse-tractusx.github.io/charts/dev | portal | 1.6.0 |
| https://eclipse-tractusx.github.io/charts/dev | sharedidp | 1.2.0 |
| https://helm.runix.net | pgadmin4 | 1.15.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| portal.enabled | bool | `true` |  |
| portal.replicaCount | int | `1` |  |
| portal.frontend.ingress.enabled | bool | `true` |  |
| portal.frontend.ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| portal.frontend.ingress.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$1"` |  |
| portal.frontend.ingress.annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| portal.frontend.ingress.annotations."nginx.ingress.kubernetes.io/enable-cors" | string | `"true"` |  |
| portal.frontend.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-origin" | string | `"https://*.example.org"` |  |
| portal.frontend.ingress.tls[0] | object | `{"hosts":["portal.example.org"],"secretName":""}` | Provide tls secret. |
| portal.frontend.ingress.tls[0].hosts | list | `["portal.example.org"]` | Provide host for tls secret. |
| portal.frontend.ingress.hosts[0].host | string | `"portal.example.org"` |  |
| portal.frontend.ingress.hosts[0].paths[0].path | string | `"/(.*)"` |  |
| portal.frontend.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| portal.frontend.ingress.hosts[0].paths[0].backend.service | string | `"portal"` |  |
| portal.frontend.ingress.hosts[0].paths[0].backend.port | int | `8080` |  |
| portal.frontend.ingress.hosts[0].paths[1].path | string | `"/registration/(.*)"` |  |
| portal.frontend.ingress.hosts[0].paths[1].pathType | string | `"Prefix"` |  |
| portal.frontend.ingress.hosts[0].paths[1].backend.service | string | `"registration"` |  |
| portal.frontend.ingress.hosts[0].paths[1].backend.port | int | `8080` |  |
| portal.frontend.ingress.hosts[0].paths[2].path | string | `"/((assets|documentation)/.*)"` |  |
| portal.frontend.ingress.hosts[0].paths[2].pathType | string | `"Prefix"` |  |
| portal.frontend.ingress.hosts[0].paths[2].backend.service | string | `"assets"` |  |
| portal.frontend.ingress.hosts[0].paths[2].backend.port | int | `8080` |  |
| portal.backend.ingress.enabled | bool | `true` |  |
| portal.backend.ingress.name | string | `"portal-backend"` |  |
| portal.backend.ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| portal.backend.ingress.annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| portal.backend.ingress.annotations."nginx.ingress.kubernetes.io/enable-cors" | string | `"true"` |  |
| portal.backend.ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"8m"` |  |
| portal.backend.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-origin" | string | `"https://*.example.org"` |  |
| portal.backend.ingress.tls[0] | object | `{"hosts":["portal-backend.example.org"],"secretName":""}` | Provide tls secret. |
| portal.backend.ingress.tls[0].hosts | list | `["portal-backend.example.org"]` | Provide host for tls secret. |
| portal.backend.ingress.hosts[0].host | string | `"portal-backend.example.org"` |  |
| portal.backend.ingress.hosts[0].paths[0].path | string | `"/api/registration"` |  |
| portal.backend.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| portal.backend.ingress.hosts[0].paths[0].backend.service | string | `"registration-service"` |  |
| portal.backend.ingress.hosts[0].paths[0].backend.port | int | `8080` |  |
| portal.backend.ingress.hosts[0].paths[1].path | string | `"/api/administration"` |  |
| portal.backend.ingress.hosts[0].paths[1].pathType | string | `"Prefix"` |  |
| portal.backend.ingress.hosts[0].paths[1].backend.service | string | `"administration-service"` |  |
| portal.backend.ingress.hosts[0].paths[1].backend.port | int | `8080` |  |
| portal.backend.ingress.hosts[0].paths[2].path | string | `"/api/notification"` |  |
| portal.backend.ingress.hosts[0].paths[2].pathType | string | `"Prefix"` |  |
| portal.backend.ingress.hosts[0].paths[2].backend.service | string | `"notification-service"` |  |
| portal.backend.ingress.hosts[0].paths[2].backend.port | int | `8080` |  |
| portal.backend.ingress.hosts[0].paths[3].path | string | `"/api/provisioning"` |  |
| portal.backend.ingress.hosts[0].paths[3].pathType | string | `"Prefix"` |  |
| portal.backend.ingress.hosts[0].paths[3].backend.service | string | `"provisioning-service"` |  |
| portal.backend.ingress.hosts[0].paths[3].backend.port | int | `8080` |  |
| portal.backend.ingress.hosts[0].paths[4].path | string | `"/api/apps"` |  |
| portal.backend.ingress.hosts[0].paths[4].pathType | string | `"Prefix"` |  |
| portal.backend.ingress.hosts[0].paths[4].backend.service | string | `"marketplace-app-service"` |  |
| portal.backend.ingress.hosts[0].paths[4].backend.port | int | `8080` |  |
| portal.backend.ingress.hosts[0].paths[5].path | string | `"/api/services"` |  |
| portal.backend.ingress.hosts[0].paths[5].pathType | string | `"Prefix"` |  |
| portal.backend.ingress.hosts[0].paths[5].backend.service | string | `"services-service"` |  |
| portal.backend.ingress.hosts[0].paths[5].backend.port | int | `8080` |  |
| centralidp.enabled | bool | `true` |  |
| centralidp.keycloak.nameOverride | string | `"centralidp"` |  |
| centralidp.keycloak.replicaCount | int | `1` |  |
| centralidp.keycloak.postgresql.nameOverride | string | `"centralidp-postgresql"` |  |
| centralidp.keycloak.ingress.enabled | bool | `true` |  |
| centralidp.keycloak.ingress.ingressClassName | string | `"nginx"` |  |
| centralidp.keycloak.ingress.hostname | string | `"centralidp.example.org"` |  |
| centralidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-credentials" | string | `"true"` |  |
| centralidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-methods" | string | `"PUT, GET, POST, OPTIONS"` |  |
| centralidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-origin" | string | `"https://centralidp.example.org"` |  |
| centralidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/enable-cors" | string | `"true"` |  |
| centralidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/proxy-buffer-size" | string | `"128k"` |  |
| centralidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/proxy-buffering" | string | `"on"` |  |
| centralidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/proxy-buffers-number" | string | `"20"` |  |
| centralidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| centralidp.keycloak.ingress.tls | bool | `false` |  |
| sharedidp.enabled | bool | `true` |  |
| sharedidp.keycloak.nameOverride | string | `"sharedidp"` |  |
| sharedidp.keycloak.replicaCount | int | `1` |  |
| sharedidp.keycloak.postgresql.nameOverride | string | `"sharedidp-postgresql"` |  |
| sharedidp.keycloak.ingress.enabled | bool | `true` |  |
| sharedidp.keycloak.ingress.ingressClassName | string | `"nginx"` |  |
| sharedidp.keycloak.ingress.hostname | string | `"sharedidp.example.org"` |  |
| sharedidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-credentials" | string | `"true"` |  |
| sharedidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-methods" | string | `"PUT, GET, POST, OPTIONS"` |  |
| sharedidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-origin" | string | `"https://sharedidp.example.org"` |  |
| sharedidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/enable-cors" | string | `"true"` |  |
| sharedidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/proxy-buffer-size" | string | `"128k"` |  |
| sharedidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/proxy-buffering" | string | `"on"` |  |
| sharedidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/proxy-buffers-number" | string | `"20"` |  |
| sharedidp.keycloak.ingress.annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| sharedidp.keycloak.ingress.tls | bool | `false` |  |
| pgadmin4.enabled | bool | `true` |  |
| pgadmin4.env.email | string | `"portal-iam@example.org"` |  |
| pgadmin4.ingress.enabled | bool | `true` |  |
| pgadmin4.ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| pgadmin4.ingress.hosts[0].host | string | `"pgadmin4.example.org"` |  |
| pgadmin4.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| pgadmin4.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |

Autogenerated with [helm docs](https://github.com/norwoodj/helm-docs)
