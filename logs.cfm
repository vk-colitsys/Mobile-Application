<cfset logFiles = application.utils.getLogFiles() />

<div id="logs">
    <cf_toolbar title="Log Files" />
	<ul class="rounded">
		<cfoutput query="logFiles">
			<!--- don't get archived log files (ex: application.log.1) --->
			<cfif listLast(name, ".") eq "log">
				<li class="arrow"><a href="log.cfm?logFile=#urlEncodedFormat(directory & "/" & name)#">#name#</a></li> 
			</cfif>
		</cfoutput>
	</ul>

</div>