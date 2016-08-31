<cfset slowRequests = application.servermonitorAPI.getTopSlowRequests()>

<div id="sm_reports">
	<cf_toolbar title="Slowest Requests" />
	
	<cfif not arrayLen(slowRequests)>
	
		<div class="body">
		Nothing to report.
		</div>
		
	<cfelse>
	
		<cfloop index="req" array="#slowRequests#">
	
			<cfoutput>
			<div class="body">
			<b>Template:</b><br/>
			#req.templatepath#
			<br/><br/>
			<b>Response Time (seconds):</b>
			#req.responsetime/1000#
			</div>
			</cfoutput>
	
		</cfloop>

	</cfif>
	
</div>