
<cfset stats = application.servermonitorAPI.getTopHitCounts()>

<div id="sm_highesthitcounts">
	<cf_toolbar title="Highest Hit Counts" />

	<cfif not arrayLen(stats)>
	
		<div class="body">
		Nothing to report.
		</div>
		
	<cfelse>

		<cfloop index="req" array="#stats#">
	
			<cfoutput>
			<div class="body">
			<b>Template:</b><br/>
			#req.templatepath#
			<br/><br/>
			
			<b>Hit Count:</b> #req.hitcount#<br/>			
			<b>Avg Execution Time (seconds):</b> #req.avgtime/1000#<br/>
			<b>Avg Request Size (KB):</b> #req.avgrequestsize/1024#<br/>
	
			</div>
			</cfoutput>
	
		</cfloop>

	</cfif>
	
</div>