$random = "adthol" + $args[0]

$inoutfile = $env:HOMEPATH +"\Desktop\variables-" + $random + ".txt"
$content = Get-Content -Path $inoutfile 

$splitcontent = $content -split '= '
$rgname = $splitcontent[1]
$dtname = $splitcontent[3]
$telemetryfunctionname = $splitcontent[7]
$functionstorage = $splitcontent[11]
$adtinstancename = $splitcontent[13]
$location = "westeurope"

# Create function app
az storage account create --name $functionstorage --location $location --resource-group $rgname --sku Standard_LRS
az functionapp create --resource-group $rgname --consumption-plan-location $location --name $telemetryfunctionname --storage-account $functionstorage --functions-version 3

# Configure security access for the function app
$principalID = $(az functionapp identity assign -g $rgname -n $telemetryfunctionname  --query principalId)
az dt role-assignment create --dt-name $dtname --assignee $principalID --role "Azure Digital Twins Data Owner"
az functionapp config appsettings set -g $rgname -n $telemetryfunctionname --settings "ADT_SERVICE_URL=https://$adtinstancename"

"principalID = " + $principalID | Out-File -FilePath $inoutfile -Append
