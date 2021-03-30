
		$( '.btn-right' ).on( 'click', function() {
			if(Object.keys(con).length > 0) {
				$(location).attr('href', '../../../member/booking/tickets/info')
			}else{
				alert('Please choose your seats first.');
			}
					
	});
		
