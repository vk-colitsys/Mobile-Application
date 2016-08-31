<cfsetting enablecfoutputonly="true">
<cfparam name="url.dsn">

<cfset result = application.datasourceAPI.verifyDsn(url.dsn,false)>
<cfif result><cfoutput>true</cfoutput><cfelse><cfoutput>false</cfoutput></cfif>