<!--- our rss feeds --->
<cfset updatesRSS = "http://feeds.feedburner.com/Coldfusion9Updates">
<cfset secRSS = "http://feeds.feedburner.com/Coldfusion9SecurityPatches">

<!--- did we fetch it already? --->
<cfset content = cacheGet("rsscontent")>
<cfif isNull(content)>
	<cfset content = application.paragator.aggregate([updatesRSS,secRSS])>
	<cfset cachePut("rsscontent", content, createTimeSpan(0,2,0,0))>
</cfif>

<div id="updates">

	<cf_toolbar title="Updated" />
	
	<cfif not content.recordCount>
	
		<div class="body">
		The RSS feeds returned no data.
		</div>
		
	<cfelse>
	
		<cfoutput query="content" maxrows="15">
		<div class="body">
		<a href="#link#" target="_blank">#title#</a><br/>
		#left(content, 500)#<cfif len(content) gt 500>...</cfif>
		</div>
		</cfoutput>
	

	</cfif>
	
</div>