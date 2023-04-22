<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang Chủ</title>
</head>
<body>
<div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">Thể Loại</h1>
          <div class="list-group">
          <c:forEach var="item" items="${categories}">
          	 <a href="#" class="list-group-item" id="">${item.name }</a>
          </c:forEach>
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
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
		<form action="<c:url value ='/admin-new'/>" id="formSubmit"
		method="get">
          <div class="row">
			<c:forEach var="item" items="${model.listResult}">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">${item.title }</a>
                  </h4>
                  <h5>${item.createdBy }</h5>
                  <p class="card-text">${item.shortDescription }</p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                </div>
              </div>
            </div>
			
            </c:forEach>
			<ul class="pagination" id="pagination" ></ul>
			<input type="hidden" value="" id="type" name="type"/>
			<input type="hidden" value="" id="page" name="page"/>
			<input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
			<input type="hidden" value="" id="sortName" name="sortName"/>
			<input type="hidden" value="" id="sortBy" name="sortBy"/>
          </div>
          <!-- /.row -->
			</form>
        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->
      
      <script type="text/javascript">
      var totalPage = ${model.totalPage}; // truyền từ servlet qua
		var currentPage = ${model.page}; // truyền từ servlet qua
		var limit = 3;
		$(function () {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages: totalPage, //
				visiblePages: 10, // Số trang hiển thị
				startPage: currentPage,
				onPageClick: function (event, page) {
					if(currentPage != page){
				// #maxPageItem: gọi 'id' từ input ra, truyền value của 'maxPageItem' = 'limit' 
				// sau khi truyền 'value' xong, dùng 'name' đẩy data qua servlet (request.getParameter)
						$('#maxPageItem').val(limit);
						$('#page').val(page);
						$('#sortName').val('title');
						$('#sortBy').val('desc');
						$('#type').val('home');
						// gọi tới id formSubmit trong form
						$('#formSubmit').submit();
					}
					
				}
			});
		});
      </script>
</body>
</html>