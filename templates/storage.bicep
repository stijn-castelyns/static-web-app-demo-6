@allowed(['swedencentral', 'belgiumcentral'])
param location string

param containerNames array = [
  'cat-pictures'
  'other-pictures'
]

resource storageAccount 'Microsoft.Storage/storageAccounts@2026-04-01' = {
  name: 'uawebbicepstor'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'

  resource blobservices 'blobServices@2026-04-01' = {
    name: 'default'

    resource container 'containers@2026-04-01' = [ for name in containerNames: {
      name: name
    }]
  }
}


