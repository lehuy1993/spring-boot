
$(document).ready(function () {
	
	   $( '#submit' ).on( 'click', function() {
		   submit();
	    });

});
 function setTypeNorma(obj) {
		    if($(obj).hasClass('seat-vipprime') ) {
		    	$(obj).removeClass('seat-vipprime ');
				$(obj).addClass('seat-standard ');
				$(obj).addClass('check ');
				
			} else {
				$(obj).removeClass('seat-standard ');
				$(obj).removeClass(' check');
				$(obj).addClass('seat-vipprime ');
		    }
		   
    	
	}
function setTypeVip(obj) {
		    if($(obj).hasClass('seat-standard') ) {
		    	$(obj).removeClass('seat-standard ');
				$(obj).addClass('seat-vipprime ');
				$(obj).addClass('check ');
				
			} else {
				$(obj).removeClass('seat-vipprime ');
				$(obj).removeClass(' check');
				$(obj).addClass('seat-standard ');
		    }
 	
	}

var box = {};
var html = {};
	function submit() {
		
		var columns = $('.check');
		
			box = {};
			$(columns).each(function() {
				if (typeof box[$(this).attr('zone')] == 'undefined') box[$(this).attr('zone')] = {};
				box[$(this).attr('zone')][$(this).attr('value')] = {
						seatId:$(this).attr('value')
		            };
			});
			var seatId = {};
			for (var key in box) {
				if (box.hasOwnProperty(key)) {
					$.each(box[key], function( index, value ) {
						if(!seatId['seatId']) {
							seatId['seatId'] = value.seatId;
						} else {
							seatId['seatId'] += ', '+value.seatId;
						}
                    });
                    
				
                }
               
			}
			
			var html = "";
			var data = JSON.stringify(seatId);
			console.log(data.length)
			if (data.length > 2) {
				$.ajax({
					type: 'Get',
				    url : "/admin/cinemaroom/updateType",
				    contentType: "application/json",
				    dataType: "json",
				    cache: false,
			        timeout: 100000,
				    data : {seatID: data}, // parameters
				    success: function (data) {
				    	$("#submit").prop("disabled", false);
				        },
				    error: function(e) {
				    	html = "<div id='remove'  class='callout callout-success'>"
							+ "<h5> Update Successfully  ! </h5>";
							$('#showMsg').html(html);
							$('#showMsg').fadeOut(6000);
							$('#showMsg').css("display", "block");
							$('#showMsg').fadeOut(6000);
				        $("#submit").prop("disabled", false);
				      }
				});
			}else{
					html = "<div id='remove'  class='callout callout-success'>"
						+ "<h5> Please select seat frist ! </h5>";
						$('#showMsg').html(html);
						$('#showMsg').fadeOut(6000);
						$('#showMsg').css("display", "block");
						$('#showMsg').fadeOut(6000);
						
			}
			

	}

	
