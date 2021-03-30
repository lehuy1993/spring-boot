$(document).ready(function () {

    $("#search-form").submit(function (event) {
        //stop submit the form, we will post it manually.
        event.preventDefault();
        fire_ajax_submit();
    });
    $( '.btn-right' ).on( 'click', function() {
    	ajax_submit();
    });

});
var memberId = "";
function fire_ajax_submit() {

    var search =  $("#search").val();

    $("#btn-search").prop("disabled", true);

    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/api/search",
        data: {search:search},
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {
        	console.log(data);
        	if (data != null) {
        	var html= "<h4 class='text-secondary '>Member infomartion</h4>"
        		html+= "<div id='collapseOne' class='collapse show 'aria-labelledby='headingOne' data-parent='#accordion'>"
				html+=	"<div class='card-body ' style='font-size: 15px;'>"
				html+=	"<div class=' member '><p>Full name:</p><br /><p>Email:</p><br /><p>Phone:</p><br /><p>Sorce:</p><br />"
				html+= 	"<p> Convert to ticket:</p>	</div>"
				html+=	"<div class='value'><p>"+data.account.fullName+"</p><br />"
				html+=	"<p>"+data.account.email+"</p><br />"
				html+=	"<p>"+data.account.phoneNumber+"</p><br />"
				html+=	"<p>"+data.score+"</p><br />";
        		html+="    <input type='radio' class='form-check-input' value='1'checked name='optradio'>Agress </br>"
        			+		"<input type='radio' class='form-check-input' value='2' name='optradio'>Disagree</br>";
        
        	 	$('#feedback').html(html);
        	 	 memberId = data.memberId;
        	} else {
        		var result = "<h3 style='color:red'> No member found </h3>";
        		 $('#feedback').html(result);
        	}           
            $("#btn-search").prop("disabled", false);

        },
        error: function (e) {
        	var html= "<h4 class='text-secondary '>Not found</h4>"
            $('#feedback').html(html);
        	console.log("ERROR: ", e);
            $("#btn-search").prop("disabled", false);

        }
    });

}

function ajax_submit () {
	var check = $('input[name=optradio]:checked').val();
	if ( $("#search").val() == null) {
		alert('Please choose enter member.');
		 $("#search").val().focus;
	}
	
	if(Object.keys(con).length > 0) {
		$(location).attr('href', '../../../employee/booking/tickets/info?member='+memberId+'&check='+check)
	}else{
		alert('Please choose your seats first.');
	}
}

