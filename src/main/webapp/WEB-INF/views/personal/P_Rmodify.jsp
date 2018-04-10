<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>   
<%@include file="../include/pheader.jsp"%>

<link rel="stylesheet" type="text/css" href="/resources/rpjt/datepicker/datepicker3.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="/resources/rpjt/datepicker/bootstrap-datepicker.kr.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<div class="col-md-9">
	<h1>${PUserVO.id}님의 이력서 수정</h1>
	<form role="form" method="post">
	 	<input type="text" class="form-control" id="bno" name="bno" value="${ResumeVO.bno}" readonly>
		<br>	
		<div class="form-group">
			<label for="title">제목</label> <input class="form-control" id="title" name="title" value="${ResumeVO.title}">
		</div>
      	<div class="table-responsive">
         <table class="table table-bordered">
            <tbody>
               <tr>
                <th class="table-active" scope="row"><label for="pname">이름</label> </th>
	          	<td class="col-sm-4">
	           		<input type="text" class="form-control" id="pname" name="pname" value="${PUserVO.pname}" readonly>
	           	</td>
                <th rowspan = "3" class="table-active" scope="row"><label for="img">사진</label></th>
						<td rowspan="3" class="col-sm-4">
							<div id='uploadedList' style='width: 127px; height: 152px; border: 1px dotted #c0c6d3;'>
								<img id='imgsrc' height="150px;" alt="${ResumeVO.img}" />
							</div> 
							<!--  사진 보이는 div  --> 
							<input id='imgsrccheck' type='hidden' value="${ResumeVO.img}" /> 
							<!-- db에 있는 file img 이름 받아오는 hidden input -->
							<input type='hidden' id='uploadfilename' name='img' value='${ResumeVO.img}'> 
							<!-- db에 올라갈 file img 이름 받아오는 hidden input -->
							<br> 
							<input type='file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp"> 
							<!--파일 업로드 하는 버튼--> 
							
							<input type='hidden' id='xornot' value='0'>
							
							<input type='hidden' id='preexistenceimg' value='0'>
						</td>
					</tr>
               <tr>
                  <th class="table-active" scope="row"><label>생년월일</label></th>
                  <td>
                  	<div class="form-group">
						<input type="text" class="form-control" id="" name="birth" value="${PUserVO.birth}" readonly>
					</div>
				  </td>
			    </tr>
			  	<tr>
                  <th class="table-active" scope="row"><label for="email">이메일</label></th>
            	  <td>
				  	<div class="form-group">
					 <input type="text" class="form-control" id="email" name="email" value="${PUserVO.email}" readonly>
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
		
			<!--j.code 03/22 : select태그 테이블형태로 수정  -->
      <div class="table-responsive">
         <table class="table table-bordered">
            <tbody>
                <tr>
                  <th>구직상태</th>
                  <td>
                     <div class="form-group col-md-5">
                     <select id="jobstateid" class="form-control" name="jobstateid" >
                        <option value="102">선택</option>
                        <c:forEach items="${CodeVOlist }" var="CodeVO">
                           <c:if test="${CodeVO.tid == 6 }">
                              <option value="${CodeVO.id }" <c:if test="${CodeVO.id == ResumeVO.jobstateid }">selected</c:if> > ${CodeVO.career } </option>
                           </c:if>
                        </c:forEach>
                     </select>
                  </div>
               </td>
               </tr>
               
                 <tr>
                   <th>모집직종</th>
               <td>
                  <div class="form-group col-md-7" style="border: 1px; float: left; width: 30%; ">
                  <label for="jobgroupid">대분류</label> 
                  <select id="jobGroup" class="form-control" data-live-search="true" name="jobgroupid" >
                     <c:forEach items="${JobGroupVOlist}" var="JobGroupVO">
                        <c:if test="${JobGroupVO.id2 == 0}">
                           <option value="${JobGroupVO.id}" <c:if test="${JobGroupVO.id == ResumeVO.jobgroupid}">selected</c:if>>${JobGroupVO.jobgroup}</option>
                        </c:if>
                     </c:forEach>
                  </select>    
                  </div>
                  <div style="float: left; width: 30%; ">      
	              	  <label for="jobgroupid">소분류</label> 
	                  <select id="subjobGroup" class="form-control" data-live-search="true" name="jobgroupid2">
	                  </select>
                  </div>
               </td>
            </tr>
            
            <tr>
               <th>희망근무형태</th>
               <td>
                  <div class="form-group col-md-4">
                  <!-- <label for="CodeList4">희망근무형태</label> -->
                     <select class="form-control" name="employstatusid" id="employstatusid"> 
                        <option value="102">선택</option>
                        <c:forEach items="${CodeVOlist }" var="CodeVO">
                           <c:if test="${CodeVO.tid == 4 }">
                              <option value="${CodeVO.id }" 
                              <c:if test="${CodeVO.id == ResumeVO.employstatusid }">selected</c:if>
                              >${CodeVO.career }</option>
                           </c:if>
                        </c:forEach>
                     </select> 
                  </div>
               </td>
            </tr>
            <tr>
                   <th>희망근무지</th>
               <td>
                  <div class="form-group col-md-5" style="border: 1px; float: left; width: 30%; ">
                     <label for="regionid">시/도</label> 
                     <select id="region" class="form-control" name='rgbid'>
                        <c:forEach items="${RegionVOlist}" var="RegionVO">
                           <option value="${RegionVO.rgbid}" 
                           <c:if test="${RegionVO.rgbid == ResumeVO.rgbid}">selected</c:if>
                           >${RegionVO.rgbname}</option>
                        </c:forEach>
                     </select>
                  </div>
                  <div style="float: left; width: 30%; ">
                     <label for="regionid2">시/군/구</label> 
                     <select id="subRegion" class="form-control" name='rgsid'>
                     </select>
                  </div>
               </td>
            </tr>
            <tr>
                   <th>희망연봉</th>
               <td>
                  <div class="form-group col-md-5">
                     <!-- <label for="CodeList7">희망연봉</label> -->
                     <select class="form-control" name="salaryid" id="CodeList7">
                     	<option value="102">선택</option>
                        <c:forEach items="${CodeVOlist }" var="CodeVO">
                           <c:if test="${CodeVO.tid == 7 }">
                              <option value="${CodeVO.id }" 
                              <c:if test="${CodeVO.id == ResumeVO.salaryid }">selected</c:if> > ${CodeVO.career } </option>
                           </c:if>
                        </c:forEach>
                     </select>
                  </div>
               </td>
            </tr>
             </tbody>
         </table>
          </div>
      <!--j.code 03/22 : select태그 테이블형태로 수정 끝  -->
     	<hr style="border: solid 4px #ccc;">
		<div style="font-size:18px;" class="form-group col-md-2"><b>학력 사항</b></div>
		<div class="form-group col-md-2"><label for="edustatus">최종학력</label></div>
		<div class="form-group col-md-3">
		<select class="form-control" name=levelofeducation id="CodeList2">
			<option value="102">선택</option>
			<c:forEach items="${CodeVOlist }" var="CodeVO">
				<c:if test="${CodeVO.tid == 2 }">
					<c:if test="${CodeVO.id<=13 }">
						<option value="${CodeVO.id }" <c:if test="${CodeVO.id == ResumeVO.levelofeducation}">selected</c:if> > ${CodeVO.career} </option>
					</c:if>
				</c:if>
			</c:forEach>
		</select>
		</div>
		<div id="edu_div"></div>
		
		<hr style="border: solid 4px #ccc;">
		<div style="font-size:18px;" class="form-group col-md-2"><b>경력 사항</b></div>
		<div class="form-group col-md-2"><label for="career">경력</label>	</div>
		<div class="form-group col-md-3">
		<select class="form-control" name="lastcareer" id="CodeList1">
			<option value="102">선택</option>
			<c:forEach items="${CodeVOlist }" var="CodeVO">
				<c:if test="${CodeVO.tid == 1 }">
					<c:if test="${CodeVO.id<=7 }">
						<option value="${CodeVO.id }" <c:if test="${CodeVO.id == ResumeVO.lastcareer}">selected</c:if> > ${CodeVO.career} </option>
					</c:if>
				</c:if>
			</c:forEach>
		</select>
		</div>
     	<div id="exp_div"></div>
		
		<!-- r.code 03/13 : 학력/경력 폼 수정-->
		<!-- end of r.code -->
	    <hr style="border: solid 4px #ccc;">
		<h4>
			<b>웹사이트 목록</b>
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
	               <th class="table-active" colspan="5" scope="row" style="text-align: center;">자기소개서</th>
	            </tr> 
	            <tr>
	             <td colspan="5" rowspan="2">
	               	<div class="form-group">
					<textarea class="form-control" rows="13" id="coverletter" name="coverletter" style = "resize:none;" required>${ResumeVO.coverletter}</textarea>
					</div>
	             </td>   
	            </tr>
	           </tbody>
	       </table>      
	    </div> 
  	</form>
		<button id="write-success" class="btn btn-success col-md-offset-10" type="submit">등록</button>
		<button id ="write-cancel" class="btn btn-danger" onClick="javascript:self.location='/personal/detail?bno=${ResumeVO.bno}';" type="button">취소</button>
