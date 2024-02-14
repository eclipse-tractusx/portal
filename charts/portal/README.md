# Helm chart for Catena-X Portal

![Version: 1.8.0-RC5](https://img.shields.io/badge/Version-1.8.0--RC5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.8.0-RC5](https://img.shields.io/badge/AppVersion-1.8.0--RC5-informational?style=flat-square)

This helm chart installs the Catena-X Portal application which consists of

* [portal-frontend (v1.8.0-RC4)](https://github.com/eclipse-tractusx/portal-frontend/tree/v1.8.0-RC4),
* [portal-frontend-registration (v1.6.0-RC4)](https://github.com/eclipse-tractusx/portal-frontend-registration/tree/v1.6.0-RC4),
* [portal-assets (v1.8.0-RC3)](https://github.com/eclipse-tractusx/portal-assets/tree/v1.8.0-RC3) and
* [portal-backend (v1.8.0-RC5)](https://github.com/eclipse-tractusx/portal-backend/tree/v1.8.0-RC5).

The Catena-X Portal is designed to work with the [Catena-X IAM](https://github.com/eclipse-tractusx/portal-iam).
This version is compatible with the 2.1.0-RC1 version of the IAM instances:
* [Central Keycloak Instance](https://github.com/eclipse-tractusx/portal-iam/blob/centralidp-2.1.0-RC1/charts/centralidp/README.md)
* [Shared Keycloak Instance](https://github.com/eclipse-tractusx/portal-iam/blob/sharedidp-2.1.0-RC1/charts/sharedidp/README.md)

For information on how to upgrade from previous versions please refer to [Version Upgrade](https://github.com/eclipse-tractusx/portal-assets/tree/v1.8.0-RC3/docs/developer/Technical%20Documentation/Version%20Upgrade/portal-upgrade-details.md).

For further information please refer to [Technical Documentation](https://github.com/eclipse-tractusx/portal-assets/tree/v1.8.0-RC3/docs/developer/Technical%20Documentation).

The referenced container images are for demonstration purposes only.

## Installation

To install the chart with the release name `portal`:

```shell
$ helm repo add tractusx-dev https://eclipse-tractusx.github.io/charts/dev
$ helm install portal tractusx-dev/portal
```

To install the helm chart into your cluster with your values:

```shell
$ helm install -f your-values.yaml portal tractusx-dev/portal
```

To use the helm chart as a dependency:

```yaml
dependencies:
  - name: portal
    repository: https://eclipse-tractusx.github.io/charts/dev
    version: 1.8.0-RC5
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 12.12.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| name | string | `"portal"` |  |
| portalAddress | string | `"https://portal.example.org"` | Provide portal base address. |
| portalBackendAddress | string | `"https://portal-backend.example.org"` | Provide portal-backend base address. |
| centralidpAddress | string | `"https://centralidp.example.org"` | Provide centralidp base address (CX IAM), without trailing '/auth'. |
| sharedidpAddress | string | `"https://sharedidp.example.org"` | Provide sharedidp address (CX IAM), without trailing '/auth'. |
| semanticsAddress | string | `"https://semantics.example.org"` | Provide semantics base address. |
| bpdmPartnersPoolAddress | string | `"https://business-partners.example.org"` | Provide bpdm partners pool base address. |
| bpdmPortalGateAddress | string | `"https://business-partners.example.org"` | Provide bpdm portal gate base address. |
| custodianAddress | string | `"https://managed-identity-wallets.example.org"` | Provide custodian base address. |
| sdfactoryAddress | string | `"https://sdfactory.example.org"` | Provide sdfactory base address. |
| clearinghouseAddress | string | `"https://validation.example.org"` | Provide clearinghouse base address. |
| clearinghouseTokenAddress | string | `"https://keycloak.example.org/realms/example/protocol/openid-connect/token"` | Provide clearinghouse token address. |
| frontend.ingress.enabled | bool | `false` | Portal frontend ingress parameters, enable ingress record generation for portal frontend. |
| frontend.ingress.className | string | `"nginx"` |  |
| frontend.ingress.annotations."nginx.ingress.kubernetes.io/rewrite-target" | string | `"/$1"` |  |
| frontend.ingress.annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| frontend.ingress.annotations."nginx.ingress.kubernetes.io/enable-cors" | string | `"true"` |  |
| frontend.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-origin" | string | `"https://*.example.org"` | Provide CORS allowed origin. |
| frontend.ingress.tls[0] | object | `{"hosts":[""],"secretName":""}` | Provide tls secret. |
| frontend.ingress.tls[0].hosts | list | `[""]` | Provide host for tls secret. |
| frontend.ingress.hosts[0] | object | `{"host":"portal.example.org","paths":[{"backend":{"port":8080,"service":"portal"},"path":"/(.*)","pathType":"Prefix"},{"backend":{"port":8080,"service":"registration"},"path":"/registration/(.*)","pathType":"Prefix"},{"backend":{"port":8080,"service":"assets"},"path":"/((assetsORdocumentation)/.*)","pathType":"Prefix"}]}` | Provide default path for the ingress record. |
| frontend.portal.name | string | `"portal"` |  |
| frontend.portal.image.name | string | `"docker.io/tractusx/portal-frontend"` |  |
| frontend.portal.image.portaltag | string | `"v1.8.0-RC4"` |  |
| frontend.portal.image.pullPolicy | string | `"IfNotPresent"` |  |
| frontend.portal.resources | object | `{"requests":{"cpu":"15m","memory":"105M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| frontend.registration.name | string | `"registration"` |  |
| frontend.registration.image.name | string | `"docker.io/tractusx/portal-frontend-registration"` |  |
| frontend.registration.image.registrationtag | string | `"v1.6.0-RC4"` |  |
| frontend.registration.image.pullPolicy | string | `"IfNotPresent"` |  |
| frontend.registration.resources | object | `{"requests":{"cpu":"15m","memory":"105M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| frontend.assets.name | string | `"assets"` |  |
| frontend.assets.image.name | string | `"docker.io/tractusx/portal-assets"` |  |
| frontend.assets.image.assetstag | string | `"v1.8.0-RC3"` |  |
| frontend.assets.image.pullPolicy | string | `"IfNotPresent"` |  |
| frontend.assets.resources | object | `{"requests":{"cpu":"15m","memory":"105M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| frontend.assets.path | string | `"/assets"` |  |
| frontend.centralidpAuthPath | string | `"/auth"` |  |
| frontend.bpdmPartnersPoolApiPath | string | `"/pool/api"` |  |
| backend.ingress.enabled | bool | `false` | Portal-backend ingress parameters, enable ingress record generation for portal-backend. |
| backend.ingress.name | string | `"portal-backend"` |  |
| backend.ingress.className | string | `"nginx"` |  |
| backend.ingress.annotations."nginx.ingress.kubernetes.io/use-regex" | string | `"true"` |  |
| backend.ingress.annotations."nginx.ingress.kubernetes.io/enable-cors" | string | `"true"` |  |
| backend.ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"8m"` |  |
| backend.ingress.annotations."nginx.ingress.kubernetes.io/cors-allow-origin" | string | `"https://*.example.org"` | Provide CORS allowed origin. |
| backend.ingress.tls[0] | object | `{"hosts":[""],"secretName":""}` | Provide tls secret. |
| backend.ingress.tls[0].hosts | list | `[""]` | Provide host for tls secret. |
| backend.ingress.hosts[0] | object | `{"host":"portal-backend.example.org","paths":[{"backend":{"port":8080,"service":"registration-service"},"path":"/api/registration","pathType":"Prefix"},{"backend":{"port":8080,"service":"administration-service"},"path":"/api/administration","pathType":"Prefix"},{"backend":{"port":8080,"service":"notification-service"},"path":"/api/notification","pathType":"Prefix"},{"backend":{"port":8080,"service":"provisioning-service"},"path":"/api/provisioning","pathType":"Prefix"},{"backend":{"port":8080,"service":"marketplace-app-service"},"path":"/api/apps","pathType":"Prefix"},{"backend":{"port":8080,"service":"services-service"},"path":"/api/services","pathType":"Prefix"}]}` | Provide default path for the ingress record. |
| backend.dotnetEnvironment | string | `"Production"` |  |
| backend.dbConnection.schema | string | `"portal"` |  |
| backend.dbConnection.sslMode | string | `"Disable"` |  |
| backend.portalHomePath | string | `"/home"` |  |
| backend.portalHelpPath | string | `"/documentation"` |  |
| backend.portalPasswordResendPath | string | `"/home/passwordResend"` | The password resend logic is not yet implemented in the backend - this will currently lead to a 404 page when clicking on the link in the mail |
| backend.portalIntroductionCompanyRolePath | string | `"/companyroles"` |  |
| backend.portalIntroductionDataspacePath | string | `"/dataspace"` |  |
| backend.userManagementPath | string | `"/usermanagement"` |  |
| backend.keycloak.secret | string | `"secret-backend-keycloak"` | Secret containing the database-password and the client-secret for the connection to the centralidp (CX IAM) and the client-secret for the connection to the sharedidp (CX-IAM). |
| backend.keycloak.central.clientId | string | `"central-client-id"` | Provide centralidp client-id from CX IAM centralidp. |
| backend.keycloak.central.clientSecret | string | `""` | Client-secret for centralidp client-id. Secret-key 'central-client-secret'. |
| backend.keycloak.central.authRealm | string | `"CX-Central"` |  |
| backend.keycloak.central.jwtBearerOptions.requireHttpsMetadata | string | `"true"` |  |
| backend.keycloak.central.jwtBearerOptions.metadataPath | string | `"/auth/realms/CX-Central/.well-known/openid-configuration"` |  |
| backend.keycloak.central.jwtBearerOptions.tokenValidationParameters.validIssuerPath | string | `"/auth/realms/CX-Central"` |  |
| backend.keycloak.central.jwtBearerOptions.tokenValidationParameters.validAudiencePortal | string | `"Cl2-CX-Portal"` |  |
| backend.keycloak.central.jwtBearerOptions.tokenValidationParameters.validAudienceRegistration | string | `"Cl1-CX-Registration"` |  |
| backend.keycloak.central.jwtBearerOptions.refreshInterval | string | `"00:00:30"` |  |
| backend.keycloak.central.tokenPath | string | `"/auth/realms/CX-Central/protocol/openid-connect/token"` |  |
| backend.keycloak.central.dbConnection.host | string | `"centralidp-postgresql-primary"` |  |
| backend.keycloak.central.dbConnection.port | int | `5432` |  |
| backend.keycloak.central.dbConnection.user | string | `"kccentral"` |  |
| backend.keycloak.central.dbConnection.database | string | `"iamcentralidp"` |  |
| backend.keycloak.central.dbConnection.password | string | `""` | Password for the kccentral username. Secret-key 'central-db-password'. |
| backend.keycloak.central.dbConnection.schema | string | `"public"` |  |
| backend.keycloak.central.dbConnection.sslMode | string | `"Disable"` |  |
| backend.keycloak.central.useAuthTrail | bool | `true` | Flag if the api should be used with an leading /auth path |
| backend.keycloak.shared.clientId | string | `"shared-client-id"` | Provide sharedidp client-id from CX IAM sharedidp. |
| backend.keycloak.shared.clientSecret | string | `""` | Client-secret for sharedidp client-id. Secret-key 'shared-client-secret'. |
| backend.keycloak.shared.authRealm | string | `"master"` |  |
| backend.keycloak.shared.useAuthTrail | bool | `true` | Flag if the api should be used with an leading /auth path |
| backend.keycloak.shareddelete.clientId | string | `"shareddelete-client-id"` | Provide the delete sharedidp client-id from CX IAM sharedidp. |
| backend.keycloak.shareddelete.clientSecret | string | `""` | Client-secret for the delete sharedidp client-id. Secret-key 'shareddelete-client-secret'. |
| backend.keycloak.shareddelete.authRealm | string | `"master"` |  |
| backend.keycloak.shareddelete.useAuthTrail | bool | `true` | Flag if the api should be used with an leading /auth path |
| backend.mailing.secret | string | `"secret-backend-mailing"` | Secret containing the passwords for backend.mailing and backend.provisioning.sharedRealm. |
| backend.mailing.host | string | `"smtp.example.org"` | Provide host. |
| backend.mailing.port | string | `"587"` | Provide port. |
| backend.mailing.user | string | `"smtp-user"` | Provide user. |
| backend.mailing.password | string | `""` | Password for the smtp username. Secret-key 'password'. |
| backend.mailing.senderEmail | string | `"email@example.org"` | The email which is set as a sender |
| backend.interfaces.secret | string | `"secret-backend-interfaces"` | Secret containing the client-secrets for the connection to custodian, bpdm, sdFactory, clearinghouse, offer provider and onboarding service provider. |
| backend.healthChecks.startup.path | string | `"/health/startup"` |  |
| backend.healthChecks.liveness.path | string | `"/healthz"` |  |
| backend.healthChecks.readyness.path | string | `"/ready"` |  |
| backend.registration.name | string | `"registration-service"` |  |
| backend.registration.image.name | string | `"docker.io/tractusx/portal-registration-service"` |  |
| backend.registration.image.registrationservicetag | string | `"v1.8.0-RC5"` |  |
| backend.registration.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.registration.resources | object | `{"requests":{"cpu":"15m","memory":"385M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| backend.registration.logging.bpdmLibrary | string | `"Information"` |  |
| backend.registration.logging.registrationService | string | `"Information"` |  |
| backend.registration.logging.default | string | `"Information"` |  |
| backend.registration.healthChecks | object | `{"startup":{"tags":[{"name":"HEALTHCHECKS__0__TAGS__1","value":"portaldb"}]}}` | Keycloak Healthcheck to be enabled for startupProbe; once the centralidp Keycloak instance is available, enable healthcheck by uncommenting. |
| backend.registration.portalRegistrationPath | string | `"/registration/"` |  |
| backend.registration.keycloakClientId | string | `"Cl1-CX-Registration"` |  |
| backend.registration.applicationStatusIds.status0 | string | `"SUBMITTED"` |  |
| backend.registration.applicationStatusIds.status1 | string | `"DECLINED"` |  |
| backend.registration.applicationStatusIds.status2 | string | `"CONFIRMED"` |  |
| backend.registration.applicationDeclineStatusIds.status0 | string | `"CREATED"` |  |
| backend.registration.applicationDeclineStatusIds.status1 | string | `"ADD_COMPANY_DATA"` |  |
| backend.registration.applicationDeclineStatusIds.status2 | string | `"INVITE_USER"` |  |
| backend.registration.applicationDeclineStatusIds.status3 | string | `"SELECT_COMPANY_ROLE"` |  |
| backend.registration.applicationDeclineStatusIds.status4 | string | `"UPLOAD_DOCUMENTS"` |  |
| backend.registration.applicationDeclineStatusIds.status5 | string | `"VERIFY"` |  |
| backend.registration.documentTypeIds.type0 | string | `"CX_FRAME_CONTRACT"` |  |
| backend.registration.documentTypeIds.type1 | string | `"COMMERCIAL_REGISTER_EXTRACT"` |  |
| backend.registration.swaggerEnabled | bool | `false` |  |
| backend.registration.registrationDocumentTypeIds.type0 | string | `"CX_FRAME_CONTRACT"` |  |
| backend.registration.submitDocumentTypeIds.type0 | string | `"COMMERCIAL_REGISTER_EXTRACT"` |  |
| backend.administration.name | string | `"administration-service"` |  |
| backend.administration.image.name | string | `"docker.io/tractusx/portal-administration-service"` |  |
| backend.administration.image.administrationservicetag | string | `"v1.8.0-RC5"` |  |
| backend.administration.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.administration.resources | object | `{"requests":{"cpu":"15m","memory":"385M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| backend.administration.logging.businessLogic | string | `"Information"` |  |
| backend.administration.logging.sdfactoryLibrary | string | `"Information"` |  |
| backend.administration.logging.bpdmLibrary | string | `"Information"` |  |
| backend.administration.logging.custodianLibrary | string | `"Information"` |  |
| backend.administration.logging.default | string | `"Information"` |  |
| backend.administration.healthChecks | object | `{"startup":{"tags":[{"name":"HEALTHCHECKS__0__TAGS__1","value":"portaldb"},{"name":"HEALTHCHECKS__0__TAGS__2","value":"provisioningdb"}]}}` | Keycloak Healthcheck to be enabled for startupProbe; once the centralidp Keycloak instance is available, enable healthcheck by uncommenting. |
| backend.administration.companyData.useCaseParticipationMediaTypes.type0 | string | `"PDF"` |  |
| backend.administration.companyData.ssiCertificateMediaTypes.type0 | string | `"PDF"` |  |
| backend.administration.companyData.companyCertificateMediaTypes.type0 | string | `"PDF"` |  |
| backend.administration.connectors.validCertificationContentTypes.type0 | string | `"application/x-pem-file"` |  |
| backend.administration.connectors.validCertificationContentTypes.type1 | string | `"application/x-x509-ca-cert"` |  |
| backend.administration.connectors.validCertificationContentTypes.type2 | string | `"application/pkix-cert"` |  |
| backend.administration.connectors.validCertificationContentTypes.type3 | string | `"application/octet-stream"` |  |
| backend.administration.connectors.selfDescriptionDocumentPath | string | `"/api/administration/documents/selfDescription"` |  |
| backend.administration.keycloakClientId | string | `"Cl2-CX-Portal"` |  |
| backend.administration.identityProviderAdmin.csvSettings.fileName | string | `"identityproviderlinks.csv"` |  |
| backend.administration.identityProviderAdmin.csvSettings.contentType | string | `"text/csv"` |  |
| backend.administration.identityProviderAdmin.csvSettings.charset | string | `"UTF-8"` |  |
| backend.administration.identityProviderAdmin.csvSettings.separator | string | `","` |  |
| backend.administration.identityProviderAdmin.csvSettings.headerUserId | string | `"UserId"` |  |
| backend.administration.identityProviderAdmin.csvSettings.headerFirstName | string | `"FirstName"` |  |
| backend.administration.identityProviderAdmin.csvSettings.headerLastName | string | `"LastName"` |  |
| backend.administration.identityProviderAdmin.csvSettings.headerEmail | string | `"Email"` |  |
| backend.administration.identityProviderAdmin.csvSettings.headerProviderAlias | string | `"ProviderAlias"` |  |
| backend.administration.identityProviderAdmin.csvSettings.headerProviderUserId | string | `"ProviderUserId"` |  |
| backend.administration.identityProviderAdmin.csvSettings.headerProviderUserName | string | `"ProviderUserName"` |  |
| backend.administration.identityProviderAdmin.deleteIdpRoles.role0 | string | `"Company Admin"` |  |
| backend.administration.identityProviderAdmin.deleteIdpRoles.role1 | string | `"IT Admin"` |  |
| backend.administration.identityProviderAdmin.deactivateIdpRoles.role0 | string | `"Company Admin"` |  |
| backend.administration.identityProviderAdmin.deactivateIdpRoles.role1 | string | `"IT Admin"` |  |
| backend.administration.invitation.invitedUserInitialRoles.role0 | string | `"Company Admin"` |  |
| backend.administration.invitation.initialLoginTheme | string | `"catenax-shared"` |  |
| backend.administration.invitation.closeApplicationPath | string | `"/decline"` |  |
| backend.administration.registration.documentTypeIds.type0 | string | `"COMMERCIAL_REGISTER_EXTRACT"` |  |
| backend.administration.userManagement.companyUserStatusIds.status0 | string | `"ACTIVE"` |  |
| backend.administration.userManagement.companyUserStatusIds.status1 | string | `"INACTIVE"` |  |
| backend.administration.userManagement.userAdminRoles.role0 | string | `"Company Admin"` |  |
| backend.administration.userManagement.userAdminRoles.role1 | string | `"IT Admin"` |  |
| backend.administration.serviceAccount.clientId | string | `"technical_roles_management"` |  |
| backend.administration.swaggerEnabled | bool | `false` |  |
| backend.administration.frameDocumentTypeIds.type0 | string | `"CX_FRAME_CONTRACT"` |  |
| backend.administration.onboardingServiceProvider.encryptionKey | string | `""` | Client-secret for onboardingserviceprovider encryptionKey. Secret-key 'onboardingserviceprovider-encryption-key'. |
| backend.provisioning.centralRealm | string | `"CX-Central"` |  |
| backend.provisioning.centralRealmId | string | `"CX-Central"` |  |
| backend.provisioning.invitedUserInitialRoles.registration | string | `"Company Admin"` |  |
| backend.provisioning.serviceAccountClientPrefix | string | `"sa"` |  |
| backend.provisioning.centralIdentityProvider.clientId | string | `"central-idp"` |  |
| backend.provisioning.sharedRealmClient.clientId | string | `"central-idp"` |  |
| backend.provisioning.sharedRealm.smtpServer.host | string | `"smtp.example.org"` | Provide host. |
| backend.provisioning.sharedRealm.smtpServer.port | string | `"587"` | Provide port. |
| backend.provisioning.sharedRealm.smtpServer.user | string | `"smtp-user"` | Provide user. |
| backend.provisioning.sharedRealm.smtpServer.password | string | `""` | Password for the smtp username. Secret-key 'provisioning-sharedrealm-password'. |
| backend.provisioning.sharedRealm.smtpServer.ssl | string | `""` |  |
| backend.provisioning.sharedRealm.smtpServer.startTls | string | `"true"` |  |
| backend.provisioning.sharedRealm.smtpServer.auth | string | `"true"` |  |
| backend.provisioning.sharedRealm.smtpServer.from | string | `"smtp@example.org"` | Provide from. |
| backend.provisioning.sharedRealm.smtpServer.replyTo | string | `"smtp@example.org"` | Provide replyTo. |
| backend.appmarketplace.name | string | `"marketplace-app-service"` |  |
| backend.appmarketplace.image.name | string | `"docker.io/tractusx/portal-marketplace-app-service"` |  |
| backend.appmarketplace.image.appmarketplaceservicetag | string | `"v1.8.0-RC5"` |  |
| backend.appmarketplace.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.appmarketplace.resources | object | `{"requests":{"cpu":"15m","memory":"445M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| backend.appmarketplace.logging.default | string | `"Information"` |  |
| backend.appmarketplace.logging.offersLibrary | string | `"Information"` |  |
| backend.appmarketplace.healthChecks | object | `{"startup":{"tags":[{"name":"HEALTHCHECKS__0__TAGS__1","value":"portaldb"}]}}` | Keycloak Healthcheck to be enabled for startupProbe; once the centralidp Keycloak instance is available, enable healthcheck by uncommenting. |
| backend.appmarketplace.appOverviewPath | string | `"/appoverview"` |  |
| backend.appmarketplace.subscriptionPath | string | `"/appsubscription"` |  |
| backend.appmarketplace.detailPath | string | `"/appdetail"` |  |
| backend.appmarketplace.catenaAdminRoles.role0 | string | `"CX Admin"` |  |
| backend.appmarketplace.serviceAccountRoles.role0 | string | `"App Tech User"` |  |
| backend.appmarketplace.salesManagerRoles.role0 | string | `"Sales Manager"` |  |
| backend.appmarketplace.serviceManagerRoles.role0 | string | `"App Manager"` |  |
| backend.appmarketplace.subscriptionManagerRoles.role0 | string | `"App Manager"` |  |
| backend.appmarketplace.subscriptionManagerRoles.role1 | string | `"Sales Manager"` |  |
| backend.appmarketplace.activeAppCompanyAdminRoles.role0 | string | `"IT Admin"` |  |
| backend.appmarketplace.activeAppCompanyAdminRoles.role1 | string | `"Company Admin"` |  |
| backend.appmarketplace.approveAppUserRoles.role0 | string | `"Sales Manager"` |  |
| backend.appmarketplace.approveAppUserRoles.role1 | string | `"Service Manager"` |  |
| backend.appmarketplace.activationUserRoles.role0 | string | `"Sales Manager"` |  |
| backend.appmarketplace.activationUserRoles.role1 | string | `"App Manager"` |  |
| backend.appmarketplace.ITAdminRoles.role0 | string | `"IT Admin"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.documentTypeId0 | string | `"APP_TECHNICAL_INFORMATION"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.mediaTypeIds0.mediaTypeId0 | string | `"PDF"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.documentTypeId1 | string | `"APP_LEADIMAGE"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.mediaTypeIds1.mediaTypeId0 | string | `"JPEG"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.mediaTypeIds1.mediaTypeId1 | string | `"PNG"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.mediaTypeIds1.mediaTypeId2 | string | `"SVG"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.documentTypeId2 | string | `"APP_IMAGE"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.mediaTypeIds2.mediaTypeId0 | string | `"JPEG"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.mediaTypeIds2.mediaTypeId1 | string | `"PNG"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.mediaTypeIds2.mediaTypeId2 | string | `"SVG"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.documentTypeId3 | string | `"APP_CONTRACT"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.mediaTypeIds3.mediaTypeId0 | string | `"PDF"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.documentTypeId4 | string | `"ADDITIONAL_DETAILS"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.mediaTypeIds4.mediaTypeId0 | string | `"PDF"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.documentTypeId5 | string | `"CONFORMITY_APPROVAL_BUSINESS_APPS"` |  |
| backend.appmarketplace.uploadAppDocumentTypeIds.mediaTypeIds5.mediaTypeId0 | string | `"PDF"` |  |
| backend.appmarketplace.deleteDocumentTypeIds.type0 | string | `"APP_CONTRACT"` |  |
| backend.appmarketplace.deleteDocumentTypeIds.type1 | string | `"ADDITIONAL_DETAILS"` |  |
| backend.appmarketplace.deleteDocumentTypeIds.type2 | string | `"APP_TECHNICAL_INFORMATION"` |  |
| backend.appmarketplace.deleteDocumentTypeIds.type3 | string | `"APP_LEADIMAGE"` |  |
| backend.appmarketplace.deleteDocumentTypeIds.type4 | string | `"APP_IMAGE"` |  |
| backend.appmarketplace.deleteDocumentTypeIds.type5 | string | `"CONFORMITY_APPROVAL_BUSINESS_APPS"` |  |
| backend.appmarketplace.submitAppDocumentTypeIds.type0 | string | `"APP_LEADIMAGE"` |  |
| backend.appmarketplace.submitAppDocumentTypeIds.type1 | string | `"APP_IMAGE"` |  |
| backend.appmarketplace.submitAppDocumentTypeIds.type2 | string | `"CONFORMITY_APPROVAL_BUSINESS_APPS"` |  |
| backend.appmarketplace.activeAppDocumentTypeIds.type0 | string | `"APP_IMAGE"` |  |
| backend.appmarketplace.activeAppDocumentTypeIds.type1 | string | `"APP_TECHNICAL_INFORMATION"` |  |
| backend.appmarketplace.activeAppDocumentTypeIds.type2 | string | `"APP_CONTRACT"` |  |
| backend.appmarketplace.activeAppDocumentTypeIds.type3 | string | `"ADDITIONAL_DETAILS"` |  |
| backend.appmarketplace.deleteActiveAppDocumentTypeIds.type0 | string | `"APP_IMAGE"` |  |
| backend.appmarketplace.deleteActiveAppDocumentTypeIds.type1 | string | `"APP_TECHNICAL_INFORMATION"` |  |
| backend.appmarketplace.deleteActiveAppDocumentTypeIds.type2 | string | `"APP_CONTRACT"` |  |
| backend.appmarketplace.deleteActiveAppDocumentTypeIds.type3 | string | `"ADDITIONAL_DETAILS"` |  |
| backend.appmarketplace.uploadActiveAppDocumentTypeIds.documentTypeId0 | string | `"APP_IMAGE"` |  |
| backend.appmarketplace.uploadActiveAppDocumentTypeIds.mediaTypeIds0.mediaTypeId0 | string | `"JPEG"` |  |
| backend.appmarketplace.uploadActiveAppDocumentTypeIds.mediaTypeIds0.mediaTypeId1 | string | `"PNG"` |  |
| backend.appmarketplace.uploadActiveAppDocumentTypeIds.documentTypeId1 | string | `"APP_TECHNICAL_INFORMATION"` |  |
| backend.appmarketplace.uploadActiveAppDocumentTypeIds.mediaTypeIds1.mediaTypeId0 | string | `"PDF"` |  |
| backend.appmarketplace.uploadActiveAppDocumentTypeIds.documentTypeId2 | string | `"APP_CONTRACT"` |  |
| backend.appmarketplace.uploadActiveAppDocumentTypeIds.mediaTypeIds2.mediaTypeId0 | string | `"PDF"` |  |
| backend.appmarketplace.uploadActiveAppDocumentTypeIds.documentTypeId3 | string | `"ADDITIONAL_DETAILS"` |  |
| backend.appmarketplace.uploadActiveAppDocumentTypeIds.mediaTypeIds3.mediaTypeId0 | string | `"PDF"` |  |
| backend.appmarketplace.notificationTypeIds.type0 | string | `"APP_RELEASE_REQUEST"` |  |
| backend.appmarketplace.activeAppNotificationTypeIds.type0 | string | `"APP_ROLE_ADDED"` |  |
| backend.appmarketplace.submitAppNotificationTypeIds.type0 | string | `"APP_RELEASE_REQUEST"` |  |
| backend.appmarketplace.approveAppNotificationTypeIds.type0 | string | `"APP_RELEASE_APPROVAL"` |  |
| backend.appmarketplace.appImageDocumentTypeIds.type0 | string | `"APP_LEADIMAGE"` |  |
| backend.appmarketplace.appImageDocumentTypeIds.type1 | string | `"APP_IMAGE"` |  |
| backend.appmarketplace.appImageDocumentTypeIds.type2 | string | `"APP_CONTRACT"` |  |
| backend.appmarketplace.appImageDocumentTypeIds.type3 | string | `"ADDITIONAL_DETAILS"` |  |
| backend.appmarketplace.appImageDocumentTypeIds.type4 | string | `"APP_TECHNICAL_INFORMATION"` |  |
| backend.appmarketplace.appImageDocumentTypeIds.type5 | string | `"CONFORMITY_APPROVAL_BUSINESS_APPS"` |  |
| backend.appmarketplace.offerStatusIds.status0 | string | `"IN_REVIEW"` |  |
| backend.appmarketplace.offerStatusIds.status1 | string | `"ACTIVE"` |  |
| backend.appmarketplace.swaggerEnabled | bool | `false` |  |
| backend.appmarketplace.technicalUserProfileClient | string | `"technical_roles_management"` |  |
| backend.appmarketplace.companyAdminRoles.role0 | string | `"Company Admin"` |  |
| backend.portalmigrations.name | string | `"portal-migrations"` |  |
| backend.portalmigrations.image.name | string | `"docker.io/tractusx/portal-portal-migrations"` |  |
| backend.portalmigrations.image.portalmigrationstag | string | `"v1.8.0-RC5"` |  |
| backend.portalmigrations.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.portalmigrations.resources | object | `{"requests":{"cpu":"15m","memory":"105M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| backend.portalmigrations.seeding.testDataEnvironments | string | `""` |  |
| backend.portalmigrations.seeding.testDataPaths | string | `"Seeder/Data"` | when changing the testDataPath the processIdentity needs to be adjusted as well, or it must be ensured that the identity is existing within the files under the new path |
| backend.portalmigrations.processIdentity.processUserId | string | `"d21d2e8a-fe35-483c-b2b8-4100ed7f0953"` |  |
| backend.portalmigrations.logging.default | string | `"Information"` |  |
| backend.portalmaintenance.name | string | `"portal-maintenance"` |  |
| backend.portalmaintenance.image.name | string | `"docker.io/tractusx/portal-maintenance-service"` |  |
| backend.portalmaintenance.image.portalmaintenancetag | string | `"v1.8.0-RC5"` |  |
| backend.portalmaintenance.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.portalmaintenance.resources | object | `{"requests":{"cpu":"15m","memory":"105M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| backend.portalmaintenance.processIdentity.processUserId | string | `"d21d2e8a-fe35-483c-b2b8-4100ed7f0953"` |  |
| backend.portalmaintenance.logging.default | string | `"Information"` |  |
| backend.notification.name | string | `"notification-service"` |  |
| backend.notification.image.name | string | `"docker.io/tractusx/portal-notification-service"` |  |
| backend.notification.image.notificationservicetag | string | `"v1.8.0-RC5"` |  |
| backend.notification.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.notification.resources | object | `{"requests":{"cpu":"15m","memory":"300M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| backend.notification.healthChecks | object | `{"startup":{"tags":[{"name":"HEALTHCHECKS__0__TAGS__1","value":"portaldb"}]}}` | Keycloak Healthcheck to be enabled for startupProbe; once the centralidp Keycloak instance is available, enable healthcheck by uncommenting. |
| backend.notification.swaggerEnabled | bool | `false` |  |
| backend.notification.logging.default | string | `"Information"` |  |
| backend.services.name | string | `"services-service"` |  |
| backend.services.image.name | string | `"docker.io/tractusx/portal-services-service"` |  |
| backend.services.image.servicesservicetag | string | `"v1.8.0-RC5"` |  |
| backend.services.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.services.resources | object | `{"requests":{"cpu":"15m","memory":"445M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| backend.services.logging.default | string | `"Information"` |  |
| backend.services.logging.offersLibrary | string | `"Information"` |  |
| backend.services.healthChecks | object | `{"startup":{"tags":[{"name":"HEALTHCHECKS__0__TAGS__1","value":"portaldb"}]}}` | Keycloak Healthcheck to be enabled for startupProbe; once the centralidp Keycloak instance is available, enable healthcheck by uncommenting. |
| backend.services.serviceOverviewPath | string | `"/serviceoverview"` |  |
| backend.services.subscriptionPath | string | `"/servicesubscription"` |  |
| backend.services.detailPath | string | `"/servicedetail"` |  |
| backend.services.catenaAdminRoles.role0 | string | `"CX Admin"` |  |
| backend.services.serviceAccountRoles.role0 | string | `"App Tech User"` |  |
| backend.services.salesManagerRoles.role0 | string | `"Sales Manager"` |  |
| backend.services.serviceManagerRoles.role0 | string | `"Service Manager"` |  |
| backend.services.subscriptionManagerRoles.role0 | string | `"Service Manager"` |  |
| backend.services.subscriptionManagerRoles.role1 | string | `"Sales Manager"` |  |
| backend.services.approveServiceUserRoles.role0 | string | `"Sales Manager"` |  |
| backend.services.approveServiceUserRoles.role1 | string | `"Service Manager"` |  |
| backend.services.activationUserRoles.role0 | string | `"Sales Manager"` |  |
| backend.services.activationUserRoles.role1 | string | `"Service Manager"` |  |
| backend.services.ITAdminRoles.role0 | string | `"IT Admin"` |  |
| backend.services.uploadServiceDocumentTypeIds.documentTypeId0 | string | `"ADDITIONAL_DETAILS"` |  |
| backend.services.uploadServiceDocumentTypeIds.mediaTypeIds0.mediaTypeId0 | string | `"PDF"` |  |
| backend.services.uploadServiceDocumentTypeIds.documentTypeId1 | string | `"SERVICE_LEADIMAGE"` |  |
| backend.services.uploadServiceDocumentTypeIds.mediaTypeIds1.mediaTypeId0 | string | `"JPEG"` |  |
| backend.services.uploadServiceDocumentTypeIds.mediaTypeIds1.mediaTypeId1 | string | `"PNG"` |  |
| backend.services.uploadServiceDocumentTypeIds.mediaTypeIds1.mediaTypeId2 | string | `"SVG"` |  |
| backend.services.uploadServiceDocumentTypeIds.documentTypeId2 | string | `"CONFORMITY_APPROVAL_SERVICES"` |  |
| backend.services.uploadServiceDocumentTypeIds.mediaTypeIds2.mediaTypeId0 | string | `"PDF"` |  |
| backend.services.submitServiceNotificationTypeIds.type0 | string | `"SERVICE_RELEASE_REQUEST"` |  |
| backend.services.approveServiceNotificationTypeIds.type0 | string | `"SERVICE_RELEASE_APPROVAL"` |  |
| backend.services.swaggerEnabled | bool | `false` |  |
| backend.services.serviceImageDocumentTypeIds.type0 | string | `"ADDITIONAL_DETAILS"` |  |
| backend.services.serviceImageDocumentTypeIds.type1 | string | `"CONFORMITY_APPROVAL_SERVICES"` |  |
| backend.services.serviceImageDocumentTypeIds.type2 | string | `"SERVICE_LEADIMAGE"` |  |
| backend.services.offerStatusIds.status0 | string | `"IN_REVIEW"` |  |
| backend.services.offerStatusIds.status1 | string | `"ACTIVE"` |  |
| backend.services.deleteDocumentTypeIds.type0 | string | `"SERVICE_LEADIMAGE"` |  |
| backend.services.deleteDocumentTypeIds.type1 | string | `"ADDITIONAL_DETAILS"` |  |
| backend.services.deleteDocumentTypeIds.type2 | string | `"CONFORMITY_APPROVAL_SERVICES"` |  |
| backend.services.technicalUserProfileClient | string | `"technical_roles_management"` |  |
| backend.services.companyAdminRoles.role0 | string | `"Company Admin"` |  |
| backend.provisioningmigrations.name | string | `"provisioning-migrations"` |  |
| backend.provisioningmigrations.image.name | string | `"docker.io/tractusx/portal-provisioning-migrations"` |  |
| backend.provisioningmigrations.image.provisioningmigrationstag | string | `"v1.8.0-RC5"` |  |
| backend.provisioningmigrations.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.provisioningmigrations.resources | object | `{"requests":{"cpu":"15m","memory":"105M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| backend.provisioningmigrations.logging.default | string | `"Information"` |  |
| backend.processesworker.name | string | `"processes-worker"` |  |
| backend.processesworker.image.name | string | `"docker.io/tractusx/portal-processes-worker"` |  |
| backend.processesworker.image.processesworkertag | string | `"v1.8.0-RC5"` |  |
| backend.processesworker.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.processesworker.resources | object | `{"requests":{"cpu":"15m","memory":"105M"}}` | We recommend not to specify default resource limits and to leave this as a conscious choice for the user. If you do want to specify resource limits, uncomment the following lines and adjust them as necessary. |
| backend.processesworker.logging.default | string | `"Information"` |  |
| backend.processesworker.logging.processesLibrary | string | `"Information"` |  |
| backend.processesworker.logging.bpdmLibrary | string | `"Information"` |  |
| backend.processesworker.logging.clearinghouseLibrary | string | `"Information"` |  |
| backend.processesworker.logging.custodianLibrary | string | `"Information"` |  |
| backend.processesworker.logging.sdfactoryLibrary | string | `"Information"` |  |
| backend.processesworker.logging.offerProvider | string | `"Information"` |  |
| backend.processesworker.applicationActivation.applicationApprovalInitialRoles.portal.role0 | string | `"Company Admin"` |  |
| backend.processesworker.applicationActivation.applicationApprovalInitialRoles.registration.role0 | string | `"Company Admin"` |  |
| backend.processesworker.applicationActivation.clientToRemoveRolesOnActivation.client0 | string | `"Cl1-CX-Registration"` |  |
| backend.processesworker.applicationActivation.welcomeNotificationTypeIds.type0 | string | `"WELCOME"` |  |
| backend.processesworker.applicationActivation.welcomeNotificationTypeIds.type1 | string | `"WELCOME_USE_CASES"` |  |
| backend.processesworker.applicationActivation.welcomeNotificationTypeIds.type2 | string | `"WELCOME_SERVICE_PROVIDER"` |  |
| backend.processesworker.applicationActivation.welcomeNotificationTypeIds.type3 | string | `"WELCOME_CONNECTOR_REGISTRATION"` |  |
| backend.processesworker.applicationActivation.welcomeNotificationTypeIds.type4 | string | `"WELCOME_APP_MARKETPLACE"` |  |
| backend.processesworker.applicationActivation.loginTheme | string | `"catenax-shared-portal"` |  |
| backend.processesworker.bpdm.scope | string | `"openid"` |  |
| backend.processesworker.bpdm.grantType | string | `"client_credentials"` |  |
| backend.processesworker.bpdm.clientId | string | `"bpdm-client-id"` | Provide bpdm client-id from CX IAM centralidp. |
| backend.processesworker.bpdm.clientSecret | string | `""` | Client-secret for bpdm client-id. Secret-key 'bpdm-client-secret'. |
| backend.processesworker.custodian.membershipErrorMessage | string | `"Credential of type MembershipCredential is already exists"` |  |
| backend.processesworker.custodian.scope | string | `"openid"` |  |
| backend.processesworker.custodian.grantType | string | `"client_credentials"` |  |
| backend.processesworker.custodian.clientId | string | `"custodian-client-id"` | Provide custodian client-id from CX IAM centralidp. |
| backend.processesworker.custodian.clientSecret | string | `""` | Client-secret for custodian client-id. Secret-key 'custodian-client-secret'. |
| backend.processesworker.sdfactory.selfdescriptionPath | string | `"/api/rel3/selfdescription"` |  |
| backend.processesworker.sdfactory.scope | string | `"openid"` |  |
| backend.processesworker.sdfactory.grantType | string | `"client_credentials"` |  |
| backend.processesworker.sdfactory.issuerBpn | string | `"BPNDUMMY000DUMMY"` | Provide BPN for sdfactory. |
| backend.processesworker.sdfactory.clientId | string | `"sdfactory-client-id"` | Provide sdfactory client-id from CX IAM centralidp. |
| backend.processesworker.sdfactory.clientSecret | string | `""` | Client-secret for sdfactory client-id. Secret-key 'sdfactory-client-secret'. |
| backend.processesworker.clearinghouse.scope | string | `"openid"` |  |
| backend.processesworker.clearinghouse.grantType | string | `"client_credentials"` |  |
| backend.processesworker.clearinghouse.clientId | string | `"clearinghouse-client-id"` | Provide clearinghouse client-id from clearinghouse IAM. |
| backend.processesworker.clearinghouse.clientSecret | string | `""` | Client-secret for clearinghouse client-id. Secret-key 'clearinghouse-client-secret'. |
| backend.processesworker.clearinghouse.callbackPath | string | `"/api/administration/registration/clearinghouse"` |  |
| backend.processesworker.processes.lockExpirySeconds | string | `"300"` |  |
| backend.processesworker.offerSubscriptionProcess.serviceAccountRoles.role0 | string | `"Digital Twin Management"` |  |
| backend.processesworker.offerSubscriptionProcess.serviceManagerRoles.role0 | string | `"App Manager"` |  |
| backend.processesworker.offerSubscriptionProcess.itAdminRoles.role0 | string | `"IT Admin"` |  |
| backend.processesworker.offerprovider.serviceManagerRoles.role0 | string | `"App Manager"` |  |
| backend.processesworker.offerprovider.scope | string | `"openid"` |  |
| backend.processesworker.offerprovider.grantType | string | `"client_credentials"` |  |
| backend.processesworker.offerprovider.clientId | string | `"offerprovider-client-id"` | Provide offerprovider client-id from CX IAM centralidp. |
| backend.processesworker.offerprovider.clientSecret | string | `""` | Client-secret for offer provider client-id. Secret-key 'offerprovider-client-secret'. |
| backend.processesworker.processIdentity.processUserId | string | `"d21d2e8a-fe35-483c-b2b8-4100ed7f0953"` |  |
| backend.processesworker.onboardingServiceProvider.encryptionKey | string | `""` | Client-secret for onboardingserviceprovider encryptionKey. Secret-key 'process-onboardingserviceprovider-encryption-key'. |
| backend.processesworker.networkRegistration.loginDocumentPath | string | `"/documentation/?path=docs%2F09.+Others%28s%29%2F01.+Login.md"` |  |
| backend.processesworker.networkRegistration.externalRegistrationPath | string | `"/?overlay=consent_osp"` |  |
| backend.processesworker.networkRegistration.closeApplicationPath | string | `"/decline"` | The logic to decline an application is not yet implemented in the backend - this will currently lead to a 404 page when clicking on the link in the mail |
| backend.clients.portal | string | `"Cl2-CX-Portal"` |  |
| backend.clients.registration | string | `"Cl1-CX-Registration"` |  |
| backend.clients.technicalRolesManagement | string | `"technical_roles_management"` |  |
| backend.placeholder | string | `"empty"` |  |
| postgresql.enabled | bool | `true` | PostgreSQL chart configuration Switch to enable or disable the PostgreSQL helm chart |
| postgresql.fullnameOverride | string | `"portal-backend-postgresql"` | FullnameOverride to 'portal-backend-postgresql'. |
| postgresql.auth.database | string | `"postgres"` | Database name |
| postgresql.auth.port | int | `5432` | Database port number |
| postgresql.auth.existingSecret | string | `"secret-postgres-init"` | Secret containing the passwords for root usernames postgres and non-root usernames repl_user, portal and provisioning. |
| postgresql.auth.password | string | `""` | Password for the root username 'postgres'. Secret-key 'postgres-password'. |
| postgresql.auth.replicationPassword | string | `""` | Password for the non-root username 'repl_user'. Secret-key 'replication-password'. |
| postgresql.auth.portalUser | string | `"portal"` | Non-root username for portal. |
| postgresql.auth.provisioningUser | string | `"provisioning"` | Non-root username for provisioning. |
| postgresql.auth.portalPassword | string | `""` | Password for the non-root username 'portal'. Secret-key 'portal-password'. |
| postgresql.auth.provisioningPassword | string | `""` | Password for the non-root username 'provisioning'. Secret-key 'provisioning-password'. |
| postgresql.architecture | string | `"replication"` |  |
| postgresql.audit.pgAuditLog | string | `"write, ddl"` |  |
| postgresql.audit.logLinePrefix | string | `"%m %u %d "` |  |
| postgresql.primary.extendedConfiguration | string | `""` | Extended PostgreSQL Primary configuration (increase of max_connections recommended - default is 100) |
| postgresql.primary.initdb.scriptsConfigMap | string | `"configmap-postgres-init"` |  |
| postgresql.primary.extraEnvVars[0].name | string | `"PORTAL_PASSWORD"` |  |
| postgresql.primary.extraEnvVars[0].valueFrom.secretKeyRef.name | string | `"{{ .Values.auth.existingSecret }}"` |  |
| postgresql.primary.extraEnvVars[0].valueFrom.secretKeyRef.key | string | `"portal-password"` |  |
| postgresql.primary.extraEnvVars[1].name | string | `"PROVISIONING_PASSWORD"` |  |
| postgresql.primary.extraEnvVars[1].valueFrom.secretKeyRef.name | string | `"{{ .Values.auth.existingSecret }}"` |  |
| postgresql.primary.extraEnvVars[1].valueFrom.secretKeyRef.key | string | `"provisioning-password"` |  |
| postgresql.readReplicas.extendedConfiguration | string | `""` | Extended PostgreSQL read only replicas configuration (increase of max_connections recommended - default is 100) |
| externalDatabase.host | string | `"portal-backend-postgresql-external-db"` | External PostgreSQL configuration IMPORTANT: init scripts (01-init-db-user.sh and 02-init-db.sql) available in templates/configmap-backend-postgres-init.yaml need to be executed beforehand. Database host |
| externalDatabase.database | string | `"postgres"` | Database name |
| externalDatabase.port | int | `5432` | Database port number |
| externalDatabase.secret | string | `"secret-postgres-external-db"` | Secret containing the passwords non-root usernames portal and provisioning. |
| externalDatabase.portalUser | string | `"portal"` | Non-root username for portal. |
| externalDatabase.provisioningUser | string | `"provisioning"` | Non-root username for provisioning. |
| externalDatabase.portalPassword | string | `""` | Password for the non-root username 'portal'. Secret-key 'portal-password'. |
| externalDatabase.provisioningPassword | string | `""` | Password for the non-root username 'provisioning'. Secret-key 'provisioning-password'. |
| portContainer | int | `8080` |  |
| portService | int | `8080` |  |
| replicaCount | int | `3` |  |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | Tolerations for pod assignment |
| affinity.podAntiAffinity | object | `{"preferredDuringSchedulingIgnoredDuringExecution":[{"podAffinityTerm":{"labelSelector":{"matchExpressions":[{"key":"app.kubernetes.io/name","operator":"DoesNotExist"}]},"topologyKey":"kubernetes.io/hostname"},"weight":100}]}` | Following Catena-X Helm Best Practices, [reference](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity). |
| updateStrategy.type | string | `"RollingUpdate"` | Update strategy type, rolling update configuration parameters, [reference](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#update-strategies). |
| updateStrategy.rollingUpdate.maxSurge | int | `1` |  |
| updateStrategy.rollingUpdate.maxUnavailable | int | `0` |  |
| startupProbe | object | `{"failureThreshold":30,"initialDelaySeconds":10,"periodSeconds":10,"successThreshold":1,"timeoutSeconds":1}` | Following Catena-X Helm Best Practices, [reference](https://github.com/helm/charts/blob/master/stable/nginx-ingress/values.yaml#L210). |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.initialDelaySeconds | int | `10` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.successThreshold | int | `1` |  |
| livenessProbe.timeoutSeconds | int | `10` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.initialDelaySeconds | int | `10` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.successThreshold | int | `1` |  |
| readinessProbe.timeoutSeconds | int | `1` |  |

Autogenerated with [helm docs](https://github.com/norwoodj/helm-docs)
