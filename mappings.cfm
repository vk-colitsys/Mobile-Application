<cfset mappings = application.extensionAPI.getMappings()>

<cfset sortedList = listSort(structKeyList(mappings), "textnocase")>

<div id="datasources">
   <cf_toolbar title="Mappings" />
	<ul class="rounded">
		<cfloop index="mapping" list="#sortedList#">
			<cfoutput>
			<li>#mapping# (#mappings[mapping]#)</li>
			</cfoutput>
		</cfloop>
	</ul>
</div>