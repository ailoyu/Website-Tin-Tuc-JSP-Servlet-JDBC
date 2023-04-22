<%@include file="/common/taglib.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url var ="HomeURL" value="/trang-chu"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
<script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>

<body>
<div class="row" style="margin-top: 20px; margin-bottom: 20px">

        <div class="col-lg-3">

          <h1 class="my-4">Thể Loại</h1>
          <div class="list-group">
          <c:forEach var="item" items="${categories}">
          
          	<c:url var="editURL" value="/trang-chu">
				<c:param name="type" value="home"/>
				<c:param name="categoryId" value="${item.id}"/>
				<c:param name="page" value="1"/>
				<c:param name="maxPageItem" value="6"/>
<%-- 				<c:param name="sortName" value="title"/> --%>
<%-- 				<c:param name="sortBy" value="desc"/>  --%>
			</c:url>
          
          	 <a href='${editURL}' class="list-group-item" id="">${item.name }</a>
          </c:forEach>
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">
			<c:if test="${ categoryId == null }">
          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="https://dichvuvietbaiseo.vn/wp-content/uploads/2017/07/bang-gia-quang-cao-bao-dien-tu-vnexpress.net_-1280x720.png" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="https://s.vnecdn.net/vnexpress/j/v8/event/vnexpress20nam/images/slider/21-VnE.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="https://ssm.vn/wp-content/uploads/2020/04/bao-gia-quang-cao-vnexpress-1.png" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
          	</c:if>
          <div class="container" style="margin-bottom: 15px; margin-top: 15px">
           Sắp xếp theo:
          	<select name="forma" id='SelectOption' onchange="location = this.value;" class="form-control" style="height: 35px; width: 200px; display: inline; margin-left: 20px;">
        		<c:if test="${ not empty categoryId }">
        			<option> </option>
	        		<option value="${HomeURL}?type=home&categoryId=${categoryId}&page=1&maxPageItem=6&sortName=title&sortBy=desc">Tên giảm dần</option>
	        		<option value="${HomeURL}?type=home&categoryId=${categoryId}&page=1&maxPageItem=6&sortName=title&sortBy=asc">Tên tăng dần</option>
	        		<option value="${HomeURL}?type=home&categoryId=${categoryId}&page=1&maxPageItem=6&sortName=createddate&sortBy=asc">Tin cũ nhất</option>
	        		<option value="${HomeURL}?type=home&categoryId=${categoryId}&page=1&maxPageItem=6&sortName=createddate&sortBy=desc">Tin mới nhất</option>
        		</c:if>
        		<c:if test="${ empty categoryId }">
	        		<option> </option>
	        		<option value="${HomeURL}?type=home&page=1&maxPageItem=6&sortName=title&sortBy=desc">Tên giảm dần</a></option>
	        		<option value="${HomeURL}?type=home&page=1&maxPageItem=6&sortName=title&sortBy=asc">Tên tăng dần</option>
	        		<option value="${HomeURL}?type=home&page=1&maxPageItem=6&sortName=createddate&sortBy=asc">Tin cũ nhất</option>
	        		<option value="${HomeURL}?type=home&page=1&maxPageItem=6&sortName=createddate&sortBy=desc">Tin mới nhất</option>	
        		</c:if>
        	</select>
        	<a href='${editURL}'></a>
          </div>
		          
		<form action="<c:url value ='/trang-chu'/>" id="formSubmit"
		method="get">
          <div class="row">
			<c:forEach var="item" items="${model.listResult}">
			
			<c:url var="editURL" value="/trang-chu">
				<c:param name="type" value="info"/>
				<c:param name="id" value="${item.id}"/>
			</c:url>
			
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href='${editURL}'><img class="card-img-top" src="https://s1cdn.vnecdn.net/vnexpress/restruct/i/v757/logo_default.jpg" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href='${editURL}'>${item.title }</a>
                  </h4>
                  <h5>Tác giả: ${item.createdBy }</h5>
                  <p class="card-text">${item.shortDescription }</p>
                </div>
                <div class="card-footer">
                 <c:set var="today" value="${item.createdDate }" />
				<p>Ngày: <strong><fmt:formatDate pattern="dd-MM-yyyy HH:mm" value="${today}" /></strong></p>
                </div>
              </div>
            </div>
			
            </c:forEach>
			
          </div>
          
          	<ul class="pagination" id="pagination" ></ul>
        	<input type="hidden" value="" id="type" name="type"/>
        	<c:if test="${ not empty model.categoryId }">
				<input type="hidden" value="${model.categoryId}" id="categoryId" name="categoryId"/>
			</c:if>
			<input type="hidden" value="" id="page" name="page"/>
			<input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
			
			
			
          <!-- /.row -->
			</form>
        </div>
        <!-- /.col-lg-9 -->
		
      </div>
      <!-- /.row -->
      
  <script type="text/javascript">
     	var totalPage = ${model.totalPage}; // truyền từ servlet qua
		var currentPage = ${model.page}; // truyền từ servlet qua
// 		var categoryId = ${model.categoryId};
		var limit = 6;
		$(function () {
	        window.pagObj = $('#pagination').twbsPagination({
	            totalPages: totalPage,
	            visiblePages: 10,
	            startPage: currentPage,
	            onPageClick: function (event, page) {
	            	if(currentPage != page){
	    				// #maxPageItem: gọi 'id' từ input ra, truyền value của 'maxPageItem' = 'limit' 
	    				// sau khi truyền 'value' xong, dùng 'name' đẩy data qua servlet (request.getParameter)
	    						$('#maxPageItem').val(limit);
	    						$('#page').val(page);
// 	    						$('#sortName').val('title');
// 	    						$('#sortBy').val('desc');
	    						$('#type').val('home');
// 	    						$('#categoryId').val(categoryId);
	    						// gọi tới id formSubmit trong form
	    						$('#formSubmit').submit();
	    			}
	            }
	        }).on('page', function (event, page) {
	            console.info(page + ' (from event listening)');
	        });
	    });
		
// 		document.getElementById('SelectOption').addEventListener('change', function() {
// 			  var val = $( "#SelectOption" ).val();
// 			  var categoryId = ${categoryId};
// 			  console.log(val)
// 			  if(val === 'desc' && categoryId != null) {
// 				val.value = "desc";  
// 				window.location.href = "${HomeURL}?type=home&categoryId=${categoryId}&page=1&maxPageItem=5&sortName=title&sortBy=desc";
// 			  }
// 			  if(val === 'asc' && categoryId != null) {
// 				  window.location.href = "${HomeURL}?type=home&categoryId=${categoryId}&page=1&maxPageItem=5&sortName=title&sortBy=asc";
// 			  }
// 			  if (val === 'Sitemap') {
// 			    window.open('sitemap.php', '_blank');
// 			  }
// 			});
		
		
	</script>  
</body>
</html>