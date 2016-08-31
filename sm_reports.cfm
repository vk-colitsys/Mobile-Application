
<cfset stats = application.servermonitorAPI.getCurrentReportsSize()>
<cfset reqswitherrors = stats.requestcntwitherrors>
<cfset timedoutrequests = stats.timedoutrequestcnt>
<cfset reqs20seconds = stats.topslowrequestcnt>
<cfset reqs40KB = stats.topmemoryusedrequestcnt>
<cfset queries10 = stats.topslowquerycnt>
<cfset queries20 = stats.topmemoryusedquerycnt>
<cfset jvmused = stats.jvmusedmemory>
<cfset jvmmax = jvmused + stats.jvmfreememory>
<!--- convert to MB - this math is wrong --->
<cfset jvmused = fix(jvmused/1024/1024)>
<cfset jvmmax = fix(jvmmax/1024/1024)>
<cfset sessions4 = stats.topmemoryusedsessioncnt>

<cfset hitstats = application.servermonitorAPI.getHitCountStats()>

<div id="sm_reports">

    <cf_toolbar title="Reports" />

	<cfoutput>
	<div class="body">
	<table width="100%">
		<tr>
			<td><b>Requests with errors:</b></td>
			<td>#reqswitherrors#</td>
		</tr>
		<tr>
			<td><b>Requests that timed out:</b></td>
			<td>#timedoutrequests#</td>
		</tr>
		<tr>
			<td><b>Requests slower than 20 seconds:</b></td>
			<td>#reqs20seconds#</td>
		</tr>
		<tr>
			<td><b>Requests that use more than 40KB:</b></td>
			<td>#reqs40KB#</td>
		</tr>
		<tr>
			<td><b>Sessions that exceed 4KB:</b></td>
			<td>#sessions4#</td>
		</tr>
		<tr>
			<td><b>Queries slower than 10 seconds on average:</b></td>
			<td>#queries10#</td>
		</tr>
		<tr>
			<td><b>Queries that exceed 20 KB:</b></td>
			<td>#queries20#</td>
		</tr>
		<tr>
			<td><b>JVM Memory (used/max) MB:</b></td>
			<td>#jvmused# / #jvmmax#</td>
		</tr>
		
	</table>
	</div>
	
	<div class="body">
	<table width="100%">
		<tr>
			<td><b>Template hits:</b></td>
			<td>#hitstats.templatehitcount#</td>
		</tr>
		<tr>
			<td><b>Flash hits:</b></td>
			<td>#hitstats.flashhitcount#</td>
		</tr>
		<tr>
			<td><b>Gateway hits:</b></td>
			<td>#hitstats.gatewayhitcount#</td>
		</tr>
		<tr>
			<td><b>Remote CFC hits:</b></td>
			<td>#hitstats.rcfchitcount#</td>
		</tr>
		<tr>
			<td><b>Web Service hits:</b></td>
			<td>#hitstats.wshitcount#</td>
		</tr>
		<tr>
			<td><b>Total hits:</b></td>
			<td>#hitstats.totalhitcount#</td>
		</tr>

	</table>
	</div>	
	</cfoutput>
	
</div>
	