# Changelog

New features, fixed bugs, known defects and other noteworthy changes to each release of the Catena-X Portal helm chart.

## 2.6.0

### Change

* changed to new container images
  * portal-frontend: 2.6.0
  * portal-backend: 2.6.0
  * portal-assets: 2.6.0
  * portal-frontend-registration: v2.2.2
* postgresql dependency
  * change reference for postgresql bitnami image to bitnamilegacy/postgresql registry [#563](https://github.com/eclipse-tractusx/portal/pull/563)

## 2.5.0

* changed to new container images
  * portal-frontend: 2.5.0
  * portal-backend: 2.5.0
  * portal-assets: 2.5.0
  * portal-frontend-registration: v2.2.1
* portal-backend
  * added configuration for region specific clearinghouses and SD toggle [#539](https://github.com/eclipse-tractusx/portal/pull/539)
  * increased memory for administration service [#544](https://github.com/eclipse-tractusx/portal/pull/544)

### Bugfixes

* portal-backend
  * fixed image pull secret indentation for cronjobs [#533](https://github.com/eclipse-tractusx/portal/pull/533)

## 2.4.0

### Change

* changed to new container images
  * portal-frontend: v2.4.0
  * portal-backend: v2.4.0
  * portal-assets: v2.4.0
  * portal-frontend-registration: v2.2.0
* portal-backend
  * set BPDM pool url for process worker [#472](https://github.com/eclipse-tractusx/portal/pull/472)
  * added configuration for UserRolesAccessibleByProviderOnly [#496](https://github.com/eclipse-tractusx/portal/pull/496)
  * added configuration for provider only roles [#501](https://github.com/eclipse-tractusx/portal/pull/501)
  * updated sd-factory path for tagus [#514](https://github.com/eclipse-tractusx/portal/pull/514)
  * increased memory for services service [#515](https://github.com/eclipse-tractusx/portal/pull/515)
  * added connectorAllowSdDocumentSkipErrorCode to configuration [#523](https://github.com/eclipse-tractusx/portal/pull/523)
  * change region value in testdata to notnull [#521](https://github.com/eclipse-tractusx/portal/pull/521)
* improved resources for helm test [#504](https://github.com/eclipse-tractusx/portal/pull/504)

### Bugfixes

* portal-backend
  * changed did base location for app and services service [#515](https://github.com/eclipse-tractusx/portal/pull/515)
  * removed sdfactoryIssuerBpn configuration [#516](https://github.com/eclipse-tractusx/portal/pull/516)
  * fixed bpdm pool address for membership activation [#518](https://github.com/eclipse-tractusx/portal/pull/518)

## 2.3.0

### Feature

* enabled seeding of operator information and test data [#450](https://github.com/eclipse-tractusx/portal/pull/450)
* added imagePullSecrets for jobs (previously only deployments had been enabled) [#431](https://github.com/eclipse-tractusx/portal/pull/431)

### Change

* changed to new container images
  * portal-frontend: v2.3.0
  * portal-backend: v2.3.0
  * portal-assets: v2.3.0
  * portal-frontend-registration: v2.1.0
* portal-backend:
  * added configuration for bpdmStartReady toggle [#403](https://github.com/eclipse-tractusx/portal/pull/403)
  * added configuration for bpn access [#426](https://github.com/eclipse-tractusx/portal/pull/426)
  * added configuration to for maintenance job to retrigger clearinghouse [#418](https://github.com/eclipse-tractusx/portal/pull/418)
  * added DIM user roles to service account settings [#435](https://github.com/eclipse-tractusx/portal/pull/435)
  * adjusted configuration for enabled startSharingStateAsReady from BPDM side [#445](https://github.com/eclipse-tractusx/portal/pull/445)
  * added dimUserRole configuration [#440](https://github.com/eclipse-tractusx/portal/pull/440)
  * changed operator default information [#469](https://github.com/eclipse-tractusx/portal/pull/469)
* portal-frontend [#438](https://github.com/eclipse-tractusx/portal/pull/438)
  * added client ID value for BPDM
  * moved clearinghouseConnectDisabled from backend to global
  * enabled additional environment variables
    * CLEARINGHOUSE_CONNECT_DISABLED
    * CLIENT_ID_REGISTRATION
    * CLIENT_ID_BPDM

### Bugfixes

* portal-backend: adjusted DIM configuration to enable other Identity Provider than centralidp [#455](https://github.com/eclipse-tractusx/portal/pull/455)
* portal-frontend: updated Onboarding Service Provider (OSP) path to camelCase [#448](https://github.com/eclipse-tractusx/portal/pull/448)

## 2.2.0

### Change

* changed to new container images
  * portal-frontend: v2.2.0
  * portal-backend: v2.2.0
  * portal-assets: v2.2.0
* portal-backend:
  * added config value for clearinghouseConnectDisabled to the registration settings in the administration service [#400](https://github.com/eclipse-tractusx/portal/pull/400)
  * added config value for self description documents in the processes worker [#419](https://github.com/eclipse-tractusx/portal/pull/419)

### Feature

- added imagePullSecrets [#396](https://github.com/eclipse-tractusx/portal/pull/396)

### Technical Support

* changed licensing and legal docs [#345](https://github.com/eclipse-tractusx/portal/pull/345)
* dev-flow: maintain latest changes in main branch [#346](https://github.com/eclipse-tractusx/portal/pull/346)

## 2.1.0

### Change

* changed to new container images
  * portal-frontend: v2.1.0
  * portal-backend: v2.1.0
  * portal-assets: v2.1.0
  * portal-frontend-registration: v2.0.1
* portal frontend: enabled bpdm pool and company api urls [#317](https://github.com/eclipse-tractusx/portal/pull/317)
* portal-backend:
  * clearinghouse: added feature toggle for sd connectivity [#344](https://github.com/eclipse-tractusx/portal/pull/344)
  * portalmigrations: enabled seeding of test data with configmap and moved processidentity userid into job [#356](https://github.com/eclipse-tractusx/portal/pull/356)
  * added configuration values for external service information [#385](https://github.com/eclipse-tractusx/portal/pull/385)

### Technical Support

* updated deployment configuration [#354](https://github.com/eclipse-tractusx/portal/pull/354)
  * added config for association environment
  * moved config into environments directory
  * removed obsolete config
  * added information about config in notice file
* added install comment to useDimWallet value [361](https://github.com/eclipse-tractusx/portal/pull/361)

### Bugfix

* portal-backend:
  * added environment variable to use dim in application checklist bpdm of the processes worker job [361](https://github.com/eclipse-tractusx/portal/pull/361)
  * removed obsolete centralidp database configuration [#355](https://github.com/eclipse-tractusx/portal/pull/355), removed unused secret [#383](https://github.com/eclipse-tractusx/portal/pull/383)
  * changed to directoryApiAddress of bpn did resolver in administration service configuration [#364](https://github.com/eclipse-tractusx/portal/pull/364)
  * increased memory for services service [#359](https://github.com/eclipse-tractusx/portal/pull/359)
  * set correct path for consent osp link in mail notification [#371](https://github.com/eclipse-tractusx/portal/pull/371)
  * update role name for app approval notifications [#372](https://github.com/eclipse-tractusx/portal/pull/372)
  aligned dim and issuerComponent encryption key config [#368](https://github.com/eclipse-tractusx/portal/pull/368)

## 2.0.0

### Change

* changed to new container images
  * portal-frontend: v2.0.0
  * portal-backend: v2.0.0
  * portal-assets: v2.0.0
  * portal-frontend-registration: v2.0.0
* portal-frontend:
  * made realm and clients configurable for frontend deployments (in the backend they were already configurable)
  * changed bdpm pool api path and improve configuration
  * made https url patterns configurable
* portal-backend:
  * moved mailing and invitation configuration to processes worker
  * added new encryption configuration for onboarding service provider (osp)
  * added configuration for issuer component and dim (digital identity management)
  * removed obsolete db setting from administration, registration and notification service deployments
  * moved bpdm api paths into config / helm chart
  * activated dim wallet creation
  * added configuration for bpn did resolver
  * enabled configuration for ssi-credential-issuer integration
  * added configuration for decentral identity urls
  * adjusted clearinghouse configuration: added useWallet flag
  * added dimUserRoles to configuration
  * added decline url for invite process
  * added parameter clockSkew to jwtBearerOptions for token lifetime
* defined unique resource names for deployments, jobs, services and ingresses
* added labels and namespace if not already set
* named secrets in a more unique manner
* improved centralidp configuration for clients, realm and address
* changed ingress default settings according to [TRG-5.05](https://eclipse-tractusx.github.io/docs/release/trg-5/trg-5-05)
* added startup probes to frontend deployments
* set default resource limits and increase default resource requests
* db-dependency:
  * change setup to get latest minor updates
  * removed fullnameOverride

### Technical Support

* helm-test:
  * improved workflow
  * got enabled for removal for fullnameOverride and renaming for postgres secret in the case of upgrade
  * updated version to upgrade (R24.03) from and k8s version
* add dependabot.yml file
* upgraded gh actions and change to pinned actions full length commit sha
* reworked year in file header
* CONTRIBUTING.md: linked to contribution details

## 1.8.1

### Bugfix

* changed to new container image for portal-backend: v1.8.1
* changed ingress to work without tls enabled and to comply with TRG-5.04

## 1.8.0

### Change

* changed to new container images
  * portal-assets: v1.8.0
  * portal-frontend: v1.8.0
  * portal-frontend-registration: v1.6.0
  * portal-backend: v1.8.0
* enabled readOnlyRootFilesystem in containers (TRG-4.07)
* made imagePullPolicy configurable, default set to IfNotPresent
* added container registry (docker.io) to images
* defined unique "portal" template functions
* enabled template functions for database access to postgresql dependency
* portal-backend:
  * streamlined process identity config
  * added configuration for decline registration endpoint
  * enabled service conformity configuration
  * added configuration for decline url in the invitation e-mail
  * added configuration for company certificate

### Technical Support

* re-enable helm upgrade in the chart-testing workflow: the step was disabled due to major postgres upgrade in subchart in the previous version
* changed portal-cd references to portal due to repository renaming
* updated README.md
  * mentioned `docs` folder in portal-assets repository

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
