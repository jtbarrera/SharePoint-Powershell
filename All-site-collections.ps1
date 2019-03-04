<# All site collections in a single web application: #>

Get-SPSite -WebApplication http://sharepoint -Limit All |
   Select -ExpandProperty AllWebs |
   Select -ExpandProperty Lists |
   Select ParentWebUrl, Title
