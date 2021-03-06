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
                                        <span>Tin M???i &amp; ??u ????i</span>
                                    </li>
                                    <li class="last"><span>Th??nh Vi??n </span>
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
                
            <div class="col-md-12 col-xs-12"><section id="content-seo"><h3>Movie Cinema</h3><div class="row content-seo"><div class="col-md-12"><div class="content-text"><p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><a href="#"><b><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Movie Cinema</span></span></b></a><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">&nbsp;l?? m???t trong nh???ng c??ng ty t?? nh??n ?????u ti??n v??? ??i???n ???nh ???????c th??nh l???p t??? n??m 2003, ???? kh???ng ?????nh th????ng hi???u l?? 1 trong 10 ?????a ??i???m vui ch??i gi???i tr?? ???????c y??u th??ch nh???t. Ngo??i h??? th???ng r???p chi???u phim hi???n ?????i, thu h??t h??ng tri???u l?????t ng?????i ?????n xem, <a href="#"><b>Movie Cinema</b></a> c??n h???p d???n kh??n gi??? b???i kh??ng kh?? th??n thi???n c??ng nh?? ch???t l?????ng d???ch v??? h??ng ?????u.</span></span></span></span></p>

                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">?????n website <a href=""><i>moviecine.vn</i></a>, qu?? kh??ch s??? ???????c c???p nh???t nhanh ch??ng c??c <a href="#"><i>phim hay nh???t</i></a> <a href="#"><i>phim m???i nh???t</i></a> ??ang chi???u ho???c s???p chi???u. <a href="lich-chieu"><i>L???ch chi???u</i></a> t???i m???i h??? th???ng <a href=""><i>r???p chi???u phim</i> </a>c???a <a href=""><b>Movie Cinema</b></a> c??ng ???????c c???p nh???t ?????y ????? h??ng ng??y h??ng gi??? tr??n<i> trang ch???</i>. </span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">?????t v?? t???i <b><a href="">Movie Cinema</a> </b>d??? d??ng ch??? sau v??i thao t??c v?? c??ng ????n gi???n. ????? mua v??, h??y v??o tab Mua v??. Qu?? kh??ch c?? th??? ch???n Mua v?? theo phim, theo r???p, theo ng??y t??y c??ch n??o ti???n l???i nh???t cho b???n th??n.Sau ????, ti???n h??nh mua v?? theo c??c b?????c h?????ng d???n. Ch??? trong v??i ph??t, qu?? kh??ch s??? nh???n ???????c tin nh???n v?? email ph???n h???i <i>?????t v?? th??nh c??ng</i> c???a <a href=""><b>Movie Cinema</b></a>. Qu?? kh??ch c?? th??? d??ng tin nh???n l???y v?? t???i qu???y v?? c???a<a href=""> <b>Movie Cinema</b></a> ho???c qu??t m?? QR ????? m???t b?????c v??o r???p m?? kh??ng c???n t???n th??m b???t k??? c??ng ??o???n n??o n???a.</span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">N???u b???n ???? ch???n ???????c <a href="#"><i>phim hay</i></a> ????? xem, h??y ?????t v?? c???c nhanh b???ng box <i>Mua V?? Nhanh</i> ngay t??? <a href=""><i>Trang Ch???</i></a>. Ch??? c???n m???t ph??t, tin nh???n v?? email ph???n h???i c???a <b><a href="">Movie Cinema</a> </b>s??? g???i ngay v??o ??i???n tho???i v?? h???p mail c???a b???n. </span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">N???u ch??a quy???t ?????nh s??? xem <i>phim m???i</i> n??o, h??y tham kh???o c??c b???<a href="#"> <i>phim hay</i></a> trong m???c<a href="#"> <i>Phim ??ang Chi???u</i></a> c??ng nh?? <a href="phim-sap-chieu"><i>Phim S???p Chi???u</i> </a>t???i <a href=""><i>r???p chi???u phim</i></a> b???ng c??ch v??o m???c <a href="binh-luan-phim"><i>B??nh Lu???n Phim</i></a> ??? <i><a href="http://beta.galaxycine.vn/dien-anh">G??c ??i???n ???nh</a> </i>????? ?????c nh???ng b??i b??nh lu???n ch??n th???t nh???t, tham kh???o v?? c??n nh???c. Sau ????, qu?? kh??ch h??y ?????t v?? b???ng box <i>Mua V?? Nhanh</i> ngay ??? ?????u trang ????? ch???n ???????c su???t chi???u v?? ch??? ng???i v???a ?? nh???t. &nbsp;</span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><a href=""><b><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Movie Cinema</span></span></b></a><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;"> lu??n c?? nh???ng ch????ng tr??nh<a href="khuyen-mai"> <i>khuy???n m??i</i>, <i>??u ????i</i></a>, qu?? t???ng v?? c??ng h???p d???n nh?? <i>gi???m gi??</i> v??, t???ng v?? xem phim mi???n ph??, t???ng Combo, t???ng qu?? phim??? &nbsp;d??nh cho qu?? kh??ch. </span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Trang web <i>galaxycine.vn</i> c??n c?? m???c <i>G??c ??i???n ???nh</i> - s??? h???u l?????ng d??? li???u v??? phim, di???n vi??n v?? ?????o di???n, gi??p qu?? kh??ch d??? d??ng ch???n ???????c phim m??nh y??u th??ch v?? n??ng cao ki???n th???c v??? ??i???n ???nh c???a b???n th??n. Ngo??i ra, v??o m???i th??ng, <a href=""><strong>Movie Cinema</strong> </a>c??ng gi???i thi???u c??c <a href="phim-sap-chieu"><i>phim s???p chi???u</i></a> hot nh???t trong m???c <a href="phim-hay"><i>Phim Hay Th??ng</i> </a>????? qu?? kh??ch s???m c?? s??? t??nh to??n.</span></span></span></span></p>
                
                <p style="margin-top:0in; margin-right:0in; margin-bottom:10.0pt; margin-left:0in; text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><span style="font-size:10.5pt"><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Hi???n nay, <a href="#"><strong><span style="font-family:&quot;Cambria&quot;,&quot;serif&quot;">Movie Cinema</span></strong></a> ??ang ng??y c??ng ph??t tri???n h??n n???a v???i c??c ch????ng tr??nh ?????c s???c, c??c khuy???n m??i h???p d???n, ??em ?????n cho kh??n gi??? nh???ng b??? phim bom t???n c???a th??? gi???i v?? Vi???t Nam nhanh ch??ng v?? s???m nh???t.</span></span></span></span></p>
                </div></div></div></section></div>


             
        </div>
         <!-- Footer   -->

        <jsp:include page="footer.jsp"></jsp:include>
