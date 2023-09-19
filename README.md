# Helm charts for Catena-X Portal

![Tag](https://img.shields.io/static/v1?label=&message=LeadingRepository&color=green&style=flat)

This repository contains the following helm charts:

##  Portal

This helm chart installs the Catena-X Portal application which consists of

* [portal-frontend](https://github.com/eclipse-tractusx/portal-frontend),
* [portal-frontend-registration](https://github.com/eclipse-tractusx/portal-frontend-registration),
* [portal-assets](https://github.com/eclipse-tractusx/portal-assets) and
* [portal-backend](https://github.com/eclipse-tractusx/portal-backend).

The Catena-X Portal is designed to work with the [Catena-X IAM](https://github.com/eclipse-tractusx/portal-iam).

For detailed information please refer to the chart specific **[README](./charts/portal/README.md)**.

##  LocalDev Portal & CX IAM

This umbrella chart installs the CX Portal and the CX IAM Keycloak instances.

It's intended for the local setup of the those components in order to aid the local development.

For detailed information please refer to the chart specific **[README](./charts/localdev/README.md)**.

## Notice for Docker images

The referenced container images in the helm charts are for demonstration purposes only.

## License

Distributed under the Apache 2.0 License.
See [LICENSE](./LICENSE) for more information.
