if (Cookies.get('tickets') == null) {
 			   $(location).attr('href', '../../../employee/showtime')
 		}	
	var tickets =JSON.parse(Cookies.get('tickets'));
	console.log(tickets);
	var label = tickets.label;
	var movieName = tickets.movieName;
	var boxprice  = tickets.price;
	var seat = " " ;
	var html;
	$.each(label, function( index, value ) {
		
		if(!html) {
			html = '<span style="clear: both; float: left;">'+index+'</span>';
		} else {
			html += '<span style="clear: both; float: left;">'+index+'</span>';
		}
		html += '<span style="clear: both; float: left;">'+value+'</span>';
		 seat=  seat.concat(value)+" " ;
	});
	

	$('.minicart-wrapper .block-seats .data').html(html);
	$('.block-seats').show();
	$('.minicart-wrapper .block-box .price').html(formatMoney(boxprice)+ "\u00a0\u20ab");

	$('.member .seat').html(seat)
	
	$('#movieName').html(movieName);
	
	var duration = tickets.duration;
	$('#duration').html(duration);
	
	var cinemaRoomName = tickets.cinemaRoomName;
	$('#cinemaRoomName').html(cinemaRoomName);
	
	var time = tickets.time
	$('#time').html(time);
	
	//var time = tickets.time.split(",")[1];
	//
	//var date = tickets.time.split(",")[2];
	
	var	img2 = tickets.img.split("/")[3];
	var res = img2.substr(0, img2.length - 1);
		console.log(res)
	var htmlImg = '<img src="/resources/img/'+res+'"></td> ' ;
	
	$('#img').html(htmlImg);
	
	
	
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
	
