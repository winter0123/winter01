<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap CSS -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>폰번호 수정</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<style type="text/css">
	tr.row-name { font-size: 18px; color:#448aff; }
	tr.row-content {color:#6c7173;}
	table { border: 2px solid #F0F2F2; }
	</style>
</head>
<body>
<h2 style="color: #448aff; text-align: center; margin: 30px;"><b>전화번호 추가</b></h2>
<form method="POST" id="phonesave" name="phonesave">
<div class="container col-md-5" style="float: none; margin: 0 auto;"> <!-- container는 표를 가운데 정렬하기 위해서 -->
	<table class="table table-striped">
		<thead>
			<tr class="row-name">
				<input type="hidden" name="id" value="${user.id}">
				<th style="width:25%">User id</th>
				<th style="width:25%">User 이름</th>
				<th style="width:50%">전화번호</th>
			</tr>
		</thead>
		<tbody>
			<tr class="row-content">
				<td><input type="text" class="form-control" size="10px" value="${user.id}" readonly style="border:none;" ></td>
				<td><input type="text" class="form-control" size="10px" value="${user.name}" readonly style="border:none;" ></td>
				<td><input type="text" class="form-control" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' 
					size="15px" id="phoneNumber" name="phoneNumber" value="" style="border:none;" placeholder="숫자만 입력하세요"></td>
			</tr>
		</tbody>
	</table>
	<div style="float:right;">
		<button onClick='fn_add()' class="btn btn-info">추가완료</button>
	    <a href=<c:url value='/list'/> class="btn btn-info" role="button">목록</a>
	</div>
</div>
</form>

<script>
	//글쓰기
	function fn_add(){
	    var form = document.getElementById("phonesave");
	  form.action = "<c:url value='/phoneSave.html'/>";
	  form.submit();
	}
	//숫자만 입력받음(문자받은것 제거)
	function onlyNumber(event){
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			return false;
	}
	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
	}
</script>

</body>
</html>