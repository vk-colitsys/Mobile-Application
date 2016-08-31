
<cfset status = application.servermonitorAPI.getMonitorSettings()>

<cfset structDelete(status, "ismonitoringserverenabled")>
<cfset structDelete(status, "webserverurl")>

<cfif structKeyExists(url, "monitoring") and isBoolean(url.monitoring)>
	<cfset status.monitoringEnabled = url.monitoring>
</cfif>
<cfif structKeyExists(url, "profiling") and isBoolean(url.profiling)>
	<cfset status.profilingEnabled = url.profiling>
</cfif>
<cfif structKeyExists(url, "memory") and isBoolean(url.memory)>
	<cfset status.memoryMonitoringEnabled = url.memory>
</cfif>

<cfset application.servermonitorAPI.setMonitorSettings(status)>