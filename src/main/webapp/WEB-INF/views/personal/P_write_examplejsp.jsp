<title>File API (simple)</title>

<article>
  <p id="status">File API & FileReader API not supported</p>
  
  <p>Select an image from your machine to read the contents of the file without using a server</p>
  
  <p><input type=file></p><!-- file uploading -->
  
  <div id="holder"></div><!--  uploaded fileList -->
</article>

<script>
var upload = document.getElementsByTagName('input')[0],
    holder = document.getElementById('holder')
    //, state = document.getElementById('status');

 if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
  console.log("state.className = 'fail'");
} else {
  state.className = 'success';
  console.log("state.className = 'success'");
  state.innerHTML = 'File API & FileReader available';
}  //fileLeader라는 프로그램 로딩이 제대로 되지 않았을 때
 
upload.onchange = function (e) {

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder.innerHTML = '';
    holder.appendChild(img);
  };
  console.log(file);
  reader.readAsDataURL(file);

  return false;
};
</script>



/////////////////////////////밑에는 AJAX 
   
   /*   $(".fileDrop").on("drageneter dragover", function(event){
  	   event.preventDefault();
     });
      $(".fileDrop").on("drop", function(event){
      	
  	   event.preventDefault();
  	   
  	   var files = event.originalEvent.dataTransfer.files;
  	   
  	   var file = files[0];
  	   
  	   console.log(file);
  	   
  	   var formData = new FormData();
  	   
  	   formData.append("file", file);
  	   
  	   
  	   $.ajax({
  		  url:'uploadAjax',
  		  data: formData,
  		  dataType : 'text',
  		  processData : false,
  		  contentType : false,
  		  type : 'POST',
  		  success : function(data){
  			  
  			  var str = "";
  			  
  			  console.log(data);
  			  console.log(checkImageType(data));
  			  
  			/*   if(checkImageType(data)){
  				  str = "<div><a href='/displayFile?fileName="+getImageLink(data)+"'>"
  				  +"<img src='../displayFile?fileName="+data+"'/>"
  				  +getImageLink(data) 
  				  +"</a><small data-src="+data+">X</small></div>";
  			
  			  }else{
  				  str = "<div><a href='/displayFile?fileName="+data+"'>"
  						  +getOriginalName(data)+"</a>"
  						  +"<small data-src="+data+">X</small></div>";
  			  } */
  			 /* if(checkImageType(data)){
  				  str = "<div><a href='/displayFile?fileName="+getImageLink(data)+"'>"
  				  +"<img src='displayFile?fileName="+data+"'/>"
  				  +getImageLink(data) 
  				  +"</a><small data-src="+data+">X</small></div>";
  			
  			  }else{
  				  str = "<div><a href='displayFile?fileName="+data+"'>"
  						  +getOriginalName(data)+"</a>"
  						  +"<small data-src="+data+">X</small></div>";
  			  }
  			  $(".uploadedList").append(str);
  		  }
  	   });
     });
      $(".uploadedList").on("click","small",function(event){
      	var that = $(this);
      	
      	$.ajax({
      		url:"deleteFile",
      		type:"post",
      		data:{fileName:$(this).attr("data-src")},
      		dataType:"text",
      		success:function(result){
      			if(result=='deleted'){
      				that.parent("div").remove();
      				console.log("div.remove()")
      				//alert("deleted");
      			}
      		}
      	});
      });
      
      function checkImageType(fileName){
      	
      	var pattern = /jpg$|gif$|png$|jpeg$/i;
      	
      	return fileName.match(pattern);
      }
      
      function getOriginalName(fileName){
      	if(checkImageType(fileName)){
      		return;
      	}
      	var idx = fileName.indexOf("_")+1;
      	return fileName.substr(idx);
      }
      
      function getImageLink(fileName){
      	if(!checkImageType(fileName)){
      		return;
      	}
      	
      	var front = fileName.substr(0,12);
      	var end = fileName.substr(14);
      	
      	return front + end;
      } */
   