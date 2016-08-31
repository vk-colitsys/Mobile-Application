<cfset maxMail = 10 />
<cfset mail = application.undeliveredMail.queryMail(page=1,pageSize=maxMail,gridSortColumn='DATELASTMODIFIED',gridSortDirection='desc',returnFormat='json') />
<div id="undeliveredMail">

	<cf_toolbar title="Undelivered Mail" />
	
	<div class="body">
		<cfoutput>
			<cfif mail.totalRowCount>
				<div>
					<h4>1 to <span id="mailCount">#val(mail.query.recordCount)#</span> of #val(mail.totalRowCount)#</h4>
				</div>
				
				<ul>
					<cfloop query="mail.query">
						<li class="mail-msg">
							<div class="float-left" style="padding-right: 15px; margin-top: 5px;margin-bottom:5px;">
								<input type="button" value="Respool" class="respool" id="#replace(createUUID(), "-", "", "all")#" msg="#name#" />
							</div>
							<div class="float-left mail-details">
								From: #sender#<br />
								To: #to#<br />
								Sent: #dateFormat(sent, "mm/dd/yy")# #timeFormat(sent, "hh:mm:ss tt")#<br />
								Subject: #subject#<br />
							</div>
							<div class="clear"></div>
						</li>
					</cfloop>
				</ul>
			<cfelse>
				<h4>No Undelivered Mail</h4>
			</cfif>
		</cfoutput>
	</div>
</div>

