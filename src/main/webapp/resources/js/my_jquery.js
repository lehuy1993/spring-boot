$(document).ready(function() {
	$("#msg").fadeOut(3000);
	$('#fileImage').change(function() {
		showImagethumbnail(this);
	});
	
	$('#promotionTable a.js-promotion-delete').on('click', function(){
		if(confirmPromotion() === true){
			document.location = window.location.origin + "/admin/delete-promotion/" + $(this).attr('data-id');
		}
	})
	
	$('#movieTable a.js-movie-delete').on('click', function(){
		if(confirmPromotion() === true){
			document.location = window.location.origin + "/admin/delete-movie/" + $(this).attr('data-id');
		}
	})
	// Movie add change roomcienema
	$('#cinemaRoomId').on('change', function() {
		  showSchedule();
		});
	// Movie edit 
/*	var idCinemaRoom = $('#editCinemaRoom').val();
	console.log(idCinemaRoom);
	$('#editCinemaRoom').on('change', function() {
		  editShowSchedule();
		});*/
});

function showImagethumbnail(fileInput) {
	file = fileInput.files[0];
	reader = new FileReader();
	reader.onload = function(e) {
		$("#thumbnail").empty();
		$("#thumbnail").append($('<img>',{id:'theImg2',src: e.target.result, class:'img-fluid', alt:'Logo'}));
	}
	reader.readAsDataURL(file);
}

function confirmPromotion(){
	if(confirm("Are you sure you want to delete this record?")){
		return true;
	}else{
		return false;
	}
}
var html = "";
function showSchedule(){
	
	var idCinemaRoom = $('#cinemaRoomId').val();
	console.log(idCinemaRoom);
	$.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/mock1/admin/showSchedule",
        data: {cinemaRoomId:idCinemaRoom},
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {
        	console.log(data);
        	if (data != null) {
        		data.map(item =>{
           		 html += "<div class='col-6 col-md-3'>"
           			if(item.status == 1){
            		 	html+= "<input id='schedules"+item.scheduleId+"' name='schedules' class='form-check-input' type='checkbox' value="+item.scheduleId+">"
	            		 	 +"<input type='hidden' name='_schedules' value='on'>"
	            		 	 + "<label class='form-check-label' for='inlineRadio1'>"+item.scheduleTime+"</label>"
            		 	}else{
            		 		html+= "<input id='schedules"+item.scheduleId+"' checked='checked' disabled  name='schedules' class='form-check-input' type='checkbox' value="+item.scheduleId+">"
	            		 	 +"<input type='hidden' name='_schedules' value='on'>"
	            		 	 + "<label class='form-check-label' for='inlineRadio1'>"+item.scheduleTime+"</label>"
            		 	}
           		 html += "</div>"
           	})

        	 	$('#schedule').html(html);
        	 	
        	}     
            $("#btn-search").prop("disabled", false);

        },
        
        error: function (e) {
        	console.log("ERROR: ", e);
         
        }
    });
	html="";
}

//Movie edit 
	var movieId = window.location.pathname;
		movieId = movieId.slice(-10);
		
	var idCinemaRoom = $('#editCinemaRoom').val();
	$('#editCinemaRoom').on('change', function() {
		var idCinemaRoom = $('#editCinemaRoom').val();
		$.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "/admin/editSchedule",
	        data: {cinemaRoomId:idCinemaRoom},
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data) {
	        	console.log(data);
	        	if (data != null) {
	        		data.map(item =>{
	        			console.log(item[4]);
	        			
	        			 html += "<div class='col-6 col-md-3'>"
	        			if(item[4] === movieId  ){
	            		 	html+= "<input id='schedules"+item[1]+"' checked='checked'  name='schedules' class='form-check-input' type='checkbox' value="+item[1]+">"
		            		 	 +"<input type='hidden' name='_schedules' value='on'>"
		            		 	 + "<label class='form-check-label' for='inlineRadio1'>"+item[3]+"</label>"
	            		 	}else if(item[4] == null){
	            		 		html+= "<input id='schedules"+item[1]+"'   name='schedules' class='form-check-input' type='checkbox' value="+item[1]+">"
		            		 	 +"<input type='hidden' name='_schedules' value='on'>"
		            		 	 + "<label class='form-check-label' for='inlineRadio1'>"+item[3]+"</label>"
	            		 	}else{
	            		 		html+= "<input id='schedules"+item[1]+"' checked='checked' disabled   name='schedules' class='form-check-input' type='checkbox' value="+item[1]+">"
		            		 	 +"<input type='hidden' name='_schedules' value='on'>"
		            		 	 + "<label class='form-check-label' for='inlineRadio1'>"+item[3]+"</label>"
	            		 	}
	        			 html += "</div>"
	           	})

	        	 	$('#schedule').html(html);
	        	 	
	        	}     
	            $("#btn-search").prop("disabled", false);

	        },
	        
	        error: function (e) {
	        	console.log("ERROR: ", e);
	         
	        }
	    });
		html="";
		});
	$.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/admin/editSchedule",
        data: {cinemaRoomId:idCinemaRoom},
        dataType: 'json',
        cache: false,
        timeout: 600000,
        success: function (data) {
        	console.log(data);
        	if (data != null) {
        		data.map(item =>{
        			console.log(item[4]);
        			 html += "<div class='col-6 col-md-3'>"
        			if(item[4] == movieId  ){
            		 	html+= "<input id='schedules"+item[1]+"' checked='checked'  name='schedules' class='form-check-input' type='checkbox' value="+item[1]+">"
	            		 	 +"<input type='hidden' name='_schedules' value='on'>"
	            		 	 + "<label class='form-check-label' for='inlineRadio1'>"+item[3]+"</label>"
            		 	}else if(item[4] == null){
            		 		html+= "<input id='schedules"+item[1]+"'   name='schedules' class='form-check-input' type='checkbox' value="+item[1]+">"
	            		 	 +"<input type='hidden' name='_schedules' value='on'>"
	            		 	 + "<label class='form-check-label' for='inlineRadio1'>"+item[3]+"</label>"
            		 	}else{
            		 		html+= "<input id='schedules"+item[1]+"' checked='checked' disabled   name='schedules' class='form-check-input' type='checkbox' value="+item[1]+">"
	            		 	 +"<input type='hidden' name='_schedules' value='on'>"
	            		 	 + "<label class='form-check-label' for='inlineRadio1'>"+item[3]+"</label>"
            		 	}
        			 html += "</div>"
           	})

        	 	$('#schedule').html(html);
        	 	
        	}     
            $("#btn-search").prop("disabled", false);

        },
        
        error: function (e) {
        	console.log("ERROR: ", e);
         
        }
    });
	html="";
