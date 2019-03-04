# SharePoint-Powershell
Various Powershell scripts created and/or found. 

## Permissions
A reminder before we get started: Just because you can use PowerShell does not mean that you can ignore SharePoint security. See "Inventorying SharePoint Using PowerShell" for the basic security requirements. You will need to have at least read permissions to the content you want to explore. You can add the account you're using with PowerShell as a site collection administrator to every site collection or use SharePoint Central Administration user policies to give your account full read permissions in each application (select Central Administration, Application Management, then select an application, then click User Policy).

## A Warning
The scripts I will show you can put quite a load on the server while they're running and can impact your users. You might want to run these scripts only outside of business hours. Before starting with these scripts

General Pattern for the Sample Scripts
All the sample scripts in this article are "one-liners." Although they are formatted into multiple lines to fit the article layout, you can enter them on one line. You can also enter the scripts on multiple lines if you break them after the pipe ( | ) or add a back tick ( ` ) at the end of each line. For writing and test scripts, I highly recommend using the Windows PowerShell Integrated Scripting Environment (ISE) over the command prompt.

### The scripts in this article follow this pattern:
- Select a web, a site collection of webs, or the entire farm of webs:  
  - Get-SPWeb http://sharepoint/sites/training  
  - Get-SPSite http://sharepoint/sites/training -Limit All | Select -ExpandProperty AllWebs  
  - Get-SPSite http://sharepoint/sites/training -Limit All | Select -ExpandProperty AllWebs OR  
  - Get-SPSite http://sharepoint/sites/training -Limit All | Get-SPWeb -Limit All  
  - Get-SPSite -Limit All | Select -ExpandProperty AllWebs OR  
  - Get-SPSite -Limit All | Get-SPWeb -Limit All  
- Expand the Lists property and pass each list one at a time though the pipe:  
  - Select -ExpandProperty Lists  
- Filter the lists:  
  - Where { $_.GetType().Name -eq "SPDocumentLibrary" }  
- Expand the list's Items collection and pass each item one at a time though the pipe:  
  - Select -ExpandProperty Items  
- Filter the items:  
  - Where { $_.Name -like "*airplane*" }  
- Select and format the results:  
  - Select Name, @{Name = "URL";Expression = {$_.ParentList.ParentWeb.Url + "/" + $_.Url}  
- And in some cases, summarize the results:  
  - Group ParentWebUrl | Select Name, Count  
- And for brevity, common aliases have been used -- for example, Select = Select-Object, Where = Where-Object, Group = Group-Object.  
