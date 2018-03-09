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