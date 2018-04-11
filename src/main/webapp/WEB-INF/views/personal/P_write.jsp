<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/pheader.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/rpjt/datepicker/datepicker3.css" />
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
	src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

<style>
.popover{
    max-width: 80%;
}
</style>

<div class="col-md-9">
	<h1>${PUserVO.pname}님의이력서 작성</h1>

	<form role="form" method="post">
		<input type='hidden' name='id' value="${PUserVO.id}"> <input
			type='hidden' name='userid' value="${PUserVO.id}">
		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" id="title" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[제목 예시]</b>"
				data-content="안녕하십니까! 준비된 IT인재 박장옥입니다." name="title" value="${ResumeVO.title}" required>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th style="text-align : center; vertical-align : middle;" class="table-active" scope="row"><label for="pname">이름</label>
						</th>
						<td class="col-sm-4"><input type="text" class="form-control"
							id="pname" name="pname" value="${PUserVO.pname}" readonly>
						</td>
						<th style="text-align : center; vertical-align : middle;" rowspan="3" class="table-active" scope="row"><label
							for="img">사진</label></th>
						<td style="overflow-y:hidden;" rowspan="3" class="col-sm-4">
							<div id='uploadedList'
								style='width: 127px; height: 152px; border: 1px solid #c0c6d3;'>
								<p style="text-align : center; vertical-align : middle;"><br><br>(사 진)<br><br> 권장 사이즈 : <br>(235 x 315 pixel)</p>
								<img id='imgsrc' height="150px;" alt="${ResumeVO.img}" />
							</div> <!--  사진 보이는 div  --> <input type='hidden' id='imgsrccheck'
							value="${ResumeVO.img}" /> <!-- db에 있는 file img 이름 받아오는 hidden input -->
							<input type='hidden' id='uploadfilename' name='img' value=''>
							<!-- db에 올라갈 file img 이름 받아오는 hidden input --> <br> <input
							type='file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
							<!--파일 업로드 하는 버튼--> <input type='hidden' id='xornot' value='0'>
						</td>
					</tr>
					<tr>
						<th style="text-align : center; vertical-align : middle;" class="table-active" scope="row"><label>생년월일</label></th>
						<td>
							<div class="form-group">
								<input type="text" class="form-control" id="birth" name="birth"
									value="${PUserVO.birth}" readonly>
							</div>
						</td>
					</tr>
					<tr>
						<th style="text-align : center; vertical-align : middle;" class="table-active" scope="row"><label for="email">이메일</label></th>
						<td>
							<div class="form-group">
								<input type="text" class="form-control" id="email" name="email"
									value="${PUserVO.email}" readonly>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<hr style="border: solid 4px #ccc;">
		<h4>
			<b>연락처 목록</b>
		</h4>
		<div id="tel_div"></div>
		<hr style="border: solid 4px #ccc;">
		
		
		<!--j.code 03/26 : 6개(구직상태, 모집직종(대/소), 희망근무형태, 희망근무지(시/도, 시/군/구), 희망연봉) 입력 추가-->
		<div style="overflow-y:hidden;" class="table-responsive">
         <table  class="table table-bordered">
            <tbody>
                <tr>
                  <th style="text-align : center; vertical-align : middle;">구직상태</th>
                  <td>
                     <div class="form-group col-md-5">
                     <select id="jobstateid" class="form-control" data-live-search="true" name="jobstateid" > 
                        <option value="102">선택</option>
                        <c:forEach items="${CodeVOlist }" var="CodeVO">
                           <c:if test="${CodeVO.tid == 6 }">
                              <option value="${CodeVO.id }"> ${CodeVO.career } </option>
                           </c:if>
                        </c:forEach>
                     </select>
                  </div>
               </td>
               </tr>
               
              <tr>
                <th style="text-align : center; vertical-align : middle;">모집직종</th>
               <td>
                  <div class="form-group col-md-5" style="border: 1px; float: left; width: 30%;">
                  <label for="jobgroupid">대분류</label> 
                     <select style="height:5;" data-size="5" id="jobGroup" class="form-control" data-live-search="true" name="jobgroupid" >
                        <option value="0">선택</option>
                        <c:forEach items="${JobGroupVOlist}" var="JobGroupVO">
                           <c:if test="${JobGroupVO.id2 == 0}">
	                           <c:if test="${JobGroupVO.id>0 }">
	                          	 <option value="${JobGroupVO.id}">${JobGroupVO.jobgroup}</option>
			                   </c:if>
                           </c:if>
                        </c:forEach>
                     </select>          
                  </div>
                  <div style="float: left; width: 30%;">
                  <label for="jobgroupid">소분류</label> 
                     <select id="subjobGroup" class="form-control" data-live-search="true" name="jobgroupid2">
                     </select>
                  </div>
               </td>
            </tr>
            
            <tr>
               <th style="text-align : center; vertical-align : middle;">희망근무형태</th>
               <td>
                  <div class="form-group col-md-5">
                  <!-- <label for="CodeList4">희망근무형태</label> -->
                     <select class="form-control" data-live-search="true" name="employstatusid" id="employstatusid"> 
                        <option value="102">선택</option>
                        <c:forEach items="${CodeVOlist }" var="CodeVO">
                           <c:if test="${CodeVO.tid == 4 }">
                              <option value="${CodeVO.id }">${CodeVO.career }</option>
                           </c:if>
                        </c:forEach>
                     </select> 
                  </div>
               </td>
            </tr>
            
            <tr>
                   <th style="text-align : center; vertical-align : middle;">희망근무지</th>
               <td>
                  <div class="form-group col-md-5" style="border: 1px; float: left; width: 30%;">
                     <label for="jobgroupid">시/도</label> 
                        <select id="region" class="form-control" name='rgbid' data-live-search="true">
                           <c:forEach items="${RegionVOlist}" var="RegionVO">
                              <option value="${RegionVO.rgbid}">${RegionVO.rgbname}</option>
                           </c:forEach>
                        </select>
                  </div>
                  <div style="float: left; width: 30%;">
                     <label for="jobgroupid">시/군/구</label> 
                     <select id="subRegion" class="form-control" name='rgsid' data-live-search="true">
                     </select>
                  </div>
               </td>
            </tr>
            
            <tr>
                   <th style="text-align : center; vertical-align : middle;">희망연봉</th>
               <td>
                  <div class="form-group col-md-5">
                     <!-- <label for="CodeList7">희망연봉</label> -->
                     <select class="form-control" name="salaryid" id="CodeList7" data-live-search="true">
                        <option value="102">선택</option>
                        <c:forEach items="${CodeVOlist }" var="CodeVO">
                           <c:if test="${CodeVO.tid == 7 }">
                              <option value="${CodeVO.id }"> ${CodeVO.career } </option>
                           </c:if>
                        </c:forEach>
                     </select>
                  </div>
               </td>
            </tr>
            
             </tbody>
         </table>
          </div>
        <!--j.code 04.03 6개(구직상태, 모집직종(대/소), 희망근무형태, 희망근무지(시/도, 시/군/구), 희망연봉) 입력 추가 끝--> 
		
		<hr style="border: solid 4px #ccc;">
		
		
		<div style="font-size:18px;" class="form-group col-md-2"><b>학력 사항</b></div>
		<div class="form-group col-md-2"><label for="edustatus">최종학력</label>
		</div>
		<div class="form-group col-md-3">
			<select class="selectpicker form-control" name=levelofeducation id="CodeList2" data-live-search="true">
	          <option value="102">선택</option>
	          <c:forEach items="${CodeVOlist }" var="CodeVO">
	             <c:if test="${CodeVO.tid == 2 }">
	             	<c:if test="${CodeVO.id<=13 }">
	                	<option value="${CodeVO.id }"> ${CodeVO.career} </option>
	             	</c:if>
	             </c:if>
	          </c:forEach>
	       </select>
	     </div>
		<div id="edu_div"></div>
		<hr style="border: solid 4px #ccc;">
		<div style="font-size:18px;" class="form-group col-md-2"><b>경력 사항</b></div>
		<div class="form-group col-md-2"><label for="career">경력</label>
		</div>
		<div class="form-group col-md-3">
		<select class="selectpicker form-control" name=lastcareer id="CodeList1" data-live-search="true">
		<option value="102">선택</option>
          <c:forEach items="${CodeVOlist }" var="CodeVO">
             <c:if test="${CodeVO.tid == 1 }">
	             <c:if test="${CodeVO.id<=7 }">
	                <option value="${CodeVO.id }"> ${CodeVO.career} </option>
	             </c:if>
             </c:if>
          </c:forEach>
     	</select>
        </div>
		<div id="exp_div"></div>
		<!-- end of r.code -->
		<hr style="border: solid 4px #ccc;">
		<h4>
			<b>사이트 목록</b>
		</h4>
		<div id="web_div"></div>
		<hr style="border: solid 4px #ccc;">
		<h4>
			<b>보유 자격증 목록</b>
		</h4>
		<div id="license_div"></div>
		<hr style="border: solid 4px #ccc;">
		<h4>
			<b>어학 능력(자격증) 목록</b>
		</h4>
		<div id="language_div"></div>
		<hr style="border: solid 4px #ccc;">

		<div class="table-responsive">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="table-active" colspan="5" scope="row"
							style="text-align: center;">자기소개서</th>
					</tr>
					<tr>
						<td colspan="5" rowspan="2">
							<div class="form-group">
								<textarea class="form-control" rows="13" id="coverletter"
									name="coverletter" style="resize: none;"
									data-toggle="popover"
									data-html="true"
									title="<b>[자기소개서 예시]</b>"
									data-trigger="hover" data-placement="auto top" 
									data-content="
