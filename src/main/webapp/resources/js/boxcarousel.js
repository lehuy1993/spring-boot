$(".thumbnail").hover(function(){
    $(this).find(".thumbOverlay").fadeIn( 200 );
  }, function(){
    $(this).find(".thumbOverlay").fadeOut( 200 );
  });
  
  //Remove all the lines below for default automatic transition

//  $('#carousel1').carousel({
//    interval: 2000
//  })


  $('#eventCarousel').carousel('pause');
  $('.carousel-control-next').click(function(){
    $('#eventCarousel').carousel('next');
  });
  $('.carousel-control-prev').click(function(){
    $('#eventCarousel').carousel('prev');
  });
  $('#eventCarousel').carousel({
    interval: 2000
  })

  