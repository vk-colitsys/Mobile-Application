<!--- get the 3 toggles --->
<cfset status = application.servermonitorAPI.getMonitorSettings()>

<div id="servermonitor">
    <cf_toolbar title="Server Monitor" />
	<ul class="rounded">
		<li>Monitoring <span class="toggle"><input type="checkbox" id="monitoringEnabled" <cfif status.monitoringEnabled>checked</cfif> /></span></li>
		<li>Profiling <span class="toggle"><input type="checkbox" id="profilingEnabled" <cfif status.profilingEnabled>checked</cfif>/></span></li>
		<li>Memory <span class="toggle"><input type="checkbox" id="memoryEnabled" <cfif status.memoryMonitoringEnabled>checked</cfif>/></span></li>
		<li><a style="margin:0 10px;color:rgba(0,0,0,.9)" href="#" class="submit whiteButton" id="smSettings">Save</a></li>
	</ul>
	<ul class="rounded">
		<li class="arrow"><a href="sm_reports.cfm">Reports</a></li>
		<li class="arrow"><a href="sm_slowestrequests.cfm">Slowest Requests</a></li>
		<li class="arrow"><a href="sm_cumserverusage.cfm">Cumulative Server Usage</a></li>
		<li class="arrow"><a href="sm_highesthitcounts.cfm">Highest Hit Counts</a></li>
		<li class="arrow"><a href="sm_memoryusage.cfm">Memory Usage</a></li>
		<li class="arrow"><a href="sm_slowestqueries.cfm">Slowest Queries</a></li>
		<li class="arrow"><a href="sm_reqswitherrors.cfm">Requests with Errors</a></li>

	</ul>

</div>