Add-Type -AssemblyName System.Web

 

$syncUrl = Read-Host -Prompt "Please paste the Odopen link here"

$uri = [System.Uri]$syncUrl

$query = [System.Web.HttpUtility]::ParseQueryString($uri.Query)

 

$siteId = $query["siteId"]

$webId  = $query["webId"]

$listId = $query["listId"]

Write-Host "SiteID = $siteID"
Write-Host "WebID = $WebID"
Write-Host "listid = $listid"








