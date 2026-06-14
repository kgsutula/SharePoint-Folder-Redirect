$SharedFiles = "$env:USERPROFILE\<File path to the SharePoint Library goes here>"
$OneDrivePath = "$env:USERPROFILE\<File path to the OneDrive folder goes here>"

function Start-SPSiteSync {

    $siteId = <SiteID from Odopen link goes here. Must be within {}>
    $webId  = <webID from Odopen link goes here. Must be within {}>
    $listId = <ListID from Odopen link goes here Must be within {>

    $webUrl = <SharePoint site URL goes here in quotes>
    $webTitle = <SharePoint site name goes here in quotes>

    $accountsPath = "HKCU:\SOFTWARE\Microsoft\OneDrive\Accounts"

    $userEmail = Get-ChildItem $accountsPath -ErrorAction SilentlyContinue |
        Where-Object {$_.PSChildName -like "Business*"} |
        ForEach-Object {
            (Get-ItemProperty $_.PSPath).UserEmail
        } |
        Select-Object -First 1

    $syncLink = "odopen://sync/?siteId=$siteId&webId=$webId&listId=$listId&webUrl=$webUrl&userEmail=$userEmail&webTitle=$webTitle"

    Start-Process $syncLink -ErrorAction Ignore
    Start-Sleep -Seconds 5
    Start-Process $SharedFiles
}

if (Test-Path -Path $SharedFiles) {

    Start-Process $SharedFiles

}
elseif (Test-Path -Path $OneDrivePath) {

    Start-SPSiteSync

}
else {

    Add-Type -AssemblyName System.Windows.Forms

    
     msg $env:USERNAME "Please sign into OneDrive to access the Shared Files. After signing in, please run this program again"
        
    

    Start-Process "C:\Program Files\Microsoft OneDrive\OneDrive.exe"
}