</div>
<!-- 소연 모달 -->
<div class="modal" id="ORIGINAL_modal">
	<div class="modal-dialog modal-dialog-centered">

		<div class="modal-content modal-dialog-centered">
			<div class="modal-head"
				style="text-align: center; vertical-align: middle; margin: 10px;">
				<br>
				<button type="button" class="close" data-dismiss="modal"
					style="margin: 10px;">&times;</button>
				이미지 크게 보기
			</div>

			<div class="modal-body modal-dialog-centered">

				<!--x표시 누르면 창 사라지게 하는 코드 -->
				<div class="row"
					style="border: solid 3px #ccc; padding: 10px; margin: 10px;">
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
<div class="row tel_row_number">
	<hr style="border: solid 0.5px #ccc;">

	<input type="hidden" class="form-control telid" value="{{telid}}"></input>
	<input type="hidden" class="form-control rid telclass" name="ptelvolist[].rid" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="teltitle">전화번호 (종류)</label> 
		<input class="form-control teltitle telclass" name="ptelvolist[].teltitle" value="{{teltitle}}"></input>
	</div>
	
	<div class="form-group col-md-4">
		<label for="tel">전화번호</label> 
		<input class="form-control tel telclass" name="ptelvolist[].tel" value="{{tel}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label id="tel_label">추가/삭제</label>
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
<div class="row edu_row_number">
	<hr class="form-group col-md-12" style="border: solid 0.5px #ccc;">
	<div class="form-group col-md-3">
		<input class="edu" type="hidden" name="listEdu[].resumenum" value="{{resumenum}}">
		<label>입학일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control enterdate edu edudates"
				name="listEdu[].enterdate" value="{{enterdate}}">
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label>졸업일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control gradudate edu edudates"
				name="listEdu[].gradudate" value="{{gradudate}}">
			<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label for="schoolname">학교명</label> <input class="form-control schoolname edu"
			name="listEdu[].schoolname" value="{{schoolname}}"></input>
	</div>
	<div class="form-group col-md-3">
		<label for="major">학과</label> <input class="form-control major edu"
			name="listEdu[].major" value="{{major}}"></input>
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
		<label id="edu_label">추가/삭제</label><br />
		<button class="btn btn-default btn-sm edu_plus_btn" type="button">
			<i class="glyphicon glyphicon-plus"></i>
		</button>
		<button class="btn btn-default btn-sm edu_minus_btn" type="button">
			<i class="glyphicon glyphicon-minus"></i>
		</button>
	</div>
