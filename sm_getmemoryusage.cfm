<cfset memstats = application.servermonitorAPI.getJVMMemoryStats()>
<cfset jvmused = fix(memstats.usedmemory/1024/1024)>
<cfset jvmfree = fix(memstats.freememory/1024/1024)>

<cfset data = {jvmused=jvmused, jvmfree=jvmfree}>
<cfcontent type="application/json" reset="true"><cfoutput>#serializeJSON(data)#</cfoutput>