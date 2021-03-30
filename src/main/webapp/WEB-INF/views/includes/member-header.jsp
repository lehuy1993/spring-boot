
<header>
    <div class="header__wrapper">
        <div class="row mr-0 ml-0">
            <div class="col-md-2 col-3">
                <div class="header__logo">
                    <img class="img-fluid" src="<%=request.getContextPath()%>/resources/img/ic-logo.png" alt="">
                </div>
            </div>
            <div class="col-md-10 col-9 align-self-center">
                <div class="header__nav float-left d-flex">
                    <nav class="navbar navbar-expand p-0">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                          </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" >Showtimes <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Movies
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Movies</a>
                                        <a class="dropdown-item" href="#">Movies</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <form action="${pageContext.request.contextPath}/member/search" method="GET">
                        <div class="header__search">
                            <div class="input-group col-md-12">
                                <input type="text" class="form-control" placeholder="Search" id="key" name="key"  />
                                <span class="input-group-btn">
                                    <button class="btn btn-custom" type="submit">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="header__group float-right d-inline-flex">
                    <div class="item">
                        <i class="fa fa-user"></i> Welcome, ${fullName}
                    </div>
                    <div class="item">
                        <a href="<%=request.getContextPath()%>/logout">
                            <i class="fa fa-power-off"></i> Logout
                        </a>
                    </dispanv>
                </div>
            </div>
        </div>
    </div>
</header>

