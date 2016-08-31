
<cfset memstats = application.servermonitorAPI.getJVMMemoryStats()>
<cfset jvmused = fix(memstats.usedmemory/1024/1024)>
<cfset jvmfree = fix(memstats.freememory/1024/1024)>
<cfset stats = application.servermonitorAPI.getMemoryUtilizationSummary()>
<cfset totalApp = numberFormat(stats.applicationscopessize/1024, "99.99")>
<cfset totalSession = numberFormat(stats.sessionscopessize/1024, "99.99")>
<cfset totalServer = numberFormat(stats.serverscopesize/1024, "99.99")>

<div id="sm_memoryusage">
	<cf_toolbar title="Memory Usage" />

	<div class="body">
		<cfoutput>
		<input type="hidden" id="chartjvmused" value="#jvmused#">
		<input type="hidden" id="chartjvmfree" value="#jvmfree#">
		</cfoutput>
		<div id="chartdiv" style="height:275px;width:100%;"></div>
		<a style="margin:0 10px;color:rgba(0,0,0,.9)" href="#" class="submit whiteButton" id="smRunGC">Run Garbage Collection</a>
	</div>


	<div class="body">
		<cfoutput>
		<table width="100%">
			<tr>
				<td><b>Application Scope Memory:</b></td>
				<td>#totalApp# KB</td>
			</tr>
			<tr>
				<td><b>Session Scope Memory:</b></td>
				<td>#totalSession# KB</td>
			</tr>
			<tr>
				<td><b>Server Scope Memory:</b></td>
				<td>#totalServer# KB</td>
			</tr>
		</table>
		</cfoutput>
	</div>	
</div>