<pre style='font-family: 나눔;'>
[나는 불꽃이다] 
전기의 대중화를 가져온 마이클 패러데이는 
‘양초의 불꽃은 어둠 속에서도 빛을 발하지만,다이아몬드는 불꽃이 없으면 결코 빛날 수 없다.`고 했습니다.
저의 목표는 이러한 불꽃이 되어 모든 사람을 도와줄 수 있는 서비스를 만드는 것으로,
안정적이고 만족도가 높은 서비스를 제작하기 위해 2가지의 경쟁력을 꾸준히 키워 왔습니다. 

[첫째, 많은 IT 관련 활동] 
대학 4학년, 에너지 해커톤에 참가하여 사용전력량을 확인할 수 있는 APP을 제작하여 대상을 획득했습니다. 
또한, Linking 동아리 팀장을 맡아 리더십을 발휘해 삼성 S/W활동 우수팀으로 상장을 받기도 했고,
넓은 IT 지식을 쌓아 교내 학술 대회에서 우수상을 획득하였습니다.
이러한 IT 관련 경험은 입사 후에 빠른 조직 시스템 인지 및 융화를 통해 시너지를 낼 수 있다고 생각합니다. 

[둘째, 탄탄한 DB 지식] 
모든 프로그램은 데이터를 사용하고 개인 정보를 다루는 부분이 많으므로 데이터를 처리하는 기술이 중요하다고 생각합니다.
그래서 OCP DBA-10g 자격을 획득하여 DB 지식을 함양해 이를 바탕으로 Oracle을 이용한 안전성이 높은 POS system을 제작하였습니다.
이러한 DB지식은 제작 프로그램의 안전성을 높이는 데 도움을 줄 것입니다. 
이러한 잠재력을 가지고 귀사에 비전을 제시할 수 있는 불꽃이 되겠습니다.
<br>
출처 : http://www.jobkorea.co.kr/company/1976007/PassAssay/View?
Job_Epil_No=167260&Part_Code=0&Search_Order=1&Page=1"></textarea>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<button id="write-success" class="btn btn-success col-md-offset-10"
			type="button">등록</button>
		<button id="write-cancel" class="btn btn-danger"
			onClick="javascript:self.location='/personal/manage?id=${PUserVO.id}';"
			type="button">취소</button>
	</form>
</div>
<!-- 소연 모달 -->
	<div class="modal" id="ORIGINAL_modal">
		<div class="modal-dialog modal-dialog-centered">
			
			<div class="modal-content modal-dialog-centered">
				<div class="modal-head" style="text-align:center; vertical-align : middle; margin:10px;">
				<br>
					<button type="button" class="close" data-dismiss="modal" style="margin:10px;">&times;</button>
					이미지 크게 보기
				</div>
			
				<div class="modal-body modal-dialog-centered">
					
					<!--x표시 누르면 창 사라지게 하는 코드 -->
					<div class="row" style="border: solid 3px #ccc; padding:10px; margin:10px;">
						<img id="modal_get_Imgname1" style="width: 100%; height: auto;">
					</div>
				</div>
				<!--//class="modal-body"  -->
			</div>
			<!--//class="modal-content"-->
		</div>
		<!--//modal-dialog -->
	</div>
	<!-- 소연 코드 -->

<script id="template_tel" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">

	<input type="hidden" class="form-control telid" value="{{telid}}"></input>
	<input type="hidden" class="form-control rid telclass" name="ptelvolist[].rid" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="teltitle">전화번호 (종류)</label> 
		<input class="form-control teltitle telclass" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[전화번호(종류) 예시]</b>"
		data-content=" - 개인 핸드폰<br> - 집전화" name="ptelvolist[].teltitle" value="{{teltitle}}"></input>
	</div>
	
	<div class="form-group col-md-4">
		<label for="tel">전화번호</label> 
		<input class="form-control tel telclass" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[전화번호 예시]</b>"
		data-content=" 010-1234-5678" name="ptelvolist[].tel" value="{{tel}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label>라벨 추가/삭제</label>
		<br>
		<button class="btn btn-default btn-sm tel_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm tel_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>

<script id="template_edu" type="text/x-handlebars-template">
<div class="row"><!-- 첫번째는 hidden 시키기 -->

	<hr class="form-group col-md-12" style="border: solid 0.5px #ccc;">
	<input class="edu" type="hidden" name="listEdu[].resumenum" value="{{resumenum}}">
	
	<div class="form-group col-md-3">
		<label>입학일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control enterdate edu edudates" onchange="myfunction1();" name="listEdu[].enterdate" value="{{enterdate}}"> 
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	
	<div class="form-group col-md-3">
		<label>졸업일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control gradudate edu edudates" onchange="myfunction1();" name="listEdu[].gradudate" value="{{gradudate}}"> 
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>

	<div class="form-group col-md-3" >
		<label for="schoolname">학교명(학위)</label> 
		<input style="font-family:나눔;" class="form-control schoolname edu" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[학교명/학위 예시]</b>"
		data-content="부산대학교(석사)<br> 인하대학교(박사)" name="listEdu[].schoolname" value="{{schoolname}}"></input>
	</div>
	
	<div class="form-group col-md-3">
		<label for="major">학과</label> 
		<input style="font-family:나눔;" class="form-control major edu" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[학과 예시]</b>"
		data-content="전자공학과<br> 기계공학과" name="listEdu[].major" value="{{major}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label for="edustatus">졸업상태</label>
		<select class="form-control edustatus edu" name="listEdu[].edustatus">
			{{#select edustatus}}
			<option value="102">선택</option>
			<option value="15">재학</option>
			<option value="16">졸업</option>
			<option value="17">중퇴</option>
			<option value="18">졸업예정</option>
			<option value="19">휴학</option>
			{{/select}}
		</select>
	</div>
	
	<div class="form-group col-md-2">
		<label>추가/삭제</label><br />
		<button class="btn btn-default btn-sm edu_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>

		<button class="btn btn-default btn-sm edu_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
</script>

<script id="template_exp" type="text/x-handlebars-template">
<div class="row">
	<input class="career" type="hidden" name="listCareer[].resumenum" value="{{resumenum}}">

	<hr class="form-group col-md-12" style="border: solid 0.5px #ccc;">
	<div class="form-group col-md-3">
		<label>입사일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control career careerdates" name="listCareer[].startjob" value="{{startjob}}"> 
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label>퇴사일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control career careerdates" name="listCareer[].finishjob" value="{{finishjob}}"> 
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label for="cname">회사명</label>
		<input class="form-control career" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[회사명 예시]</b>"
		data-content="골드비 <br> 구글 본사(캘리포니아)" name="listCareer[].cname" value="{{cname}}"></input>
	</div>
	<div class="form-group col-md-3">
		<label for="jobdescription">담당업무</label>
		<input class="form-control career" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[담당업무 예시]</b>"
		data-content="Spring 웹 개발 <br> 구글 글래스 개발 " name="listCareer[].jobdescription" value="{{jobdescription}}">
		</input>
	</div>
	<div class="form-group col-md-3">
		<label for="salary">연봉</label>
		<select class="form-control career" name="listCareer[].salary">
			{{#select salary}}
			<option value="102">선택</option>
			<option value="34">~ 2,000</option>
			<option value="35">2,000 ~ 2,500</option>
			<option value="36">2,500 ~ 3,000</option>
			<option value="37">3,000 ~ 3,500</option>
			<option value="38">3,500 ~ 4,000</option>
			<option value="39">4,000 ~ 4,500</option>
			<option value="40">4,500 ~ 5,000</option>
			<option value="41">5,000 ~ 6,000</option>
			<option value="42">6,000 ~ 6,500</option>
			<option value="43">6,500 ~ 7,000</option>
			<option value="44">7,000 ~ 7,500</option>
			<option value="45">7,500 ~ 8,000</option>
			<option value="46">8,000 ~ 8,500</option>
			<option value="47">8,500 ~ 9,000</option>
			<option value="48">9,000 ~ 9,500</option>
			<option value="49">9,500 ~ 10,000</option>
			<option value="50">10,000 ~ 10,500</option>
			<option value="51">10,500 ~</option>
			{{/select}}
		</select>
	</div>
	<div class="form-group col-md-2">
		<label>추가/삭제</label><br/>
		<button class="btn btn-default exp_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default exp_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>

<script id="template_web" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control webid" value="{{webid}}"></input>
	<input type="hidden" class="form-control webclass rid" name="pwebsitesvolist[].rid" value="{{rid}}"></input>

	<div class="form-group col-md-3">
		<label for="webtitle">사이트 (종류)</label> 
		<input style="text-align:center;" class="form-control webtitle webclass" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[사이트(종류) 예시]</b>"
		data-content="Git <br> 블로그" name= "pwebsitesvolist[].webtitle" value="{{webtitle}}"> </input>
	</div>

	<div class="form-group col-md-4">
		<label for="webadd">사이트 주소</label> 
		<input style="text-align:center;" class="form-control webadd webclass" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[사이트 주소 예시]</b>"
		data-content="github.com/LovelyMoonpeel <br> blog.naver.com/lovelymoonpeel" name="pwebsitesvolist[].webadd" value="{{webadd}}"></input>
	</div>

	<div class="form-group col-md-2">
		<label>추가/삭제</label><br />
		<button class="btn btn-default btn-sm web_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm web_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>
<script id="template_license" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control licenseid" value="{{licenseid}}"></input>
	<input type="hidden" class="form-control rid licenseclass" name="rlicensevolist[].rid" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="licensename">자격증명</label> 
		<input class="form-control licensename licenseclass"  data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[자격증명 예시]</b>"
		data-content="정보처리기사<br> DASP" name="rlicensevolist[].licensename" value="{{licensename}}"></input>
	</div>

	<div class="form-group col-md-3">
		<label for="publeoffice">발급기관</label> 
		<input class="form-control publeoffice licenseclass" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[발급기관 예시]</b>"
		data-content="한국산업인력공단<br> kdb 한국 데이터베이스 진흥원" name="rlicensevolist[].publeoffice" value="{{publeoffice}}"></input>
	</div>
	
	<div class="form-group col-md-3">
		<label for="acquidate">취득일자</label> 
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="input-group date form-control acquidate licenseacquidate licenseclass" name="rlicensevolist[].acquidate" value="{{acquidate}}">
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
	</div>

	<div class="form-group col-md-2 license_button">
		<label>추가/삭제</label><br/>
		<button class="btn btn-default btn-sm license_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm license_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>

</div>
<!-- end of row -->
</script>

<script id="template_language" type="text/x-handlebars-template">
<div class="row">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control resumelangid" value="{{resumelangid}}"></input>
	<input type="hidden" class="form-control rid langclass" name="rlangvolist[].rid" value="{{rid}}"></input>

	<div class="form-group col-md-2">
		<label for="lid">언어 선택</label>
		<select class="form-control lid langclass" name="rlangvolist[].lid" value="{{lid}}>
			{{#select lid}}
			<option value="102">선택</option>
			<option value="102" selected>선택</option>
			<option value="52">영어</option>
			<option value="53">일본어</option>
			<option value="54">중국어</option>
			<option value="55">그리스어</option>
			<option value="56">네덜란드어</option>
			<option value="57">노르웨이어</option>
			<option value="58">독일어</option>
			<option value="59">러시아어</option>
			<option value="60">루마니아어</option>
			<option value="61">마인어</option>
			<option value="62">몽골어</option>
			<option value="63">미얀마어</option>
			<option value="64">베트남어</option>
			<option value="65">세르비아어</option>
			<option value="66">스웨덴어</option>
			<option value="67">스페인어</option>
			<option value="68">슬로바키아어</option>
			<option value="69">아랍어</option>
			<option value="70">유고어</option>
			<option value="71">이란(페르시아어)</option>
			<option value="72">이탈리아어</option>
			<option value="73">체코어</option>
			<option value="74">태국어</option>
			<option value="75">터키어</option>
			<option value="76">포르투갈어</option>
			<option value="77">폴란드어</option>
			<option value="78">프랑스어</option>
			<option value="79">헝가리어</option>
			<option value="80">히브리어</option>
			<option value="81">히브리어</option>
			<option value="82">그 외</option>
			{{/select}}
		</select>
	</div>
	
	<div class="form-group col-md-3">
		<label for="test">공인인증시험명</label> 
		<input class="form-control test langclass" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[공인인증시험명 예시]</b>"
		data-content="TOEIC<br> TOEIC speaking" name="rlangvolist[].test" value="{{test}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label for="score">점수</label> 
		<input class="form-control score langclass" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[점수 예시]</b>"
		data-content="990<br> level 7" name="rlangvolist[].score" value="{{score}}"></input>
	</div>
	<div class="form-group col-md-3">
		<label for="publeoffice">발급기관</label> 
		<input class="form-control publeoffice langclass" data-toggle="popover" data-html="true" data-trigger="hover" data-html="true" data-placement="auto top" title="<b>[발급기관 예시]</b>"
		data-content="한국토익위원회" name="rlangvolist[].publeoffice" value="{{publeoffice}}"></input>
	</div>
	<div class="form-group col-md-3">
		<label for="acquidate">취득일자</label> 
		<div class="input-group date" data-provide="datepicker">
				<input type="text" class="input-group date form-control acquidate languageacquidate langclass"  name="rlangvolist[].acquidate" value="{{acquidate}}">
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-2">
		<label>추가/삭제</label><br/>
		<button class="btn btn-default btn-sm lang_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm lang_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>
<script type='text/javascript'>


k=1;

function myfunction1(){
	console.log("fkq"+k);
	k++;
	console.log(k);
	//마지막꺼만 되는 문제
	$(".enterdate").each(function(index){
		var ss=$(this).val();
		enter_sp=ss.split("-");
		enterdate_index = index;
	});
	$(".gradudate").each(function(index){
		var ss=$(this).val();
		gradu_sp=ss.split("-");
		gradudate_index = index;
	});
	if(gradu_sp[2]!=""&&k%3==0){
		k=1;
		var enterdate_cp = new Date(enter_sp[0], enter_sp[1], enter_sp[2]);
		var gradudate_cp = new Date(gradu_sp[0], gradu_sp[1], gradu_sp[2]);
		if (enterdate_cp >= gradudate_cp) {
			alert("유효하지 않은 값입니다. 다시 입력해주세요");
			//$(".enterdate:eq("+enterdate_index+")").val("");
			$(".gradudate:eq("+gradudate_index+")").val("");
		} else {
		    
		}
	}
	
}


/* function mydateFunction(val){
	console.log("this index" + val);
	var ss=val.split("-");
	console.log(ss[0]);
	console.log(ss[1]);
	console.log(ss[2]);
	//console.log("얍1"+val.substr(0,4));
	//console.log("얍2"+val.substr(5,5));
	//console.log("얍3"+val.substr(8));
	
	
}
function mydateFunction2(val){
	console.log("this index" + val);
	var ss=val.split("-");
	console.log(ss[0]);
	console.log(ss[1]);
	console.log(ss[2]);
	//console.log(val.substr(7));
} */
/* $(".tel_minus_btn").each(function(){
	console.log("$('.tel_minus_btn').index()"+$(".tel_minus_btn").index());
	if($(".tel_minus_btn").index()==3){
		$(this).siblings('label').text("추가");
		$(this).hide();
	}
});

var edudates = document.getElementsByClassName('edudates');
   
edudates.onchange = function (e) {
	 var enterdate = document.getElementsByClassName("edudates")[index%2==0];
	 var gradudate = document.getElementsByClassName("edudates")[index%2==1];
	 list.getElementsByClassName("child")[0].innerHTML = "Milk";
}
 */ 
$(document).ready(function(){
	
	$(function () {
	    $('[data-toggle="popover"]').popover({
	    	container: 'body'
	    });
	});

	//소연 수정
    $("#region").val("Z").attr("selected", "selected"); //희망근무지
    $("#employstatusid").val("102").attr("selected", "selected"); //희망근무형태
    $("#jobstateid").val("102").attr("selected", "selected");//구직상태
    $("#CodeList7").val("102").attr("selected", "selected");//희망연봉
    $("#CodeList1").val("102").attr("selected", "selected");//최종경력
    $("#CodeList2").val("102").attr("selected", "selected");//최종학력
    
	//<!--j.code 03/22 : jobGroup, region 대분류고정시켜주는 작업-->
	var largeNum = $('#jobGroup option:selected').val();
	SubJobGroup2(largeNum);
	var largeNum2 = $('#region option:selected').val();
	SubRegion2(largeNum2);
	//<!--j.code 03/22 : jobGroup, region 대분류고정시켜주는 작업 끝-->
	
	Handlebars.registerHelper('select', function( value, options ){
        var $el = $('<select />').html( options.fn(this) );
        $el.find('[value="' + value + '"]').attr({'selected':'selected'});
        return $el.html();
    });
	
	var formObj = $("form[role = 'form']");
	
	function datepick() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy-mm-dd",
			language : "kr"
		});
	}
	
   $("#write-success").on("click", function(){
	   
	   if($('#title').val()==''){
		   alert("제목을 입력해주세요!");
		   return;
	   }else{
		   if($('#birth').val()==''){
				console.log("#birth.val()==''");
				$('#birth').val("0000-00-00");
			}
			$('.licenseacquidate').each(function(){ 
				if($(this).val()==''){
					console.log($(this).val());
					console.log(".licenseacquidate.val()==''");
					$(this).val("0000-00-00");
					console.log($(this).val());
				}
			});
			$('.languageacquidate').each(function(){ 
				if($(this).val()==''){
					console.log($(this).val());
					console.log(".languageacquidate.val()==''");
					$(this).val("0000-00-00");
					console.log($(this).val());
				}
			});
			$('.careerdates').each(function(){ 
				if($(this).val()==''){
					console.log($(this).val());
					console.log(".careerdates.val()==''");
					$(this).val("0000-00-00");
					console.log($(this).val());
				}
			});
			$('.edudates').each(function(){ 
				if($(this).val()==''){
					console.log($(this).val());
					console.log(".edudates.val()==''");
					$(this).val("0000-00-00");
					console.log($(this).val());
				}
			});
		   formObj.attr("action", "/personal/write");
	       formObj.attr("method", "post");
	       numberingList();
	       formObj.submit();
	   }
   });
   
   var upload = document.getElementById('fileupload');
   var uploadedList = document.getElementById('uploadedList');
   
	if (typeof window.FileReader === 'undefined') {
	 console.log("state.className = 'fail'");
	} else {
	 console.log("state.className = 'success'");
	}  //fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때
	
	upload.onchange = function (e) {
	
		 var file = upload.files[0];
		 var reader = new FileReader();
		 //p542다시 보기
	
		 //reader.onload start
		 reader.onload = function (event) {
			 var image = new Image();
			 image.src = event.target.result;
			  
			 uploadedList.innerHTML = '';
			 image.height = 150;
			 uploadedList.appendChild(image);
		 };//reader.onload end
		 
	 //img uploadedList에 추가 하는거 end //////////////////////////////////////////////////////////
	 //img 서버에 저장되도록 ajax start //////////////////////////////////////////////////////////  
			 event.preventDefault();
			 
			 console.log("file name");
			 console.log(file);
			 
			 var formData = new FormData();
			 
			 formData.append("file", file);
			 
			 $.ajax({
				 url : '/personal/uploadAjax',
				 data : formData,
				 dataType : 'text',
				 processData : false,
				 contentType : false,
 				 type : 'POST',
				 success : function(data){
					   var str = "";
					  
					 	console.log(data);
							  str = 
								  "<a id='ORIGINAL' style='cursor:pointer'><br>크게보기</a>"
								  +"<small style='cursor:pointer' data-src="+data+">X</small>";  

					  $("#uploadedList").append(str); 
					  $("#ORIGINAL").on("click", function(){
							console.log("ORIGINAL click");
							console.log(getImageLink(data));
							var src = "displayFile?fileName="+getImageLink(data);
							$("#ORIGINAL_modal").modal();
							$("#modal_get_Imgname1").attr("src", src);
						});
					  document.getElementById('uploadfilename').value = getImageLink(data);
				  }//success : function(data){ end
	 		  });//ajax end
		//});//filedrop end
	 console.log(file);
	 reader.readAsDataURL(file);
	};//upload change end
	
	$("#uploadedList").on("click", "small", function(event){
		event.preventDefault();
		var that = $(this);
		$("#fileupload").val("");
		$("#uploadedList").empty();
		$("#fileupload").val("");
		console.log("img File appended deleted");
		var fileName=$(this).attr("data-src");
		console.log(fileName);
		var uploadfilename = document.getElementById('uploadfilename');
		
		$.ajax({
			url:"deleteFile",
			type:"post",
			data : {fileName:$(this).attr("data-src")},
			dataType:"text",
			success:function(result){
				if(result=='deleted'){
					console.log("img File on server deleted");
					that.parent("div").remove();
					$('#uploadfilename').val('');
				}
			}
		});
	});
	
	function getOriginalName(fileName){
      	var idx = fileName.indexOf("_")+1;
      	return fileName.substr(idx);
    }
	function getImageLink(fileName){
      	var front = fileName.substr(0,12);
      	var end = fileName.substr(12);
      	
      	return front + end;
    }
	function numberingList() {
		$(".telclass").each(function(index){
			var num = 3;
			var name = $(this).attr("name");
			name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		});
		$(".edu").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 8) + parseInt(index/num) + name.substring(8);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		});
		$(".career").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		});
		$(".webclass").each(function(index){
			var num = 3;
			var name = $(this).attr("name");
			name = name.substring(0, 16) + parseInt(index/num) + name.substring(16);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
	 	$(".langclass").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 12) + parseInt(index/num) + name.substring(12);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
		$(".licenseclass").each(function(index){
			var num = 4;
			var name = $(this).attr("name");
			name = name.substring(0, 15) + parseInt(index/num) + name.substring(15);
			$(this).attr("name", name);
			console.log($(this).attr("name"));
		}); 
	}
	// tel 추가버튼 이벤트
	$("#tel_div").on("click", ".tel_plus_btn", function(){
		 var item = {
				rid : 0
			}; 
		add_tel(item);
	});
	// tel 삭제버튼 이벤트
	$("#tel_div").on("click", ".tel_minus_btn", function(){
		 var tel_index = $(".tel_minus_btn").index(this);  // 존재하는 tel_minus_btn를 기준으로 index
		 console.log(tel_index);
		 if(tel_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	// edu 추가버튼 이벤트
	$("#edu_div").on("click", ".edu_plus_btn", function(){
		var item = {
				resumenum : 0,
			};
		add_edu(item);
	});
	//edu minus 버튼 이벤트
	$("#edu_div").on("click", ".edu_minus_btn", function(){
		 var edu_index = $(".edu_minus_btn").index(this);  // 존재하는 edu_minus_btn를 기준으로 index
		 console.log(edu_index);
		 if(edu_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	// exp 추가버튼 이벤트
	$("#exp_div").on("click", ".exp_plus_btn", function(){
		var item = {
				resumenum : 0
			};
		add_exp(item);
	});
	//exp minus 버튼 이벤트
	$("#exp_div").on("click", ".exp_minus_btn", function(){
		 var exp_index = $(".exp_minus_btn").index(this);  // 존재하는 exp_minus_btn를 기준으로 index
		 console.log(exp_index);
		 if(exp_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//웹 추가 버튼 이벤트
	$("#web_div").on("click", ".web_plus_btn", function(){
		var item = {
				rid : 0
			}
		add_web(item);
	});
	//웹 삭제 버튼 이벤트
	$("#web_div").on("click", ".web_minus_btn", function(){
		 var web_index = $(".web_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 console.log(web_index);
		 if(web_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//자격증 추가 버튼 이벤트
	$("#license_div").on("click", ".license_plus_btn", function(){
		var item = {
				rid : 0
		}
		add_license(item);
	});
	//자격증 삭제 버튼 이벤트
	$("#license_div").on("click", ".license_minus_btn", function(){
		 var license_index = $(".license_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 console.log(license_index);
		 if(license_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//언어 추가 버튼 이벤트
	$("#language_div").on("click", ".lang_plus_btn", function(){
		var item = {
				rid : 0
			};
		add_language(item);
	});
	//언어 삭제 버튼 이벤트
	$("#language_div").on("click", ".lang_minus_btn", function(){
		var lang_index = $(".lang_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 console.log(lang_index);
		 if(lang_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	function add_tel(item) {
		var source_tel = $("#template_tel").html();
		var template_tel = Handlebars.compile(source_tel);
		$("#tel_div").append(template_tel(item));
		datepick();
	}
	function add_edu(item) {
		var source_edu = $("#template_edu").html();
		var template_edu = Handlebars.compile(source_edu);
		$("#edu_div").append(template_edu(item));
		datepick();
	}
	function add_exp(item) {
		var source_exp = $("#template_exp").html();
		var template_exp = Handlebars.compile(source_exp);
		$("#exp_div").append(template_exp(item));
		datepick();
	}
	function add_web(item) {
		var source_web = $("#template_web").html();
		var template_web = Handlebars.compile(source_web);
		$("#web_div").append(template_web(item));
		datepick();
	}
	function add_license(item) {
		var source_license = $("#template_license").html();
		var template_license = Handlebars.compile(source_license);
		$("#license_div").append(template_license(item));
		datepick();
	}
	function add_language(item) {
		var source_language = $("#template_language").html();
		var template_language = Handlebars.compile(source_language);
		$("#language_div").append(template_language(item));
		datepick();
	}
	function tel_list() {
		var item = {
				rid : 0,
				teltitle : "${PTelVO.teltitle}", 
				tel : "${PTelVO.tel}" 
				};
		add_tel(item);
	}
	function edu_list() {
		
		var item = {
				resumenum : 0,
				schoolname : "",
				major : "",
				enterdate : "",
				gradudate : "",
				edustatus : "",
			};
		add_edu(item);
	}
	
	function exp_list() {
		var item = {
				resumenum : 0,
				//cname : "${careerVO.cname}",
				cname : "",
				jobdescription : "",
				startjob : "",
				finishjob : "",
				salary : ""
			};
		add_exp(item);
	}		
	function web_list() {
		var item = {
				rid : 0,
				webtitle : "${PWebSiteVO.webtitle}", 
				webadd : "${PWebSiteVO.webadd}"
		}
		add_web(item);
	}
	function license_list() {
		var item = {
				rid :  0,
				licensename : "", 
				publeoffice : "",
				acquidate : ""
		};
		add_license(item);
	}
	function language_list() {
			var item = {
					rid :  0,
					lid : "",
					test : "", 
					score : "",
					publeoffice : "",
					acquidate : ""
			};
			add_language(item);
	}
	
	tel_list();
	edu_list();
	exp_list();
	web_list();
	license_list();
	language_list();
	
	minus_btn();
	
	function minus_btn(){
		$(".tel_minus_btn").each(function(){
			console.log("$('.tel_minus_btn').index()"+$(".tel_minus_btn").index());
			if($(".tel_minus_btn").index()==3){
				$(this).siblings('label').text("추가");
				$(this).hide();
			}
		}); 
		$(".edu_minus_btn").each(function(){
			console.log("$('.edu_minus_btn').index()"+$(".edu_minus_btn").index());
			if($(".edu_minus_btn").index()==3){
				$(this).siblings('label').text("추가");
				$(this).hide();
			}
		}); 
		$(".exp_minus_btn").each(function(){
			console.log("$('.exp_minus_btn').index()"+$(".exp_minus_btn").index());
			if($(".exp_minus_btn").index()==3){
				$(this).siblings('label').text("추가");
				$(this).hide();
			}
		}); 
		$(".web_minus_btn").each(function(){
			console.log("$('.web_minus_btn').index()"+$(".web_minus_btn").index());
			if($(".web_minus_btn").index()==3){
				$(this).siblings('label').text("추가");
				$(this).hide();
			}
		}); 
		$(".license_minus_btn").each(function(){
			console.log("$('.license_minus_btn').index()"+$(".license_minus_btn").index());
			if($(".license_minus_btn").index()==3){
				$(this).siblings('label').text("추가");
				$(this).hide();
			}
		}); 
		$(".lang_minus_btn").each(function(){
			console.log("$('.lang_minus_btn').index()"+$(".lang_minus_btn").index());
			if($(".lang_minus_btn").index()==3){
				$(this).siblings('label').text("추가");
				$(this).hide();
			}
		}); 
	}
});
</script>
<script>
//<!--j.code 03/22 : jobGroup, region 소분류 받는 작업-->
   function SubJobGroup2(largeNum) {
      $.getJSON("/companyAjax/jobGroup/" + largeNum, function(data) {
         var str = "";
         <c:set value="${ResumeVO.jobgroupid2}" var="select"/>
         var sel = '<c:out value="${select}"/>';
         var selected = "";
         
         $(data).each(
               function() {
                  if(sel==this.id){
                	  if(this.id==0){
                		 str += "<option value="+this.id+
                          " "+selected+">"+ "선택" + "</option>";
                	  }else{
	                     selected = "selected";
	                     str += "<option value="+this.id+
	                     " "+selected+">"+ this.jobgroup + "</option>";
                	  } 
                  }else{
                     selected = "";
                     str += "<option value="+this.id+
                     " "+selected+">"+ this.jobgroup + "</option>";
                  }
               });
         $("#subjobGroup").html(str);
      })
   }
   function SubRegion2(largeNum) {
      $.getJSON("/companyAjax/region/" + largeNum, function(data) {
         var str = "";
         <c:set value="${ResumeVO.rgsid}" var="sid"/>
         var selec = '<c:out value="${sid}"/>';
         var select = "";
         $(data).each(
               function() {
                  if(selec==this.rgsid){
                     select = "selected";
                  }else{
                     select = "";
                  }
                  str += "<option value="+this.rgsid+
                  " " + select + ">" + this.rgsname + "</option>";
               });
         $("#subRegion").html(str);
      })
   }
   $("#region").change(function() {
      var largeNum = $(this).val();
      SubRegion(largeNum)
   })
   $("#jobGroup").change(function() {
	   console.log("1026번째줄");
      var largeNum = $(this).val();
      SubJobGroup(largeNum);
   })
   function SubJobGroup(largeNum) {
	   console.log(largeNum);
      $.getJSON("/companyAjax/jobGroup/" + largeNum, function(data) {
    	  console.log("getJason");
         var str = "";
         $(data).each(
               function() {
                  str += "<option name='jobgruopid' value="+this.id+">"
                        + this.jobgroup + "</option>";
               });
         $("#subjobGroup").html(str);
      })
   }
   function SubRegion(largeNum) {
      $.getJSON("/companyAjax/region/" + largeNum, function(data) {
         var str = "";
         $(data).each(
               function() {
                  str += "<option name='rgsid' value="+this.rgsid+">" + this.rgsname
                        + "</option>";
               });
         $("#subRegion").html(str);
      })
   }
  // <!--j.code 03/22 : jobGroup, region 소분류 받는 작업 끝-->
</script>
<%@include file="../include/cfooter.jsp"%>