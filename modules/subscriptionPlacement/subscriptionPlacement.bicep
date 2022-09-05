targetScope = 'managementGroup'

@description('Array of Subscription Ids that should be moved to the new management group.')
param parSubscriptionIds array = []

@description('Target management group for the subscription.  This management group must exist.')
param parTargetManagementGroupId string

resource resSubscriptionPlacement 'Microsoft.Management/managementGroups/subscriptions@2021-04-01' = [for subscriptionId in parSubscriptionIds: {
  scope: tenant()
  name: '${parTargetManagementGroupId}/${subscriptionId}'
}]

