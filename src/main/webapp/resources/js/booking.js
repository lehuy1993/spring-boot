		var boxlimit = 0;
		var box = {};
		var fseats = {};
		var con = {};

            function selectedseats(obj) {
	
            if(!$(obj).hasClass('checked')) {
			if($(obj).attr('spec')) {
				if(boxlimit < 7) {
					var data = $('.ticketbox .row .seat.active');
					$(data).each(function() {
						if($(obj).attr('spec') == $(this).attr('spec')) {
							$(this).addClass('checked');
							checked += 1;
						}
						
					});
				} else {
					alert('Bạn có thể chọn tối đa 8 ghế');
				}
			} else {
				
				if(boxlimit < 8) {
					$(obj).addClass('checked');
					boxlimit += 1;
				} else {
					alert('Bạn có thể chọn tối đa 8 ghế');
				}
			}
		} else {
			if($(obj).attr('spec')) {
				var data = $('.ticketbox .seat.checked');
				$(data).each(function() {
					if($(obj).attr('spec') == $(this).attr('spec')) {
						$(this).removeClass('checked');
						boxlimit -= 1;
					}					
				});
			} else {
				$(obj).removeClass('checked');
				boxlimit -= 1;
			}				
        }

        box = {};
		boxprice = 0;
		fseats = {};
		ftickets = 0;
		var columns = $('.ticketbox .seat.checked');
		$(columns).each(function() {
			if (typeof box[$(this).attr('zone')] == 'undefined') box[$(this).attr('zone')] = {};

			box[$(this).attr('zone')][$(this).attr('loc')] = {
				label: $(this).text().replace(/\s/g,''),
				price: parseInt($(this).attr('price')),
				seatId:$(this).attr('loc')
            };
            

		});
		
		var htmlbox;		
		if(Object.keys(box).length > 0) {
			var label = {};
			var seatId = {};
			htmlbox = '<dl class="item-options">';
			for (var key in box) {

				if (box.hasOwnProperty(key)) {
					var qty = 0;
					$.each(box[key], function( index, value ) {
						
						if(!label[key]) {
							label[key] = value.label;
						} else {
							label[key] += ', '+value.label;
						}
						if(!seatId['seatId']) {
							seatId['seatId'] = value.seatId;
						} else {
							seatId['seatId'] += ', '+value.seatId;
						}
						
						if(value.price > 0) boxprice += value.price;
                        qty += 1;
                       
                    });
                    
					htmlbox += '<dt>'+key+'</dt>';
					htmlbox += '<dd>'+qty+'</dd>';
                }
               
			}
			htmlbox += '</dl>';
		
			var html;
			$.each(label, function( index, value ) {
				console.log(value)
				if(!html) {
					html = '<span style="clear: both; float: left;">'+index+'</span>';					
				} else {
					html += '<span style="clear: both; float: left;">'+index+'</span>';
				}
				html += '<span style="clear: both; float: left;">'+value+'</span>';
			});
			
			$('.minicart-wrapper .block-seats .data').html(html);
			$('.block-seats').show();
		} else {
			$('.minicart-wrapper .block-seats .data').empty();
			$('.block-seats').hide();
		}
        $('.minicart-wrapper .block-box .price').html(formatMoney(boxprice)+ "\u00a0\u20ab");
       
        var movieName =	$('.product-details .info-wrapper .label').html();
        var time =	$('#time').html();
        var img =	$('#img').html();
        var cinemaRoomName =	$('#cinemaRoomName').html();
       var duration = $('#duration').html();
        con = {label:label,price:boxprice,duration:duration, movieName:movieName, time:time,img:img, cinemaRoomName:cinemaRoomName, seatId:seatId };
        con = JSON.stringify(con);
        
        var inFifteenMinutes = new Date(new Date().getTime() + 15 * 60 * 1000);
    	Cookies.set('tickets', con,{expires: inFifteenMinutes});
    	
    	var movies =  JSON.parse(Cookies.get('tickets'));
 		   if (Cookies.get('tickets') == null) {
 			   $(location).attr('href', '../../../member/show')
 		}
    	
    	
	}
	
    function formatMoney(amount, thousands = ",") {
			try {
			

				const negativeSign = amount < 0 ? "-" : "";

				let i = parseInt(amount = Math.abs(Number(amount) || 0)).toString();
				let j = (i.length > 3) ? i.length % 3 : 0;

				return negativeSign + (j ? i.substr(0, j) + thousands : '') + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousands) ;
			} catch (e) {
				console.log(e)
			}
	};

	

