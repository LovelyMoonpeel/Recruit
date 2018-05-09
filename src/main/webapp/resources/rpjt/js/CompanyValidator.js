		
	var urlName = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.length);
	

		if($("#TAC").is(":checked")==false && urlName=='C_write'){ /* 이용 약관 유효성 검사 */

			e.preventDefault(); 
			$("#TAC").focus();
			alert("이용약관에 동의해주세요");		

		}

		if($("input[type=radio][name='acceptmethod']:checked").val()==undefined){ /* 접수 방법 유효성 검사 */
				
			$("#acceptmethodTxt").css("color","#a94442")
			$("#recruitnum").focus();
			e.preventDefault(); 
			
				
		}else{

			$("#acceptmethodTxt").css("color","#3c763d");		
				
		}
		
//		if($("#periodstart").val()==""){  /* 채용 공고 마감일 유효성 검사 */
//				
//			$("#periodTxt").css("color","#a94442")
//			$("#periodstart").focus();
//			e.preventDefault(); 
//								
//		}else{
//
//			$("#periodTxt").css("color","#3c763d");
//			
//		}

		if($("#period").val()==""){ /* 채용 공고 마감일 유효성 검사 */
				
			$("#periodTxt").css("color","#a94442")
			$("#period").focus();
			e.preventDefault(); 
							
		}else{

			$("#periodTxt").css("color","#3c763d");
		
		}	

		if($("#adddesc").val()==""){ /* 상세 내용 및 우대사항 유효성 검사 */
			
			$("#adddescDiv").addClass("form-group has-error has-feedback"); 
			$("#adddescTxt").css("color","#a94442")
			$("#adddescXIcon").css("display","");
			$("#adddesc").focus();
			e.preventDefault(); 
			
		}else{
			
			$("#adddescDiv").removeClass(); 
			$("#adddescXIcon").css("display","none");
			$("#adddescDiv").addClass("form-group has-success has-feedback");
			$("#adddescTxt").css("color","#3c763d")
			$("#adddescOKIcon").css("display","");
			
		}

		if($("#exp").val()==""){ /* 경력 유효성 검사 */
						
			$("#expDiv").addClass("form-group has-error has-feedback"); 
			$("#expTxt").css("color","#a94442")
			$("#expXIcon").css("display","");
			$("#exp").focus();
			e.preventDefault(); 
				
		}else{
								
			$("#expDiv").removeClass(); 
			$("#expDiv").addClass("form-group has-success has-feedback"); 
			$("#expTxt").css("color","#3c763d");
			$("#expXIcon").css("display","none");
			$("#expOKIcon").css("display","");
					
		}


		if($("#edu").val()==""){	/* 학력 유효성 검사 */
				
			$("#eduDiv").addClass("form-group has-error has-feedback"); 
			$("#eduTxt").css("color","#a94442")
			$("#eduXIcon").css("display","");
			$("#edu").focus();
			e.preventDefault(); 
						
		}else{
									
			$("#eduDiv").removeClass(); 
			$("#eduDiv").addClass("form-group has-success has-feedback"); 
			$("#eduTxt").css("color","#3c763d");
			$("#eduXIcon").css("display","none");
			$("#eduOKIcon").css("display","");
					
		}


		if($("#salaryid").val()==""){ /* 급여사항 유효성 검사 */
				
			$("#salaryidDiv").addClass("form-group has-error has-feedback"); 
			$("#salaryidTxt").css("color","#a94442")
			$("#salaryidXIcon").css("display","");
			$("#salaryid").focus();
			e.preventDefault(); 
			
		}else{
						
			$("#salaryidDiv").removeClass(); 
			$("#salaryidDiv").addClass("form-group has-success has-feedback"); 
			$("#salaryidTxt").css("color","#3c763d");
			$("#salaryidXIcon").css("display","none");
			$("#salaryidOKIcon").css("display","");
			
		}



		if($("#employstatusid").val()==""){ /* 근무형태 유효성 검사 */
			
			$("#employstatusidDiv").addClass("form-group has-error has-feedback"); 
			$("#employstatusidTxt").css("color","#a94442")
			$("#employstatusidXIcon").css("display","");
			$("#employstatusid").focus();
			e.preventDefault(); 
		
		
			}else{
				
				
			$("#employstatusidDiv").removeClass(); 
			$("#employstatusidDiv").addClass("form-group has-success has-feedback"); 
			$("#employstatusidTxt").css("color","#3c763d");
			$("#employstatusidXIcon").css("display","none");
			$("#employstatusidOKIcon").css("display","");
		
		}


		if($("input[type=radio][name='recruitnum']:checked").val()==undefined && urlName=='C_write'){ /* 모집인원 유효성 검사 */
					
			$("#recruitnumTxt").css("color","#a94442")
			$("#recruitnumXIcon").css("display","");
			$("#recruitnum").focus();
			e.preventDefault(); 
			
				
		}else{

			$("#recruitnumTxt").css("color","#3c763d");
			$("#recruitnumXIcon").css("display","none");
			$("#recruitnumOKIcon").css("display","");
						
		}		

		if($("#jobdesc").val()==""){ /* 담당업무 유효성 검사 */
			
			$("#jobdescDiv").addClass("form-group has-error has-feedback"); 
			$("#jobdescTxt").css("color","#a94442")
			$("#jobdescXIcon").css("display","");
			$("#jobdesc").focus();
			e.preventDefault(); 
			
		}else{
			
			$("#jobdescDiv").removeClass(); 
			$("#jobdescXIcon").css("display","none");
			$("#jobdescDiv").addClass("form-group has-success has-feedback");
			$("#jobdescTxt").css("color","#3c763d")
			$("#jobdescOKIcon").css("display","");
			
		}

		if($("#rgbid").val()==""){ /* 근무지역 유효성 검사 */
			
			$("#rgbidDiv").addClass("form-group has-error has-feedback"); 
			$("#rgbidTxt").css("color","#a94442")
			$("#rgbidXIcon").css("display","");
			$("#rgbid").focus();
			e.preventDefault();
			
		}else{
			
			$("#rgbidDiv").removeClass(); 
			$("#rgbidXIcon").css("display","none");
			$("#rgbidDiv").addClass("form-group has-success has-feedback");
			$("#rgbidTxt").css("color","#3c763d")
			$("#rgbidOKIcon").css("display","");
			
			var jN = $("#rgbid").val();
			
			
			if($("#subRegion"+jN).val()==""){
							
				$("#subRegionDiv").addClass("form-group has-error has-feedback"); 
				$("#rgbidTxt").css("color","#a94442")
				$("#subRegionXIcon").css("display","");
				$("#subRegion").focus();
				e.preventDefault(); 
			
			
			}else{
					
					
				$("#subRegionDiv").removeClass(); 
				$("#subRegionDiv").addClass("form-group has-success has-feedback"); 
				$("#rgbidTxt").css("color","#3c763d");
				$("#subRegionXIcon").css("display","none");
				$("#subRegionOKIcon").css("display","");
					
			}
			
		}

		if($("#jobGroup").val()==""){ /* 직종/직무 유효성 검사 */
			
			$("#jobGroupDiv").addClass("form-group has-error has-feedback"); 
			$("#jobGroupTxt").css("color","#a94442")
			$("#jobGroupXIcon").css("display","");
			$("#jobGroup").focus();
			e.preventDefault(); 
			
		}else{
			
			$("#jobGroupDiv").removeClass(); 
		 	$("#jobGroupXIcon").css("display","none"); 
			$("#jobGroupDiv").addClass("form-group has-success has-feedback"); 
			$("#jobGroupTxt").css("color","#3c763d")
			$("#jobGroupOKIcon").css("display","");
			
			var jN = $("#jobGroup").val();
			
			if($("#subJob"+jN).val()==""){
				
				$("#subJobgroupDiv").addClass("form-group has-error has-feedback"); 
				$("#jobGroupTxt").css("color","#a94442")
				$("#subJobgroupXIcon").css("display","");
				$("#subJobgroup").focus();
				e.preventDefault(); 
			
			
			}else{
					
					
					$("#subJobgroupDiv").removeClass(); 
					$("#subJobgroupDiv").addClass("form-group has-success has-feedback"); 
					$("#jobGroupTxt").css("color","#3c763d");
					$("#subJobgroupXIcon").css("display","none");
					$("#subJobgroupOKIcon").css("display","");
			
					
			}
			
		}
		

		if($("#title").val()==""){   /* 타이틀 유효성 검사 */
			
			$("#titleDiv").addClass("form-group has-error has-feedback"); 
			$("#titleTxt").css("color","#a94442")
			$("#titleXIcon").css("display","");
			$("#title").focus();	
			e.preventDefault();
			
		}else{

			$("#titleDiv").removeClass(); 
			$("#titleXIcon").css("display","none");
			$("#titleDiv").addClass("form-group has-success has-feedback");
			$("#titleTxt").css("color","#3c763d")
			$("#titleOKIcon").css("display","");
			
		}