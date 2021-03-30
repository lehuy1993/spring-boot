$(document).ready(function () {

    $("#search-form").submit(function (event) {
        //stop submit the form, we will post it manually.
        event.preventDefault();
        fire_ajax_submit();
    });
    

});
var html = "";
function fire_ajax_submit() {

    var search =  $("#search").val();
    $("#btn-search").prop("disabled", true);
   
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/admin/bookinglist/search",
        data: {search:search},
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {
        	 
        	if (data.length > 0) {
        	 html+= " <table id='example1' class='table table-bordered table-striped'>"
        		+ " <thead>"
        		+ "<tr>"
	        		+"<th>#</th>"
	        		+"<th>Booking ID</th>"
	    			+"<th>Member ID</th>"
					+"<th>Full name</th>"
					+"<th>Identity cart</th>"
					+"<th>Phone number</th>"
					+"<th>Movie</th>"
					+"<th>Time</th>"
					+"<th>Seat</th>"
        			+"<th>Status</th>"
        			+"</tr>"
        			+"</thead>"
        			+"<tbody>"
        		var i =0;
        	data.map(item =>{
        		 html += "<tr>"
        			 +"<td>"+i+"</td>"
        			 + "<td>"+item.invoiceId+"</td>"
	        		 + "<td>"+item.account.accountID+"</td>"
	        		 + "<td>"+item.account.fullName+"</td>"
	        		 + "<td>"+item.account.identityCard+"</td>"
	        		 + "<td>"+item.account.phoneNumber+"</td>"
	        		 + "<td>"+item.movieName+"</td>"
	        		 + "<td>"+item.bookingDate.dayOfMonth+"/"+item.bookingDate.monthValue+"/"+item.bookingDate.year+"-"+item.bookingDate.hour+":"+item.bookingDate.minute+"</td>"
        		 	+ "<td>"+item.seat+"</td>"
        		 	if(item.status == 1){
        		 	html+="<td><a type='submit' class='btn btn-primary'>Successful booking</a></td>"
        		 	}else{
        		 	html+="<td><a href=/admin/bookinglist/"+item.invoiceId+" class='btn btn-warning'>Get ticket</a></td>"
        		 	}
        		 	+ "</tr>"
        	
        		i++
        	})
        	html+= " </tbody>"
        	html+= " </table>";
        	
        	 	$('#feedback').html(html);
        	 	
        	} else {
        		var result = "<h3 style='color:red'> Not  found </h3>";
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
    $("#search").val("");
    html="";
}


