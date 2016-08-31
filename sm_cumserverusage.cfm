<cfset cumServerUsage = application.servermonitorAPI.getTopCumulativeServerTimeSpent()>

<div id="sm_reports">
	<cf_toolbar title="Cumulative Server Usage" />

	<cfif not arrayLen(cumServerUsage)>
	
		<div class="body">
		Nothing to report.
		</div>
		
	<cfelse>

		<cfloop index="req" array="#cumServerUsage#">
	
			<cfoutput>
			<div class="body">
			<b>Template:</b><br/>
			#req.templatepath#
			<br/><br/>
			
			<b>% Server Time:</b> #req.percentageservertime#<br/>
			
			<b>Avg Response Time (seconds):</b> #req.avgtime/1000#<br/>
	
			<b>Hit Count:</b> #req.hitcount#
	
			</div>
			</cfoutput>
	
		</cfloop>

	</cfif>
	
</div>