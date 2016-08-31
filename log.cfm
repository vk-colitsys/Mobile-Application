<cfparam name="url.logFile" default="" />
<cfset logFile = urlDecode(url.logFile) />
<cfset numRecords = 10 /><!--- may want to make this a user pref later?--->

<cfif len(logFile) and fileExists(logFile)>
	<cfset tailView = application.utils.getTailView(logFile,numRecords) />
	<div id="logView">
		<cf_toolbar title="Log Tail View" />
		
		<div class="body">
			<cfoutput>
				<div>
					<h3>#getFileFromPath(logFile)#</h3>
					<h4>(showing #arrayLen(tailView)# records)</h4>
				</div>
				<br /><br />
			</cfoutput>
			<cfloop array="#tailView#" index="i">
				<p>
					<code><cfoutput>#i#</cfoutput></code>
				</p>
			</cfloop>
		</div>
	</div>
</cfif>


