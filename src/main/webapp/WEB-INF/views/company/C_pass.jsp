<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/cheader.jsp"%>

<!-- Main content -->
<div class="col-md-9">
		<div class="row">
			<label><h2>&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 변경</h2></label>
		</div>	
		<h4>&nbsp;8~32자의 영문 대문자, 소문자, 숫자, 특수문자를 조합하여 비밀번호를 사용하실 수 있습니다.
		<br><br>
        &nbsp;개인정보 보호를 위해 <b>6개월마다 주기적으로 비밀번호를 변경</b>해 사용하는 것이 안전합니다.
        <br><br>
        <code>※ 여러 사이트에 동일한 비밀번호를 사용하면 도용되기 쉬우므로 비밀번호를 주기적으로 변경해 주는 것이 안전합니다.</code>
        <br><br>
        </h4>
        <div class="row">
			<div class="form-group col-lg-6">
				<label>현재 비밀번호</label> <input type="text" name="phone"
					class="form-control" id="" value="${CInfoVO.phone}">
			</div>
			<div class="form-group col-lg-6">
				<label>비밀번호</label> <input type="text" name="email"
					class="form-control" id="" value="${CInfoVO.email}">
			</div>
			
			<div class="form-group col-lg-6">
				<label>비밀번호 확인</label> <input type="text" name="email"
					class="form-control" id="" value="${CInfoVO.email}">
			</div>
	
		</div>
		
		  <h4 style="font-weight: bold; color: #666;">비밀번호 이렇게 작성하세요.</h4>
              
                <li>영문, 숫자, 특수문자를 모두 조합하여 비밀번호를 만드는 것이 가장 안전합니다.</li>
                <li>아이디와 동일한 비밀번호는 사용할 수 없습니다.</li>
                <li>영문만, 숫자만, 특수문자만 이용하여 만든 비밀번호는 사용할 없습니다.(예: saramin, 022025)</li>
                <li>3자리 이상 반복되는 숫자, 영문, 특수문자는 비밀번호로 사용할 수 없습니다.(111,aaa,!!!)</li>
                <li>3자리 이상 연속되는 숫자, 영문, 특수문자는 비밀번호로 사용할 수 없습니다.(123,abc, !@#)</li>
                <li>비밀번호 변경 시 현재 사용중인 비밀번호를 재사용하실 수 없으며 다른 비밀번호로 변경하셔야 합니다.</li>
              
		
				
	
</div>

<%@include file="../include/cfooter.jsp"%>