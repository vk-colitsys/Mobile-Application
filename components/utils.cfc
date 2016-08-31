component accessors=true {

	property name="dsnService";
	property name="debugService";
	
	public struct function getDataSourceInfo(string dsnName) {
		var r = {database='',host='',port='',databasefile='',username='', type=''};
		var dsn = variables.dsnService.getDatasources(arguments.dsnName);

		for(var i in r) {
			if(structKeyExists(dsn,i))	r[i] = dsn[i];
		}
		
		//code to handle type, will be updated
		switch(dsn.driver) {
			case "mysql5": { r.type = "MySQL"; break; }
			case "mssqlserver": { r.type = "SQL Server"; break; }	
			default: { r.type = dsn.driver; }
		}
		
		return r;
	}
	
	public query function getLogFiles(){
		var logDir = variables.debugService.getLogProperty("logdirectory");
		return directoryList(logDir, false, "query");
	}
	
	public array function getTailView(filename) {
		var line = "";
		var lines = "";
		var theFile = createObject("java","java.io.File").init(filename);
		var raFile = createObject("java","java.io.RandomAccessFile").init(theFile,"r");
		var pos = theFile.length();
		var c = "";
		var total = 10;
		
		if(arrayLen(arguments) gte 2) total = arguments[2];
		raFile.seek(pos-1);
	
		while( (listLen(line,chr(10)) <= total) && pos > -1) {
			c = raFile.read();
			//if(c != -1) writeOutput("#c#=" & chr(c) & "<br/>");
			if(c != -1) line &= chr(c);
			raFile.seek(pos--);	
		}
	
		line = reverse(line);
		lines = listToArray(line, chr(10));
		arrayDeleteAt(lines,1);
		return lines;
	}
	
	//So given a path like /Library/WebServer/Documents/foo.cfm, 
	//convert to path 1/.../lastdir/last file
	//if we have 3 or more dirs
	public string function shrinkPath(string path) {
		var dirCount = listLen(arguments.path, "/\");
		//use 4 since our path begins with a slash
		if(dirCount >= 4) {
			return "/" & listFirst(arguments.path,"/\") & "/../" & listGetAt(arguments.path, listLen(arguments.path,"/\")-1,"/\") & "/" & listLast(arguments.path,"/\");
		} else return arguments.path;
	}
}