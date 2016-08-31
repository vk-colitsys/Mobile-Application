<cfset gateways = application.eventgatewayAPI.getGatewayInstances() />

<div id="gateways">
    <cf_toolbar title="Event Gateways" />
	<ul class="rounded">
		<cfloop array="#gateways#" index="i">
			<cfoutput>
				<cfset status = application.eventgatewayAPI.getGatewayInstanceStatus(i.gatewayID) />
				<li class="">#i.gatewayID# | #!status ? '<em>Not</em>' : ''# Running</li>
			</cfoutput>
		</cfloop>
	</ul>
</div>