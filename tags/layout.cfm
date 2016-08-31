<cfparam name="attributes.title" default="">

<cfswitch expression="#thisTag.executionMode#">

	<cfcase value="start">
<html>
<head>
<link rel="shortcut icon" href="../favicon.ico">
<!---
<meta name="viewport" content="user-scalable=no, width=device-width" />
<cfoutput><title>#attributes.title#</title></cfoutput>
<link rel="stylesheet" href="css/style.css" type="text/css" />
--->
<script src="js/jquery.js"></script>
<script src="js/cfam.js"></script>
<script src="js/jqtouch.min.js" type="application/x-javascript" charset="utf-8"></script>
<script src="js/jquery.jqplot.min.js"></script>
<script src="js/jqplot.pieRenderer.min.js"></script>
<style type="text/css" media="screen">@import "css/jqtouch.min.css";</style>
<style type="text/css" media="screen">@import "themes/jqt/theme.min.css";</style>
<style type="text/css" media="screen">@import "css/style.css";</style>
<style type="text/css" media="screen">@import "css/jquery.jqplot.css";</style>

<script>

$.jQTouch({
    icon: 'jqtouch.png',
    statusBar: 'black-translucent',
    preloadImages: [
        'themes/jqt/img/chevron.png',
        'themes/jqt/img/back_button_clicked.png',
        'themes/jqt/img/button_clicked.png'
        ],
	cacheGetRequests:false
});
	
</script>
</head>

<body>
	</cfcase>
	
	<cfcase value="end">
</body>
</html>
	</cfcase>
	
</cfswitch>