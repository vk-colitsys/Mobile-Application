<cfset cts = application.extensionAPI.getCustomTagPaths()>


<div id="datasources">
	<cf_toolbar title="Custom Tag Paths" />
	<ul class="rounded">
		<cfloop index="ctp" array="#cts#">
			<cfoutput>
			<li>#ctp#</li>
			</cfoutput>
		</cfloop>
	</ul>
</div>