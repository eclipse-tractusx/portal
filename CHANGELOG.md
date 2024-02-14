# Changelog

New features, fixed bugs, known defects and other noteworthy changes to each release of the Catena-X Portal helm chart.

## 1.8.0-RC6

### Change

* changed to new container images
  * portal-assets: v1.8.0-RC4
  * portal-frontend: v1.8.0-RC5
  * portal-frontend-registration: v1.6.0-RC5
  * portal-backend: v1.8.0-RC6
* portal-backend:
  * added configuration for company certificate

### Bugfix

* portal-backend:
  * adjusted token auth address configuration for external services
  * mounted tmp directory to enable file upload with readOnlyRootFilesystem

## 1.8.0-RC5

### Change

* changed to new container images
  * portal-frontend: v1.8.0-RC4
  * portal-frontend-registration: v1.6.0-RC4
  * portal-backend: v1.8.0-RC5
* enabled readOnlyRootFilesystem in containers (TRG-4.07)
* made imagePullPolicy configurable, default set to IfNotPresent
* added registry for image name

## 1.8.0-RC4

### Change

* changed to new container images
  * portal-assets: v1.8.0-RC3
  * portal-frontend: v1.8.0-RC3
  * portal-frontend-registration: v1.6.0-RC3
  * portal-backend: v1.8.0-RC4

## 1.8.0-RC3

### Change

* changed to new container images
  * portal-assets: v1.8.0-RC2
  * portal-frontend: v1.8.0-RC2
  * portal-backend: v1.8.0-RC3
* portal-backend:
  * added configuration for decline url in the invitation e-mail

## 1.8.0-RC2

### Change

* changed to new container images
  * portal-frontend-registration: v1.6.0-RC2
  * portal-backend: v1.8.0-RC2

## 1.8.0-RC1

### Change

* changed to new container images
  * portal-assets: v1.8.0-RC1
  * portal-frontend: v1.8.0-RC1
  * portal-frontend-registration: v1.6.0-RC1
  * portal-backend: v1.8.0-RC1.1
* portal-backend:
  * streamlined process identity config
  * added configuration for decline registration endpoint
  * enabled service conformity configuration

### Technical Support

* re-enable helm upgrade in the chart-testing workflow: the step was disabled due to major postgres upgrade in subchart in the previous version

Please be aware that **this version is still in Release Candidate phase**: especially documentation is still WIP.

## 1.7.0

### Change

* changed to new container images
  * portal-assets: v1.7.0
  * portal-frontend: v1.7.0
  * portal-frontend-registration: v1.5.4
  * portal-backend: v1.7.0
* changed PostgreSQL version of the subchart by Bitnami from 14.5.0 to 15.4.0 (subchart version updated from 11.9.13 to 12.12.x)
* set resource requests (based on recommendations from Goldilocks configured on consortia int env)
* removed deprecated ingress annotation 'kubernetes.io/ingress.class' and changed to ingress.ClassName
* portal-backend:
  * enabled and extended config in particular for network2network (N2N) and onboarding service provider (OSP)
  * updated bpdm api path
  * enabled config of DOTNET_ENVIRONMENT
  * enabled config of JWTBEAREROPTIONS_REQUIREHTTPSMETADATA
  * set database healthchecks in default values file
  * enabled and/or extended config in particular for activeDocumentTypeIds in the app marketplace and for network2network (N2N)
  * aligned uploadActiveAppDocumentTypeIds config
  * added delete and upload documentTypeIds config to appmarketplace
  * adjusted parameter for mail templates
  * adjusted the application activation login link relevant for mailing

### Bugfix

* fixed escaping of secret values: quotes added

### Technical Support

* updated k8s version and version to upgrade from for helm test workflow
* updated Security.md
* disabled upgrade step in helm test: due to major postgres upgrade the step inevitability fails
* improved helm-test: added debug option at helm install and step to check nodes
* Trivy scan: changed to no failure on high findings, as it should only fail if there is an error/misconfiguration
* added pull request linting

## 1.6.0

### Change

* changed to new container images
  * portal-assets: v1.6.0
  * portal-frontend: v1.6.0
  * portal-frontend-registration: v1.5.0
  * portal-backend: v1.6.0

* portal-backend:
  * enabled and/or extended config in particular for process identity, seeding data path and logging
  * removed config for daps

### Technical Support

* fixed helm test workflow:
  * changed ct install to helm install due too long console logs with Serilog

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