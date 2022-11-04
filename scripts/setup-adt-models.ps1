$random = "adthol" + $args[0]

$inoutfile = $env:HOMEPATH +"\Desktop\variables-" + $random + ".txt"
$content = Get-Content -Path $inoutfile 

$splitcontent = $content -split '= '
$dtname = $splitcontent[3]
$modelfolder = "..\models"

# upload the different models
$factorymodelid = $(az dt model create -n $dtname --models $modelfolder\FactoryInterface.json --query [].id -o tsv)
$floormodelid = $(az dt model create -n $dtname --models $modelfolder\FactoryFloorInterface.json --query [].id -o tsv)
$prodlinemodelid = $(az dt model create -n $dtname --models $modelfolder\ProductionLineInterface.json --query [].id -o tsv)
$prodstepmodelid = $(az dt model create -n $dtname --models $modelfolder\ProductionStepInterface.json --query [].id -o tsv)
$grindingstepmodelid = $(az dt model create -n $dtname --models $modelfolder\ProductionStepGrinding.json --query [].id -o tsv)
$roastingstepmodelid = $(az dt model create -n $dtname --models $modelfolder\ProductionStepFanning.json --query [].id -o tsv)
$moldingstepmodelid = $(az dt model create -n $dtname --models $modelfolder\ProductionStepMoulding.json --query [].id -o tsv)

# Create the different Twin Instances
az dt twin create -n $dtname --dtmi $factorymodelid --twin-id "ChocolateFactory"
az dt twin create -n $dtname --dtmi $floormodelid --twin-id "FactoryFloor"
az dt twin create -n $dtname --dtmi $prodlinemodelid --twin-id "ProductionLine"
az dt twin create -n $dtname --dtmi $grindingstepmodelid --twin-id "GrindingStep"
az dt twin create -n $dtname --dtmi $roastingstepmodelid --twin-id "RoastingStep"
az dt twin create -n $dtname --dtmi $moldingstepmodelid --twin-id "MoldingStep"

# Instantiate the relationships between the different Twin Instances
$relname = "rel_has_floors"
az dt twin relationship create -n $dtname --relationship $relname --twin-id "ChocolateFactory" --target "FactoryFloor" --relationship-id "Factory has floors"
$relname = "rel_runs_lines"
az dt twin relationship create -n $dtname --relationship $relname --twin-id "FactoryFloor" --target "ProductionLine" --relationship-id "Floor run production lines"
$relname = "rel_runs_steps"
az dt twin relationship create -n $dtname --relationship $relname --twin-id "ProductionLine" --target "GrindingStep" --relationship-id "Floor run production lines"
az dt twin relationship create -n $dtname --relationship $relname --twin-id "ProductionLine" --target "RoastingStep" --relationship-id "Floor run production lines"
az dt twin relationship create -n $dtname --relationship $relname --twin-id "ProductionLine" --target "MoldingStep" --relationship-id "Floor run production lines"

"factorymodelid = " + $factorymodelid | Out-File -FilePath $inoutfile -Append
"floorymodelid = " + $floormodelid | Out-File -FilePath $inoutfile -Append
"prodlinemodelid = " + $prodlinemodelid | Out-File -FilePath $inoutfile -Append
"prodstepmodelid = " + $prodstepmodelid | Out-File -FilePath $inoutfile -Append
"grindingstepmodelid = " + $grindingstepmodelid | Out-File -FilePath $inoutfile -Append
"roastingstepmodelid = " + $roastingstepmodelid | Out-File -FilePath $inoutfile -Append
"moldingstepmodelid = " + $moldingstepmodelid | Out-File -FilePath $inoutfile -Append

