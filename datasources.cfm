<cfset datasources = application.datasourceAPI.getDatasources()>
<cfset sortedList = "">
<cfif not structIsEmpty(datasources)>
	<cfset sortedList = listSort(structKeyList(datasources), "textnocase")>
</cfif>

<div id="datasources">
    <cf_toolbar title="Datasources" />
	<ul class="rounded">
		<cfloop index="dsn" list="#sortedList#">
			<cfoutput>
			<li class="arrow"><a href="dsn.cfm?dsn=#urlEncodedFormat(dsn)#">#dsn#</a></li>
			</cfoutput>
		</cfloop>
	</ul>
</div>