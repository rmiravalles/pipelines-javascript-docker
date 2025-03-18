#!/bin/bash

# Script to create the resources for the AKS and Azure DevOps tutorial

# Variables
resourceGroup="aks-azuredevops-rg"
location="westeurope"
acr="aksazuredevopsacr"
aks="aks-azuredevops"

# Create a resource group
az group create --name $resourceGroup --location $location

# Create an Azure Container Registry
az acr create --resource-group $resourceGroup --name $acr --sku Basic

# Create an AKS cluster
az aks create --resource-group $resourceGroup \
    --name $aks \
    --node-count 1 \
    --enable-addons monitoring \
    --generate-ssh-keys