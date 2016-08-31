<cfparam name="url.dsn" default="">
<cfif not len(trim(url.dsn))>
	<cflocation url="datasources.cfm">
</cfif>

<cfset dsninfo = application.utils.getDataSourceInfo(url.dsn)>

<div id="dsn">

	<cfoutput>
    <cf_toolbar title="#url.dsn#" />

	<div class="body">
		<b>Type:</b> #dsninfo.type#<br/>
		<cfif len(dsninfo.host)>
			<b>Host:</b> #dsninfo.host#<br/>
		</cfif>
		<cfif len(dsninfo.port)>
			<b>Port:</b> #dsninfo.port#<br/>
		</cfif>
		<cfif len(dsninfo.database)>
			<b>Database:</b> #dsninfo.database#<br/>
		</cfif>
		<cfif len(dsninfo.databasefile)>
			<b>File:</b> #dsninfo.databasefile#<br/>
		</cfif>
	</div>

	<form>
	<ul>
	<li>
	<input type="hidden" name="dsn" value="#url.dsn#" class="dsn">
	<input id="verifyBtn" type="button" class="submit" value="Verify"> <span class="verifyStatus"></span>
	</li>
	</ul>
	</form>
	</cfoutput>

</div>