</div>
<!-- end of row -->
</script>
<script id="template_exp" type="text/x-handlebars-template">
<div class="row exp_row_number">
	<input class="career" type="hidden" name="listCareer[].resumenum" value="{{resumenum}}">
	<hr class="form-group col-md-12" style="border: solid 0.5px #ccc;">
	<div class="form-group col-md-3">
		<label>입사일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control career careerdates" name="listCareer[].startjob"
				value="{{startjob}}"> <span
				class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label>퇴사일</label>
		<div class="input-group date" data-provide="datepicker">
			<input type="text" class="form-control career careerdates"
				name="listCareer[].finishjob" value="{{finishjob}}"> <span
				class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-3">
		<label for="cname">회사명</label>
		<input class="form-control career" name="listCareer[].cname" value="{{cname}}"></input>
	</div>
	<div class="form-group col-md-3">
		<label for="jobdescription">담당업무</label>
		<input class="form-control career" name="listCareer[].jobdescription" value="{{jobdescription}}">
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
		<label id="exp_label">추가/삭제</label><br />
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
<div class="row web_row_number">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control webid" value="{{webid}}"></input>
	<input type="hidden" class="form-control webclass rid" name="pwebsitesvolist[].rid" value="{{rid}}"></input>

	<div class="form-group col-md-3">
		<label for="webtitle">웹사이트 (종류)</label> 
		<input class="form-control webtitle webclass" name= "pwebsitesvolist[].webtitle" value="{{webtitle}}"> </input>
	</div>

	<div class="form-group col-md-4">
		<label for="webadd">주소</label> 
		<input class="form-control webadd webclass" name="pwebsitesvolist[].webadd" value="{{webadd}}"></input>
	</div>

	<div class="form-group col-md-2">
		<label id="web_label">추가/삭제</label><br />
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
<div class="row license_row_number">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control licenseid" value="{{licenseid}}"></input>
	<input type="hidden" class="form-control rid licenseclass" name="rlicensevolist[].rid" value="{{rid}}"></input>
	
	<div class="form-group col-md-3">
		<label for="licensename">자격증명</label> 
		<input class="form-control licensename licenseclass" name="rlicensevolist[].licensename" value="{{licensename}}"></input>
	</div>

	<div class="form-group col-md-3">
		<label for="publeoffice">발행기관</label> 
		<input class="form-control publeoffice licenseclass" name="rlicensevolist[].publeoffice" value="{{publeoffice}}"></input>
	</div>
	
	<div class="form-group col-md-3">
		<label for="acquidate">취득일자</label> 
			<div class="input-group date" data-provide="datepicker">
				<input type="text" class="input-group date form-control acquidate licenseacquidate licenseclass" name="rlicensevolist[].acquidate" value="{{acquidate}}">
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
			</div>
	</div>

	<div class="form-group col-md-2">
		<label id="license_label">추가/삭제</label><br/>
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
<div class="row lang_row_number">
	<hr style="border: solid 0.5px #ccc;">
	<input type="hidden" class="form-control resumelangid" value="{{resumelangid}}"></input>
	<input type="hidden" class="form-control rid langclass" name="rlangvolist[].rid" value="{{rid}}"></input>

	<div class="form-group col-md-3">
		<label for="lid">언어 선택</label>
		<select class="form-control lid langclass" name="rlangvolist[].lid" value="{{lid}} >
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
		<input class="form-control test langclass" name="rlangvolist[].test" value="{{test}}"></input>
	</div>
	
	<div class="form-group col-md-2">
		<label for="score">점수</label> 
		<input class="form-control score langclass" name="rlangvolist[].score" value="{{score}}"></input>
	</div>
	<div class="form-group col-md-3">
		<label for="publeoffice">발행기관</label> 
		<input class="form-control publeoffice langclass" name="rlangvolist[].publeoffice" value="{{publeoffice}}"></input>
	</div>
	<div class="form-group col-md-3">
		<label for="acquidate">취득일자</label> 
		<div class="input-group date" data-provide="datepicker">
				<input type="text" class="input-group date form-control acquidate languageacquidate langclass"  name="rlangvolist[].acquidate" value="{{acquidate}}">
				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
		</div>
	</div>
	<div class="form-group col-md-2">
		<label id="lang_label">추가/삭제</label><br/>
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
$(document).ready(function() {
    
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
	var xornot = document.getElementById('xornot');
	var preexistenceimg = document.getElementById('preexistenceimg');
	
	function datepick() {
		$('.input-group.date').datepicker({
			calendarWeeks : false,
			todayHighlight : true,
			autoclose : true,
			format : "yyyy-mm-dd",
			language : "kr"
		});
	}
	
	//이거start
	 if($('#imgsrccheck').val()!=""){
		console.log(" val이 널값아님");
		$('#imgsrc').attr("src", 'displayFile?fileName=${ResumeVO.img}');
		var str = "";
		str = 
			  "<a id='ORIGINAL'><br>크게보기</a>"
			  +"<small data-src=${ResumeVO.img}>X</small>";
			  
		  $("#uploadedList").append(str); 
		  
		  $("#ORIGINAL").on("click", function(){
				console.log("ORIGINAL click");
				var src = "displayFile?fileName=${ResumeVO.img}";
				$("#ORIGINAL_modal").modal();
				$("#modal_get_Imgname1").attr("src", src);
			});
		  
		  $("#preexistenceimg").val("1");
	}else{
		console.log(" val이 널값이다");
		$('#imgsrc').attr("src", 'displayFile?fileName=/NoImage.png');
		$('#imgsrc').attr("alt", '사진이 등록되지 않았습니다.');
		$("#preexistenceimg").val("0");
	}  
	var upload = document.getElementById('fileupload');
    var uploadedList = document.getElementById('uploadedList');
  
	if (typeof window.FileReader === 'undefined') {
	 console.log("window.FileReader 'fail'");
	} else {
	 console.log("window.FileReader 'success'");
	}  //fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때
	  
	upload.onchange = function upload_change(e) {
		
		 file = upload.files[0];
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
								  "<a id='ORIGINAL'>크게보기</a>"
								  +"<small data-src="+data+">X</small>";  

					  $("#uploadedList").append(str); 
					  $("#ORIGINAL").on("click", function(){
							console.log("ORIGINAL click");
							console.log("dlrj"+data);
							console.log(getImageLink(data));
							var src = "displayFile?fileName="+data;
							$("#ORIGINAL_modal").modal();
							$("#modal_get_Imgname1").attr("src", src);
						});
					  document.getElementById('uploadfilename').value = data;
					 // uploadedfilename_val = data;
				  }//success : function(data){ end
	 		  });//ajax end
		 console.log(file);
		 reader.readAsDataURL(file);
	};//upload change end
	
	$("#uploadedList").on("click", "small", function(event){
		event.preventDefault();
		var that = $(this);
		
		//file==undefined;
		
		if($("#xornot").val()==0){
			
			fileName = $(this).attr("data-src"); //전역변수로 설정
			var front = fileName.substring(0, 12);
			var end = fileName.substring(12);
			var thumcheck = fileName.substring(12,14);
			
			if(thumcheck!="s_"){
				console.log(thumcheck + "썸네일 아닐 때 fileName" + fileName);
				fileName = front + "s_" + end;
				console.log("썸네일 아니라서 바뀐 fileName" + fileName);
			}else{
				console.log(thumcheck + "썸네일인 fileName" + fileName);
			}
		
			$("#fileupload").val("");
			$("#uploadedList").empty();
			console.log("img File appended deleted");
			console.log("fileName"+fileName);
			$('#uploadfilename').val('');
			
			$("#xornot").val("1");
			console.log($("#xornot").val());
		}else if($("#xornot").val()==1){
			console.log("img File on server deleted");
			$(this).parent("div").empty();
			$("#fileupload").val("");
			$('#uploadfilename').val('');
			$("#uploadedList").empty();
			console.log("2번 이상 삭제 누름 img File appended deleted");
			console.log("2번 이상 삭제 누름 fileName"+fileName);
			
			$("#xornot").val("1");
			console.log($("#xornot").val());
		}
	}); 
	
	function getOriginalName(fileName){
      	var idx = fileName.indexOf("_")+1;
      	return fileName.substr(idx);
      }
	function getImageLink(fileName){
      	var front = fileName.substr(0,12);
      	var end = fileName.substr(14);
      	
      	return front + end;
      } 
	 
	$("#write-success").on("click", function(){
	   if($('#title').val()==''){
		   alert("제목을 입력해주세요!");
		   return;
	   }else{
		   if($('#birth').val()==''){
				$('#birth').val("0000-00-00");
			}
			$('.licenseacquidate').each(function(){ 
				if($(this).val()==''){
					$(this).val("0000-00-00");
				}
			});
			$('.languageacquidate').each(function(){ 
				if($(this).val()==''){
					$(this).val("0000-00-00");
				}
			});
			$('.careerdates').each(function(){ 
				if($(this).val()==''){
					$(this).val("0000-00-00");
				}
			});
			$('.edudates').each(function(){ 
				if($(this).val()==''){
					$(this).val("0000-00-00");
				}
			});
		//alert(uploadedfilename_val);
		formObj = $("form[role = 'form']");
		formObj.attr("action", "/personal/Rmodify");
		formObj.attr("method", "post");
		numberingList();
		formObj.submit();
	   }
	});
	
	function numberingList() {
		$(".telclass").each(function(index){
			var num = 3;
			var name = $(this).attr("name");
			name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
			$(this).attr("name", name);
		});
		$(".edu").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 8) + parseInt(index/num) + name.substring(8);
			$(this).attr("name", name);
		});
		$(".career").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 11) + parseInt(index/num) + name.substring(11);
			$(this).attr("name", name);
		});
		$(".webclass").each(function(index){
			var num = 3;
			var name = $(this).attr("name");
			name = name.substring(0, 16) + parseInt(index/num) + name.substring(16);
			$(this).attr("name", name);
		}); 
	 	$(".langclass").each(function(index){
			var num = 6;
			var name = $(this).attr("name");
			name = name.substring(0, 12) + parseInt(index/num) + name.substring(12);
			$(this).attr("name", name);
		}); 
		$(".licenseclass").each(function(index){
			var num = 4;
			var name = $(this).attr("name");
			name = name.substring(0, 15) + parseInt(index/num) + name.substring(15);
			$(this).attr("name", name);
			//console.log($(this).attr("name"));
		}); 
	}
	// tel 추가버튼 이벤트
	$("#tel_div").on("click", ".tel_plus_btn", function(){
		 var item = {
			rid : ${ResumeVO.bno}
		}; 
		add_tel(item);
	});
	// tel 삭제버튼 이벤트
	$("#tel_div").on("click", ".tel_minus_btn", function(){
		 var tel_index = $(".tel_minus_btn").index(this);  // 존재하는 tel_minus_btn를 기준으로 index
		 if(tel_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	
	// edu 추가버튼 이벤트
	$("#edu_div").on("click", ".edu_plus_btn", function(){
		var item = {
			resumenum : ${ResumeVO.bno}
		};
		add_edu(item);
	});
	
	//edu minus 버튼 이벤트
	$("#edu_div").on("click", ".edu_minus_btn", function(){
		 var edu_index = $(".edu_minus_btn").index(this);  // 존재하는 edu_minus_btn를 기준으로 index
		 if(edu_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	// exp 추가버튼 이벤트
	$("#exp_div").on("click", ".exp_plus_btn", function(){
		var item = {
			resumenum : ${ResumeVO.bno}
		};
		add_exp(item);
	});
	//exp minus 버튼 이벤트
	$("#exp_div").on("click", ".exp_minus_btn", function(){
		 var exp_index = $(".exp_minus_btn").index(this);  // 존재하는 exp_minus_btn를 기준으로 index
		 if(exp_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//웹 추가 버튼 이벤트
	$("#web_div").on("click", ".web_plus_btn", function(){
		var item = {
			rid : ${ResumeVO.bno}
		};
		add_web(item);
	});
	//웹 삭제 버튼 이벤트
	$("#web_div").on("click", ".web_minus_btn", function(){
		 var web_index = $(".web_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 if(web_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//자격증 추가 버튼 이벤트
	$("#license_div").on("click", ".license_plus_btn", function(){
		var item = {
			rid : ${ResumeVO.bno}
		};
		add_license(item);
	});
	//자격증 삭제 버튼 이벤트
	$("#license_div").on("click", ".license_minus_btn", function(){
		 var license_index = $(".license_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
		 if(license_index!=0){
			 $(this).closest('.row').remove();
		 }else{
			 alert("기본 칸입니다.");
		 }
	});
	//언어 추가 버튼 이벤트
	$("#language_div").on("click", ".lang_plus_btn", function(){
		var item = {
			rid : ${ResumeVO.bno}
		};
		add_language(item);
	});
	//언어 삭제 버튼 이벤트
	$("#language_div").on("click", ".lang_minus_btn", function(){
		var lang_index = $(".lang_minus_btn").index(this);  // 존재하는 web_minus_btn를 기준으로 index
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
		var len = (${PTelVOlist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${PTelVOlist}" var="PTelVO">
				var item = {
					telid : ${PTelVO.telid},
					rid : ${PTelVO.rid},
					teltitle : "${PTelVO.teltitle}", 
					tel : "${PTelVO.tel}" 
				};
				add_tel(item);
			</c:forEach>
		}else{
			var item = {
					telid : "",
					rid : ${ResumeVO.bno},
					teltitle : "", 
					tel : "" 
				};
			add_tel(item);
		}
	}
	function edu_list() {
		var len = (${eduVOlist.size()});
	
		if( len > 0 ) {
			<c:forEach items="${eduVOlist}" var="eduVO">
				var item = {
					resumenum : ${eduVO.resumenum},
					schoolname : "${eduVO.schoolname}",
					major : "${eduVO.major}",
					enterdate : "${eduVO.enterdate}",
					gradudate : "${eduVO.gradudate}",
					edustatus : ${eduVO.edustatus}
				};
				add_edu(item);
			</c:forEach>
		}else{
			var item = {
					resumenum : ${ResumeVO.bno},
					schoolname : "",
					major : "",
					enterdate : "",
					gradudate : "",
					edustatus : ""
				};
				add_edu(item);
		}
	}
	
	function exp_list() {
		var len = (${careerVOList.size()});
		
		if( len > 0 ) {
			<c:forEach items="${careerVOList}" var="careerVO">
				var item = {
					resumenum : ${careerVO.resumenum},
					cname : "${careerVO.cname}",
					jobdescription : "${careerVO.jobdescription}",
					startjob : "${careerVO.startjob}",
					finishjob : "${careerVO.finishjob}",
					salary : ${careerVO.salary}
				};
				
				add_exp(item);
			</c:forEach>
		}else{
			var item = {
					resumenum : ${ResumeVO.bno},
					cname : "",
					jobdescription : "",
					startjob : "",
					finishjob : "",
					salary : ""
				};
				add_exp(item);
		}
		
	}		
	function web_list() {
		var len = (${PWebSiteVOlist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${PWebSiteVOlist}" var="PWebSiteVO">
				var item = {
					webid : ${PWebSiteVO.webid},
					rid : ${PWebSiteVO.rid},
					webtitle : "${PWebSiteVO.webtitle}", 
					webadd : "${PWebSiteVO.webadd}"
				};
				add_web(item);
			</c:forEach>
		}else{
			var item = {
					webid : "",
					rid : ${ResumeVO.bno},
					webtitle : "", 
					webadd : ""
				};
				add_web(item);
		}
	}

	function license_list() {
		var len = (${RLicenselist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${RLicenselist}" var="RLicenseVO">
				var item = {
					rid : ${RLicenseVO.rid},
					licensename : "${RLicenseVO.licensename}", 
					publeoffice : "${RLicenseVO.publeoffice}",
					acquidate : "${RLicenseVO.acquidate}"
				};
				add_license(item);
			</c:forEach>
		}else{
			var item = {
					rid : ${ResumeVO.bno},
					licensename : "", 
					publeoffice : "",
					acquidate : ""
				};
				add_license(item);
		}
	}
	function language_list() {
		var len = (${RLanguagelist.size()});
		
		if( len > 0 ) {
			<c:forEach items="${RLanguagelist}" var="ResumeLanguageVO">
				var item = {
					rid : ${ResumeLanguageVO.rid},
					lid : ${ResumeLanguageVO.lid},
					test : "${ResumeLanguageVO.test}", 
					score : "${ResumeLanguageVO.score}",
					publeoffice : "${ResumeLanguageVO.publeoffice}",
					acquidate : "${ResumeLanguageVO.acquidate}"
				};
				add_language(item);
			</c:forEach>
		}else{
			var item = {
					rid : ${ResumeVO.bno},
					lid : "",
					test : "", 
					score : "",
					publeoffice : "",
					acquidate : ""
				};
			add_language(item);
		}
	}
	tel_list();
	edu_list();
	exp_list();
	web_list();
	license_list();
	language_list();
	
	minus_btn();
	
	function minus_btn(){
		$('.tel_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#tel_label').text('추가');
				$(this).find('.tel_minus_btn').hide();
			}
		});
		$('.edu_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#edu_label').text('추가');
				$(this).find('.edu_minus_btn').hide();
			}
		});
		$('.exp_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#exp_label').text('추가');
				$(this).find('.exp_minus_btn').hide();
			}
		});
		$('.web_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#web_label').text('추가');
				$(this).find('.web_minus_btn').hide();
			}
		});
		$('.license_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#license_label').text('추가');
				$(this).find('.license_minus_btn').hide();
			}
		});
		$('.lang_row_number').each(function(index) {
			if($(this).index()==0){
				$(this).find('#lang_label').text('추가');
				$(this).find('.lang_minus_btn').hide();
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
      var largeNum = $(this).val();
      SubJobGroup(largeNum);
   })
   function SubJobGroup(largeNum) {
      $.getJSON("/companyAjax/jobGroup/" + largeNum, function(data) {
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