$random = "adthol" + $(get-random -maximum 10000)
$rgname = "rg-"+ $random
$dtname = $random + "-digitaltwin"
$location = "westeurope"
$username = Read-Host "Enter username. ex: jdoe@contoso.com"
$functionstorage = $random + "storage"
$telemetryfunctionname = $random + "-telemetryfunction"
$twinupdatefunctionname = $random + "-twinupdatefunction"
$outfile = $env:HOMEPATH +"\Desktop\variables-" + $random + ".txt"

az group create -n $rgname -l $location

# Store generated variables in a txt file for later reference
"rgname = " + $rgname | Out-File -FilePath $outfile
"dtname = " + $dtname | Out-File -FilePath $outfile -Append
"username = " + $username | Out-File -FilePath $outfile -Append
"telemetryfunctionname = " + $telemetryfunctionname | Out-File -FilePath $outfile -Append
"twinupdatefunctionname = " + $twinupdatefunctionname | Out-File -FilePath $outfile -Append
"functionstorage = " + $functionstorage | Out-File -FilePath $outfile -Append

# Create an Azure Digital Twin instance. NOTE: You can skip this step if you already have an ADT instance
# In that case, make sure to assign the different variables accordingly 

az dt create --dt-name $dtname -g $rgname -l $location
az dt role-assignment create -n $dtname -g $rgname --role "Azure Digital Twins Data Owner" --assignee $username -o json

# Collect and store the ADT instance

# $adtinstancename = az dt show -n $dtname --query 'hostName'
"adtinstancename = " + $(az dt show -n $dtname --query 'hostName') | Out-File -FilePath $outfile -Append

# Collect and store Azure AD tenant ID

# $adttennantid = az account show --query 'tenantId'
"adttennantid = " + $(az account show --query 'tenantId') | Out-File -FilePath $outfile -Append
