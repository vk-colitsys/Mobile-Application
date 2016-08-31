<cfparam name="url.enabled" default="true">

<cfset application.runtimeAPI.setCacheProperty("TrustedCache",url.enabled)>