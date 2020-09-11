# cnab-bicep

This repo contains code needed to build a [Cloud Native Application Bundle](https://cnab.io/) that deploys to Azure from [Bicep](https://github.com/Azure/bicep) code via [Porter](https://porter.sh/)

## How it works

* Installs Bicep tools into the invocation image
* Uses exec to transpile Bicep -> ARM template
* Uses the arm mixin to deploy the ARM template

## Usage

Prereqs
* Porter
* Docker

```shell
# Getting things ready
export AZURE_TENANT_ID=00000000-0000-0000-0000-000000000000
export AZURE_CLIENT_ID=00000000-0000-0000-0000-000000000000
export AZURE_CLIENT_SECRET=00000000-0000-0000-0000-000000000000
export AZURE_SUBSCRIPTION_ID=00000000-0000-0000-0000-000000000000
porter credentials generate azure
porter build

# Install it!
az group create -n cnab-bicep -l westus2
porter install -c azure
```

After installing, you'll have a VM in your `cnab-bicep` resource group

### Cleanup

I didn't implement uninstall, so you'll want to delete the Resource Group when you're done

```shell
az group delete -n cnab-bicep -y --no-wait
```
