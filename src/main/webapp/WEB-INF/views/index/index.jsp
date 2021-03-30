<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
            <!-- BODY -->
          
            <div class="main-container">
                
                    <!-- MOVIE SELECTION -->   
                    <div class="main">
                        <div class="col-main">
                            <div class="home-movie-selection">
                                <div class="home-title">
                                    <h2>movie selection</h2>
                                </div>
                                
                            </div>
                            <div>
                                <div  class="carousel slide">
                                    <div class="carousel-inner">
                                    <div class="carousel-item active ">
                                        <ul class="thumbnails row">
                                        <!-- Show MOVIE -->
	                                      <c:forEach var="movie" items="${movies }">
		                                       	 <li class="col-sm-3 mb-5">
		                                            <div class="thumbnail">
		                                            <div class="thumbOverlay">
		                                                <div class="thumbContent">
		                                                <h4>${movie.movieNameEnglish }</h4>
		                                                <p>${movie.content }</p>
		                                                <a class="btn btn-success btn-mini" href="${pageContext.request.contextPath}/member/show">Booking</a>
		                                                </div>
		                                            </div>
		                                            <img height="300px" src="${pageContext.request.contextPath}/resources/img/${movie.smallImage}">
		                                            </div>
		                                        </li>
	                                       </c:forEach>

                                        </ul>
                                    </div>
                                    </div>
                                    
                                </div> 
                            </div>               
                        </div>
                        <!-- EVENT -->
                        <div class="col-main">
                            <div class="home-event">
                                <div class="home-title">
                                    <h2>movie selection</h2>
                                </div>
                                <ul class="toggle-tabs">
                                    <li class="current">
                                        <span>Tin Mới &amp; Ưu Đãi</span>
                                    </li>
                                    <li class="last"><span>Thành Viên </span>
                                    </li>
                                </ul>
                                <div>
                                    <div id="eventCarousel" class="carousel slide">
                                        <div class="carousel-inner">
                                        <div class="carousel-item ">
                                            <ul class="thumbnails row">
                                            <c:forEach var="promotion" items="${promotions }">
                                            	<li class="col-sm-4">
                                                    <div class="thumbnail">
                                                    
                                                    <img height="300px" src="${pageContext.request.contextPath}/resources/img/${promotion.image}">
                                                    </div>
                                                </li>
                                            </c:forEach>
                                                
                                            
                                                
                                            </ul>
                                        </div>
                                        <div class="carousel-item active">
                                            <ul class="thumbnails row">
                              				<c:forEach var="promotion" items="${promotions }">
                                            	<li class="col-sm-4">
                                                    <div class="thumbnail">
                                                    
                                                    <img height="300px" src="${pageContext.request.contextPath}/resources/img/${promotion.image}">
                                                    </div>
                                                </li>
                                            </c:forEach>
                                            </ul>
                                        </div>
                                        </div>
                                        <div class="carousel-control-prev" id="event" role="button" data-slide="prev">
                                        <a class="carousel-control" href="#carouselExampleControls">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        </div>
                                        <div class="carousel-control-next" id="event" role="button" data-slide="next">
                                        <a class="carousel-control" href="#carouselExampleControls">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                        </div>
                                    </div> 
                                </div>    
                            </div>
                            
                                        
                        </div>

                        <!-- Tickket -->
                        <div class="home-promotion-card">
                            <ul class="promos">
                                <li class="col-ad">
                                    <div class="format-border">
                                        <a href="https://www.cgv.vn/default/newsoffer/dream-party-package/">
                                        <img alt="" src="https://www.cgv.vn/media/wysiwyg/packages/214x245.jpg"></a>
                                    </div>
                                </li>
                                <li class="col-hd">
                                    <div class="format-border">
                                        <a href="https://www.cgv.vn/default/newsoffer/u22-vn/">
                                        <img src="https://www.cgv.vn/media/wysiwyg/2021/012021/U22-496x247-01.jpg"></a>
                                    </div>
                                </li>
                                <li class="col-ad">
                                    <div class="format-border">
                                        <a href="https://www.cgv.vn/default/newsoffer/dream-party-package/">
                                        <img alt="" src="https://www.cgv.vn/media/wysiwyg/packages/214x245.jpg"></a>
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </div>

            </div>
                
            <div class="col-md-12 col-xs-12"><section id="content-seo"><h3>Movie Cinema</h3><div class="row content-seo"><div class="col-md-12"><div class="content-text"><p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><a href="#"><b><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Movie Cinema</span></span></b></a><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">&nbsp;là một trong những công ty tư nhân đầu tiên về điện ảnh được thành lập từ năm 2003, đã khẳng định thương hiệu là 1 trong 10 địa điểm vui chơi giải trí được yêu thích nhất. Ngoài hệ thống rạp chiếu phim hiện đại, thu hút hàng triệu lượt người đến xem, <a href="#"><b>Movie Cinema</b></a> còn hấp dẫn khán giả bởi không khí thân thiện cũng như chất lượng dịch vụ hàng đầu.</span></span></span></span></p>

                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Đến website <a href=""><i>moviecine.vn</i></a>, quý khách sẽ được cập nhật nhanh chóng các <a href="#"><i>phim hay nhất</i></a> <a href="#"><i>phim mới nhất</i></a> đang chiếu hoặc sắp chiếu. <a href="lich-chieu"><i>Lịch chiếu</i></a> tại mọi hệ thống <a href=""><i>rạp chiếu phim</i> </a>của <a href=""><b>Movie Cinema</b></a> cũng được cập nhật đầy đủ hàng ngày hàng giờ trên<i> trang chủ</i>. </span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Đặt vé tại <b><a href="">Movie Cinema</a> </b>dễ dàng chỉ sau vài thao tác vô cùng đơn giản. Để mua vé, hãy vào tab Mua vé. Quý khách có thể chọn Mua vé theo phim, theo rạp, theo ngày tùy cách nào tiện lợi nhất cho bản thân.Sau đó, tiến hành mua vé theo các bước hướng dẫn. Chỉ trong vài phút, quý khách sẽ nhận được tin nhắn và email phản hồi <i>Đặt vé thành công</i> của <a href=""><b>Movie Cinema</b></a>. Quý khách có thể dùng tin nhắn lấy vé tại quầy vé của<a href=""> <b>Movie Cinema</b></a> hoặc quét mã QR để một bước vào rạp mà không cần tốn thêm bất kỳ công đoạn nào nữa.</span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Nếu bạn đã chọn được <a href="#"><i>phim hay</i></a> để xem, hãy đặt vé cực nhanh bằng box <i>Mua Vé Nhanh</i> ngay từ <a href=""><i>Trang Chủ</i></a>. Chỉ cần một phút, tin nhắn và email phản hồi của <b><a href="">Movie Cinema</a> </b>sẽ gửi ngay vào điện thoại và hộp mail của bạn. </span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Nếu chưa quyết định sẽ xem <i>phim mới</i> nào, hãy tham khảo các bộ<a href="#"> <i>phim hay</i></a> trong mục<a href="#"> <i>Phim Đang Chiếu</i></a> cũng như <a href="phim-sap-chieu"><i>Phim Sắp Chiếu</i> </a>tại <a href=""><i>rạp chiếu phim</i></a> bằng cách vào mục <a href="binh-luan-phim"><i>Bình Luận Phim</i></a> ở <i><a href="http://beta.galaxycine.vn/dien-anh">Góc Điện Ảnh</a> </i>để đọc những bài bình luận chân thật nhất, tham khảo và cân nhắc. Sau đó, quý khách hãy đặt vé bằng box <i>Mua Vé Nhanh</i> ngay ở đầu trang để chọn được suất chiếu và chỗ ngồi vừa ý nhất. &nbsp;</span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><a href=""><b><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Movie Cinema</span></span></b></a><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"> luôn có những chương trình<a href="khuyen-mai"> <i>khuyến mãi</i>, <i>ưu đãi</i></a>, quà tặng vô cùng hấp dẫn như <i>giảm giá</i> vé, tặng vé xem phim miễn phí, tặng Combo, tặng quà phim… &nbsp;dành cho quý khách. </span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Trang web <i>galaxycine.vn</i> còn có mục <i>Góc Điện Ảnh</i> - sở hữu lượng dữ liệu về phim, diễn viên và đạo diễn, giúp quý khách dễ dàng chọn được phim mình yêu thích và nâng cao kiến thức về điện ảnh của bản thân. Ngoài ra, vào mỗi tháng, <a href=""><strong>Movie Cinema</strong> </a>cũng giới thiệu các <a href="phim-sap-chieu"><i>phim sắp chiếu</i></a> hot nhất trong mục <a href="phim-hay"><i>Phim Hay Tháng</i> </a>để quý khách sớm có sự tính toán.</span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Hiện nay, <a href="#"><strong><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Movie Cinema</span></strong></a> đang ngày càng phát triển hơn nữa với các chương trình đặc sắc, các khuyến mãi hấp dẫn, đem đến cho khán giả những bộ phim bom tấn của thế giới và Việt Nam nhanh chóng và sớm nhất.</span></span></span></span></p>
                </div></div></div></section></div>


             
        </div>
         <!-- Footer   -->

        <jsp:include page="footer.jsp"></jsp:include>
