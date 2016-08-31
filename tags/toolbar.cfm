<cfif thisTag.executionMode eq "start">
	<cfparam name="attributes.title" default="" />
	<div class="toolbar">
		<cfoutput>
        	<h1>#attributes.title#</h1>
		</cfoutput>
        <a class="button cancel" href="#">Return</a>
    </div>
<cfelse>
	<cfexit />
</cfif>