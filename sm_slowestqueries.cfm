<cfset slowQueries = application.servermonitorAPI.getTopSlowQueries()>

<div id="sm_reports">
	<cf_toolbar title="Slowest Queries" />
	
	<cfif not arrayLen(slowQueries)>
	
		<div class="body">
		Nothing to report.
		</div>
		
	<cfelse>
	
		<cfloop index="q" array="#slowQueries#">
	
			<cfoutput>
			<div class="body">
			<b>Name:</b> #q.queryname#,br/>
			<b>Template:</b><br/>#q.templatepath#<br/>
			<br/><br/>
			<b>Time Taken (seconds):</b> #q.timetaken/1000#<br/>
			<b>Average Time Taken (seconds):</b> #q.avgtaken/1000#<br/>
			<b>Max Time Taken (seconds):</b> #q.maxtime/1000#<br/>
			<b>Min Time Taken (seconds):</b> #q.mintime/1000#<br/>
			<br/><br/>
			#q.sql#
			</div>
			</cfoutput>
	
		</cfloop>

	</cfif>
	
</div>