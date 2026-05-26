Set objShell = CreateObject("WScript.Shell")

currentFolder = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)

objShell.Run """" & currentFolder & "\sp_connection.bat""", 0, False