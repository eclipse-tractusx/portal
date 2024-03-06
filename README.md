![LeadingRepository](https://img.shields.io/badge/Leading_Repository-blue)

# Portal: Helm charts

This repository contains the following helm charts:

##  Portal

This helm chart installs the Portal application which consists of

* [portal-frontend](https://github.com/eclipse-tractusx/portal-frontend),
* [portal-frontend-registration](https://github.com/eclipse-tractusx/portal-frontend-registration),
* [portal-assets](https://github.com/eclipse-tractusx/portal-assets) and
* [portal-backend](https://github.com/eclipse-tractusx/portal-backend).

The Portal is designed to work with the [IAM](https://github.com/eclipse-tractusx/portal-iam).

For **installation** details and further information, please refer to the chart specific [README](./charts/portal/README.md).

Please refer to the `docs` directory of the [portal-assets](https://github.com/eclipse-tractusx/portal-assets) repository for the overarching user and developer documentation of the Portal application.

##  LocalDev Portal & IAM

This umbrella chart installs the Portal and the IAM Keycloak instances.

It's intended for the local setup of the those components in order to aid the local development.

For detailed information please refer to the chart specific [README](./charts/localdev/README.md).

## Notice for Docker images

The referenced container images in the helm charts are for demonstration purposes only.

## License

Distributed under the Apache 2.0 License.
See [LICENSE](./LICENSE) for more information.
