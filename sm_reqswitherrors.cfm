<cfset errRequests = application.servermonitorAPI.getRequestWithErrors()>

<div id="sm_reqswitherrors">
	<cf_toolbar title="Requests with Errors" />
	
	<cfif not arrayLen(errRequests)>
	
		<div class="body">
		Nothing to report.
		</div>
		
	<cfelse>
	
		<cfloop index="req" array="#errRequests#">
			
			<cfset errHistory = application.servermonitorAPI.getErrorHistory(req.templatepath)>
				
			<cfoutput>
			<div class="body">
			<b>Template:</b><br/>
			#req.templatepath#
			<br/><br/>
			<b>Error Count:</b> #req.errorcount#<br/>
			<b>Last Error:</b> #dateFormat(req.lasterrorat)# #timeFormat(req.lasterrorat)#<br/>
			<b>Errors:</b><br/>
			<cfloop index="e" array="#errHistory#">
			<p>
			#e.error#
			</p>
			</cfloop>
			</div>
			</cfoutput>
	
		</cfloop>

	</cfif>
	
</div>