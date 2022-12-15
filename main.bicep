param deployApp bool

// Deploy Azure App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2019-08-01' = {
  name: 'Yousif-asp'
  kind: 'app'
  sku: {
    tier: 'B1'
  }
}

// Conditionally deploy Web App
if (deployApp) {
  resource webApp 'Microsoft.Web/sites@2019-08-01' = {
    name: 'Yousif-app'
    siteConfig: {
      appSettings: [
        {
          name: 'MYSECRET'
          value: '<secret value>'
        }
      ]
    }
  }
}
