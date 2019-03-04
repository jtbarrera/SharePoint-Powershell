<# You can expand these examples to inventory a full site collection, a web application, or an entire farm by
   piping from the higher-level objects and including details in your final Select about the higher levels.

All lists in the site collection: #>

Get-SPSite http://sharepoint/sites/<SITE> -Limit All |
   Select -ExpandProperty AllWebs |
   Select -ExpandProperty Lists |
   Select ParentWebUrl, Title
