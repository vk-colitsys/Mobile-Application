component {
	this.name="cfadminmobilenew";
	this.sessionManagement="true";
	this.mappings = {};
	this.customtagpaths = getDirectoryFromPath(getCurrentTemplatePath()) & "/tags/";
	
	public boolean function onApplicationStart() {
		application.adminAPI = createObject("component", "CFIDE.adminapi.administrator");
		application.datasourceAPI = createObject("component", "CFIDE.adminapi.datasource");
		application.securityAPI = createObject("component", "CFIDE.adminapi.security");
		application.extensionAPI = createObject("component", "CFIDE.adminapi.extensions");
		application.servermonitorAPI = createObject("component", "CFIDE.adminapi.servermonitoring");
		application.eventgatewayAPI = createObject("component", "CFIDE.adminapi.eventgateway");
		application.debuggingAPI = createObject("component", "CFIDE.adminapi.debugging");
		application.runtimeAPI = createObject("component", "CFIDE.adminapi.runtime");
		application.paragator = createObject("component", "components.aggregator");
		
		application.undeliveredMail = createObject("component", "CFIDE.administrator.mail.undeliveredmail");
				
		application.utils = createObject("component", "components.utils");
		application.utils.setDsnService(application.datasourceAPI);
		application.utils.setDebugService(application.debuggingAPI);
		
		application.maildir = server.coldfusion.rootdir & "/Mail/Undelivr/";
		application.spooldir = server.coldfusion.rootdir & "/Mail/Spool/";
		
		return true;
	}
	
	public boolean function onRequestStart(string req) {
		include "setting.cfm";
		var loginerror = false;
		writelog(file='application', text='req=#arguments.req# is logged in = #isUserLoggedIn()# getauth=#getauthuser()#, roles=#getuserroles()#');
		writelog(file='application', text=serializejson(session.sessionid));

		if(structKeyExists(url, "init")) onApplicationStart();
		
		//If this CF Admin is not locked, we auto log on
		if(!application.securityAPI.getUseAdminPassword()) session.loggedin = true;
		
		if(structKeyExists(url, "logout")) structClear(session);
		if(structKeyExists(form, "username") && structKeyExists(form, "password") && len(trim(form.username)) && len(trim(form.password))) {
			writelog(file='application', text=serializejson(session.sessionid));
			var result = application.adminAPI.login(form.password, form.username);
			if(!result) loginerror = true;
			else {
				session.loggedin = true;
				//temp hack
				session.username = form.username;
				session.password = form.password;
			writelog(file='application', text=serializejson(session.sessionid));
			
			}
		}
		
		if(listLast(arguments.req, "/") != "login.cfm") {
			if(!structKeyExists(session, "loggedin")) {
				location(url='login.cfm?loginerror=#loginError#', addtoken=false);
			} else {
				//temp hack
				//var tempr = application.adminAPI.login(session.password, session.username);
				//writelog(file='application', text='result is #tempr#, getauthuser=#getauthuser()#, roles=#getuserroles()#');
			}
		}
		return true;
	}
	
	public void function onError(exception,eventname) {
		writelog(file='application', text='error #arguments.exception.message#/#arguments.exception.detail#');
		writedump(var=arguments,label='onError');
	}
	
	public void function onSessionStart() {
		
	}
	
	public void function onSessionEnd(sessionScope,appScope) {
	}
	
}
