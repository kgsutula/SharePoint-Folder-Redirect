This setup is designed to appear as a folder in a file share that will redirect users to a SharePoint library after a folder share has been migrated to SharePoint online.  What this program does is:

1. Checks to see if a user is signed into OneDrive and prompts the user to sign into OneDrive if they are not.
2. If the user is signed into OneDrive, but doesn't have the SharePoint site synced, it will sync the SharePoint site and then open it
3. If the user is signed into OneDrive and has the SharePoint site synced then it will open the library


This contains a PowerShell script that syncs the specified SharePoint site, a batch file to bypass execution policy and a vbs script that can run the batch file silently for an end user.


The PowerShell script must be setup properly for this to run. Here are the instructions for that

Fill in file path to the SharePoint site in the $SharedFiles variable.  You may have to sync it manually to get the path.

Fill in file path for the company OneDrive folder in the $OneDrivePath variable. You may have to sync it manually to get the path. 

For the variables, $siteId, $webId and $listId, you will need to get the odopen link.  Please follow the instructions in the document, "How to get the Odopen link," to get these values

Fill in the SharePoint site URL for the $WebUrl variable. Example, https://yourtenant.sharepoint.com/sites/FileShares
Fill in the SharePoint site name for the $webTitle variable.  This is the site name in SharePoint Admin Center



This whole setup is designed to look like a ShortCut for an end user.  Here are the steps you can do to set that up:

1.  Un-Share you current shared folder that your SharePoint site is replacing. Share a new folder with the same share name as the old shared folder
2. In the new shared folder, create a folder called, "scripts," and copy all the files there
3. Create a shortcut to the vbs script
4. Move the shortcut just one directory up from the scripts folder
5. Right click the scripts folder, select properties and then select, "Hidden," in the general tab. This will hide the folder from the users
6. Right click on the created shortcut and select, "Change Icon," and select an icon that appears as a folder, this way it will look like a folder to the user.







