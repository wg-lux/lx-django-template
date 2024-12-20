# 2024-12-19
## Requirements
- [ ] create user local-administration-service

## Set up end2end test
### Deploy Repo
- Use nix home manager of local-administration-service to automatically clone https://github.com/wg-lux/lx-django-template to the home directory

### Implement service
- implement a service using our nix configuration
- the pulled repo provides an environment using "devenv" for nix
- the service should run the defined processes using "devenv up"
