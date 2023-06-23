# Changelog

New features, fixed bugs, known defects and other noteworthy changes to each release of the Catena-X Portal helm chart.

## 1.5.1

### Change

* changed to new container images for portal-backend: v1.5.1

## 1.5.0

### Change

* changed to new container images
  * portal-frontend: v1.5.0
  * portal-frontend-registration: v1.4.0
  * portal-assets: v1.5.0
  * portal-backend: v1.5.0
* enabled config for portal-backend (auto-setup)
* enabled secret for interfaces to support new keys at upgrade

### Technical Support

* improved helm test workflow:

  * enabled testing of helm upgrade from different portal chart versions via workflow dispatch
  * enabled testing with different Kubernetes versions via workflow dispatch

* updated code of conduct in leading and source repositories

### Bugfix

db-dependency:

* increased max_connections for consortia environments to 200 to avoid running out of slots, which was observed at upgrade
* added general recommendation to increase max_connections from default value (100 slots) in default values file

## 1.4.0

### Change

* changed to new container images
  * portal-frontend: v1.4.0
  * portal-frontend-registration: v1.3.1
  * portal-assets: v1.4.0
  * portal-backend: v1.4.0
* changed container registry to docker hub
* renamed checklist worker to processes worker
* enabled additional config for portal-backend
* removed provisioning-service from portal-backend
* added the option to enable healthchecks for portal-backend services

### Bugfix

n/a
### Technical Support

* enabled auto-deployment to consortia dev k8s cluster from eclipse-tractusx GH org
* remove obsolete image update workflows

## 1.3.0

### Change

* changed to v1.3.0 images
* enabled additional config for portal-backend

### Bugfix

* enabled usage of existing secret values if secret exists: stops regeneration of random secret values at 'helm upgrade'
* stopped creation of the corresponding secret if database dependency is disabled

### Technical Support

* upgraded workflow actions

## 1.2.1

### Bugfix

* changed to versioned image tag for portal-migrations job in portal-backend

## 1.2.0

### Change

* changed to v1.2.0 images
* enabled additional config for portal-backend
* removed PORTAL_FRONTEND_URL environment variable for portal-frontend

### Technical Support

* trg: added repo metafile

## 1.1.0

### Change

* changed to v1.1.0 images
* enabled additional config for portal-backend

## 1.0.0

### Change

* enabled apps and jobs to use config from the environment variables.
* enabled initdb configmap with custom db user creation, removed initdb container.
* set replica count from 1 to 3.
* moved pgAdmin4 in a separate helm chart.

### Feature

* added checklist-worker job to chart.
* enabled option for external database.
* added rollingupdate strategy for apps.
* added option for resource management for apps.
* added livenessProbe and readinessProbe for frontend apps.
* added assign-pod-node: affinity-and-anti-affinity for apps.
* added for nodeSelector and toleration management for apps.

### Technical Support

* added chart test workflow for lint and install.
* added documentation for installation and changelog.

## 0.6.0

### Change

* added product helm chart for portal, combining frontend and backend chart.
* moved repository to eclipse-tractusx.