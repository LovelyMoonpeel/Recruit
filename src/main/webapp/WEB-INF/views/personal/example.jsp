


	<img id = 'imgsrc' height = "150px;" alt="${ResumeVO.img}" /> 
	<!-- 여기에 사진 FILE DISPLAY되고 -->
  <input id='imgsrccheck' type='hidden' value = "${ResumeVO.img}"/>
  <!-- db에 있는 file img 이름 받아오는 hidden input -->
  <div class="form-group">
	<input type = 'file' id='fileupload' accept=".jpg,.jpeg,.png,.gif,.bmp">
 	<!--파일 업로드 하는 버튼-->
 	<input type = 'hidden' id='uploadfilename' name = 'img' >
  	<!-- db에 있는 file img 이름 받아오는 hidden input -->
  </div>