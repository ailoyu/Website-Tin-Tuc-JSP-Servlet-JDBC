<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var ="NewURL" value="/admin-new"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href='<c:url value="/admin-home"/>'>Trang chủ</a>
                </li>
                <li class="active">Chỉnh sửa bài viết</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">
                       		<c:if test="${not empty messageResponse}">
								<div class="alert alert-${alert}">
  									${messageResponse}
								</div>
							</c:if>
						<form id="formSubmit">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Thể loại</label>
                                <div class="col-sm-9">
                                    <select class="form-control" id="categoryCode" name="categoryCode">
                                       <c:if test="${empty model.categoryCode}">
                                       		<option value="">Chọn loại bài viết</option>
	                                       <c:forEach var="item" items="${categories}">
	                                       		<option value="${item.code}">${item.name}</option>
	                                       </c:forEach>
                                       </c:if>
                                       <c:if test="${not empty model.categoryCode}">
                                       <option value="">Chọn loại bài viết</option>
	                                       <c:forEach var="item" items="${categories}">
	                                       		
<%-- 	                                       		<c:if test="${item.code == model.categoryCode }"> --%>
<%-- 	                                       			<option value="${item.code}" selected="selected">${item.name}</option> --%>
<%-- 	                                       		</c:if> --%>
<%-- 	                                       		<c:if test="${item.code != model.categoryCode }"> --%>
<%-- 	                                       			<option value="${item.code}">${item.name}</option> --%>
<%-- 	                                       		</c:if> --%>
														
													<option value="${item.code}" 
										<c:if test="${item.code == model.categoryCode }">selected="selected"</c:if> >${item.name}</option>
	                                       </c:forEach>
	                                       
                                       </c:if>
                                    </select>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="title" name="title" value="${model.title }"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="thumbnail" name="thumbnail" value="${model.thumbnail }"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="shortDescription" name="shortDescription" value="${model.shortDescription}"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                                <div class="col-sm-9">     
                                    <textarea rows="" cols="" id="content" name="content" style="width: 816px;height: 196px">${model.content }</textarea>
                                </div>
                            </div>
                             <br/>
                            <br/>
                            <div class="form-group">
                                <div class="col-sm-12">                      
                                	<c:if test="${ model.id != null }">
                                		<input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật bài viết" id="btnAddOrUpdateNew"/>
                                	</c:if>           
                                  <c:if test="${empty model.id }">
                                  		<input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm mới bài viết" id="btnAddOrUpdateNew"/>
                                  </c:if>
                                </div>
                            </div>
                            <input type="hidden" value="${model.id }" id="id" name="id" />
                            </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	var editor = '';
	$(document).ready(function(){ // hàm này tương tự như hàm main -> 
		// logic trong hàm này chạy đầu tiên
		editor = CKEDITOR.replace('content'); // lấy cleditor gắn vào textarea có id là content
	});

	// Khi mà nhấn nút
	$('#btnAddOrUpdateNew').click(function(e) { // bấm nút -> call api
		// để submit vào url api, 
		// cần gọi e.preventDefault() để ko submit nhầm vào url hiện tại
		e.preventDefault(); 
		
		// lấy giá trị trong các ô field trong form 
// 		var title = $('#title').val();
// 		var categoryCode = $('#categoryCode').val();
// 		var shortDescription = $('#shortDescription').val();
// 		var content = $('#content').val();
// 		var thumbnail = $('#thumbnail').val();
		
		// lấy giá trị trong các ô field trong form bằng mảng (dùng id của form)
		// lấy hết name trong form
		var formData = $('#formSubmit').serializeArray();
		var data = {};
		
		// vòng foreach lấy giá trị trong mảng của jquery
		// lấy name và value của từng ô field
		$.each(formData, function(i, v) { // i: index ; v: value
			data[""+v.name +""] = v.value;
			// sau đó mapping name và value vào NewModel
		});
		
		// lấy riêng dữ liệu trong ckeditor ra
		data["content"] = editor.getData();
		
		
		// Gửi id về server 
		var id = $('#id').val();
		if(id == ""){
			addNew(data);
		}else {
			updateNew(data);
		}
	});
	function addNew(data) {
		// dùng ajax để gửi data qua restful api
		$.ajax({
			url: '${APIurl}', // link api
			type: 'POST', // Phương thức muốn gọi trong API
			contentType: 'application/json', // Gửi dữ liệu kiểu JSon
			data: JSON.stringify(data), //chuyển kiểu javaScript Object từ mảng data -> JSon
			dataType: 'json', // nhận dữ liệu json từ server trả về client
			success: function (result) { // result là đối tượng newModel từ server qua
				window.location.href = "${NewURL}?type=edit&id="+result.id+"&message=insert_success";	
			},
			error: function (error) {
				window.location.href = "${NewURL}?type=list&page=1&maxPageItem=5&sortName=title&sortBy=desc&message=error_system";	
			}
		});
	}
	
	function updateNew(data) {
		$.ajax({
			url: '${APIurl}', // link api
			type: 'PUT', // Phương thức muốn gọi trong API
			contentType: 'application/json', // Gửi dữ liệu kiểu JSon từ client -> server
			data: JSON.stringify(data), // chuyển kiểu javaScript Object từ mảng data -> JSon
			dataType: 'json', // nhận dữ liệu json từ server -> client
			success: function (result) {// result là đối tượng newModel từ server qua
				window.location.href = "${NewURL}?type=edit&id="+result.id+"&message=update_success";	
			},
			error: function (error) {
				window.location.href = "${NewURL}?type=list&page=1&maxPageItem=5&sortName=title&sortBy=desc&message=error_system";
			}
		});
	}
</script>

</body>
</html>