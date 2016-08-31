<cfset trustedCacheEnabled = application.runtimeAPI.getCacheProperty("TrustedCache")>

<div id="trustedcache">
    <cf_toolbar title="Trusted Cache" />
	<ul class="rounded">
		<li>Enabled? <span class="toggle"><input type="checkbox" id="trustedCacheEnabled" <cfif trustedCacheEnabled>checked</cfif> /></span></li>
		<li><a style="margin:0 10px;color:rgba(0,0,0,.9)" href="#" class="submit whiteButton" id="tcSettings">Save</a></li>
	</ul>

	<ul class="rounded" <cfif not trustedCacheEnabled>style="display:none"</cfif> id="tcClearDiv">
		<li><a style="margin:0 10px;color:rgba(0,0,0,.9)" href="#" class="submit whiteButton" id="tcClear">Clear Trusted Cache</a></li>
	</ul>
	
</div>