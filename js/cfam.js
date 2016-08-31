var getJVMInterval;
var jvmchart;

function getMemoryUsage() {
	$.getJSON("sm_getmemoryusage.cfm", {}, function(d) {
		var jvmfree = parseInt(d.JVMFREE);
		var jvmused = parseInt(d.JVMUSED);
		var data = [
			['Free Memory: '+jvmfree+' MB',parseInt(jvmfree)],
			['Used Memory: '+jvmused+' MB',parseInt(jvmused)] 
		];
		jvmchart.series[0].data = data;
		jvmchart.replot({resetAxis:true});
	});
}

$(document).ready(function() {	
	
	//Verify DSN
	$("#verifyBtn").live("click", function(e) {
		$(".verifyStatus").html("<i>Verifying DSN...</i>");
		$(this).attr("disabled", true);
		var dsn = $(this).siblings(".dsn").val();
		$.get("verifydsn.cfm", {"dsn":dsn}, function(res) {
			res = $.trim(res);
			if(res == "true") $(".verifyStatus").html("Verified!");
			else $(".verifyStatus").html("Verified Failed");
		});
		$(this).removeAttr("disabled");
	});

	//Saves server monitor settings	
	$("#smSettings").live("click", function(e) {
		var link = $(this);
		link.text("Updating...");
		var monitoringValue = $("#monitoringEnabled").attr("checked");
		var profilingValue = $("#profilingEnabled").attr("checked");
		var memoryValue = $("#memoryEnabled").attr("checked");

		$.get("sm_updatesettings.cfm", {"monitoring":monitoringValue, "profiling":profilingValue, "memory":memoryValue}, function() {
			link.text("Saved");
		});
		e.preventDefault();
	});

	//Saves trusted cache settings	
	$("#tcSettings").live("click", function(e) {
		var link = $(this);
		link.text("Updating...");
		var tcValue = $("#trustedCacheEnabled").attr("checked");
		$.get("tc_updatesettings.cfm", {"enabled":tcValue}, function() {
			link.text("Saved");
			if(tcValue) $("#tcClearDiv").show()
			else $("#tcClearDiv").hide();
		});
		e.preventDefault();
	});
	
	$('.cancel').live('click', function(e){
		//clean up the DOM when they go home
		$('mail-msg').remove();
		$('#mailCount').remove();
	});
	
	$('.respool').live('click', function(e){
		var msg = $(this).attr('msg');
		var id = $(this).attr('id');
		
		$.ajax({
			url: 'movemail.cfm?returnFormat=json&_cf_nocache=true&_cf_nodebug=true',
			data: {mail:msg,action:'Respool'},
			type: 'POST',
			success: function(data) {
				$('#'+id).parents('.mail-msg').fadeOut('fast', function(){$(this).parents('.mail-msg').remove();})
				var msgs = parseInt($.trim($('#mailCount').html()));
				$('#mailCount').html(msgs-1);
				if(msgs == 1){
					$('.cancel').trigger('click'); //last msg, send them home
				}
		  	}
		});
		
	});
	
	//runs when SM Memory Usage loads, handles the chart
    $('#sm_memoryusage').live('pageAnimationEnd', function(event, info){
		if (info.direction == 'in') {
			var jvmfree = $("#chartjvmfree").val();
			var jvmused = $("#chartjvmused").val();
			
			var options = {
				seriesDefaults: {renderer:$.jqplot.PieRenderer},
				legend:{show:true,location:'s',textColor:'black'}
			}
			var data = [
				['Free Memory: '+jvmfree+' MB',parseInt(jvmfree)],
				['Used Memory: '+jvmused+' MB',parseInt(jvmused)] 
			];
			jvmchart = $.jqplot('chartdiv', [data], options);
			getJVMInterval = setInterval('getMemoryUsage()', 4000);
		} else {
			clearInterval(getJVMInterval);
		}
    });
	
	//Handles the GC button
	$("#smRunGC").live('click', function() {
		$(this).attr("disabled", true);
		$.get("rungc.cfm", {}, function() {
			$("#smRunGC").removeAttr("disabled");
		});
	});	

	//Handles the TC button
	$("#tcClear").live('click', function() {
		$(this).attr("disabled", true);
		$.get("runtc.cfm", {}, function() {
			$("#tcClear").removeAttr("disabled");
		});
	});	

});
