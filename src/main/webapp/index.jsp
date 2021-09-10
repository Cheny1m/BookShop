<%--
  Created by Eclipse.
  User: cym
  Date: 2020/06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>热爱书城</title>
    <%--  
    	<title>商品列表</title>
    --%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
<!--header-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="1"></jsp:param>
</jsp:include>

<!--banner-->


<section class="carousel">
    <div data-ride="carousel" class="carousel-of-product carousel slide" id="carousel-of-product" >
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li class="active" data-slide-to="0" data-target="#carousel-of-product"></li>
            <li data-slide-to="1" data-target="#carousel-of-product" class=""></li>
            <li data-slide-to="2" data-target="#carousel-of-product" class=""></li>
        </ol>
        <!-- Wrapper for slides -->
        <div role="listbox" class="carousel-inner">
            <div class="item active">
                <!-- <img src="images/slid.jpg" class="carousel carousel-image"> -->
	            <div class="banner">
					<div class="container">
					    <h2 class="hdng"><a href="book_detail.action?bid=${scrollBook.bid}">${scrollBook.bname}</a><span></span></h2>
					    <p>今日精选推荐</p>
					    <a class="banner_a" href="javascript:;" onclick="buy(${scrollBook.bid})">立刻购买</a>
					    <div class="banner-text">
					    	<a href="book_detail.action?bid=${scrollBook.bid}">
					            <img src="${scrollBook.bcover}" alt="${scrollBook.bname}" width="350" height="350">
					        </a>
					    </div>
					</div>
				</div> 
            </div>
            <div class="item">
	            <div class="banner">
					<div class="container">
					    <h2 class="hdng"><a href="book_detail.action?bid=${discountBook.bid}">${discountBook.bname}</a><span></span></h2>
					    <p>今日折扣商品</p>
					    <div class="product-info simpleCart_shelfItem">
							<div class="product-info-cust prt_name">
								<span class="item_price" style="color:red;font-size:3em">￥27.4</span>
								<div class="ofr">
								  <p class="pric1" style="font-size:1.2em"><del>￥34</del></p>
								  <p class="disc" style="font-size:1.5em">[20% Off]</p>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
					    <a class="banner_a" href="javascript:;" onclick="buy(${discountBook.bid})">立即抢购</a>
					    <div class="banner-text">
					    	<a href="book_detail.action?bid=${discountBook.bid}">
					            <img src="${discountBook.bcover}" alt="${discountBook.bname}" width="350" height="350">
					        </a>
					    </div>
					</div>
				</div> 
            </div>
            <div class="item">
            <div class="banner">
					<div class="container">
		                <a href="" target="_blank">
		                <img src="images/gyhb.png" style="margin-left:13%">
                		</a>
                	</div>
                </div>
            </div>
        </div>

        <div class="m-menu">
            <ul>
            <c:forEach items="${categories}" var="c" varStatus="vs">
                <c:if test="${vs.count>=1 and vs.count<=13}">
                    <li cid="${c.id}"><span class="glyphicon glyphicon-link"></span><a href="category?id=${c.id}">${c.name}</a></li>
                </c:if>
            </c:forEach>
            </ul>
        </div>
        <c:forEach items="${categories}" var="c" varStatus="vs">
        <div class="d-menu" cid="${c.id}" style="display: none">
            <c:forEach items="${c.products}" var="p" varStatus="vs">
                <a href="product?id=${p.id}">${p.subTitle}</a>
            </c:forEach>
        </div>
        </c:forEach>
    </div>

</section>

<!--//banner-->

<!--gallery-->
<div class="gallery">
    <div class="container">
        <div class="alert alert-danger">热销推荐</div>
        <div class="gallery-grids">
            <c:forEach items="${hotList}" var="book">
                <div class="col-md-4 gallery-grid glry-two">
                    <a href="book_detail.action?bid=${book.bid}">
                        <img src="${book.bcover}" class="img-responsive" alt="${book.bname}" width="350" height="350"/>
                    </a>
                    <div class="gallery-info galrr-info-two">
                        <p>
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                            <a href="book_detail.action?bid=${book.bid}">查看详情</a>
                        </p>
                        <a class="shop" href="javascript:;" onclick="buy(${book.bid})">立刻购买</a>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="galy-info">
                        <p>${book.btname} > ${book.bname}</p>
                        <div class="galry">
                            <div class="prices">
                                <h5 class="item_price">¥ ${book.bprice}</h5>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="clearfix"></div>
        <div class="alert alert-info">新品推荐</div>
        <div class="gallery-grids">
            <c:forEach items="${newList}" var="book">
                <div class="col-md-3 gallery-grid ">
                    <a href="book_detail.action?bid=${book.bid}">
                        <img src="${book.bcover}" class="img-responsive" alt="${book.bname}"/>
                    </a>
                    <div class="gallery-info">
                        <p>
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                            <a href="book_detail.action?bid=${book.bid}">查看详情</a>
                        </p>
                        <a class="shop" href="javascript:;" onclick="buy(${book.bid})">立刻购买</a>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="galy-info">
                        <p>${book.btname} > ${book.bname}</p>
                        <div class="galry">
                            <div class="prices">
                                <h5 class="item_price">¥ ${book.bprice}</h5>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!--//gallery-->
<!--subscribe-->
<div class="subscribe"></div>
<!--//subscribe-->


<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
