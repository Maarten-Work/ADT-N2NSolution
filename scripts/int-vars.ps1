$random = "adthol" + $(get-random -maximum 10000)
$rgname = "rg-adthol"+ $random
$dtname = $random + "-digitaltwin"
$location = "westeurope"
$username = Read-Host "Enter username. ex: jdoe@contoso.com"
$functionstorage = $random + "storage"
$telemetryfunctionname = $random + "-telemetryfunction"
$twinupdatefunctionname = $random + "-twinupdatefunction"

az group create -n $rgname -l $location

$rgname
$dtname
$location
$username
$telemetryfunctionname
$twinupdatefunctionname
$functionstorage

# Create an Azure Digital Twin instance. NOTE: You can skip this step if you already have an ADT instance
# In that case, make sure to assign the different variables accordingly 

az dt create --dt-name $dtname -g $rgname -l $location
az dt role-assignment create -n $dtname -g $rgname --role "Azure Digital Twins Data Owner" --assignee $username -o json


