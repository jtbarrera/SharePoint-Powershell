<# All site collections in the farm: #>

Get-SPSite -Limit All |
   Select -ExpandProperty AllWebs |
   Select -ExpandProperty Lists |
   Select {$_.ParentWeb.Url}, Title
