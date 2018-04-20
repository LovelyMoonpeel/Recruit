<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html lang="ko">
<html>
<head>

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta name="description" content="WebRTC에 대한 정보 공유">
    <meta name="author" content="codeJS">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/rpjt/img/logo-webrtc.png" type="image/png" rel="icon">
    <link href="/resources/rpjt/css/style.css" type="text/css" rel="stylesheet">
    <link href="/resources/rpjt/css/github-gist.css" type="text/css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="/resources/rpjt/js/DetectRTC.js"></script>
    
<!--     <script src="/resources/rpjt/js/adapter.js"></script> -->

<!-- <link href="/resources/rpjt/css/main.css" rel="stylesheet" type="text/css">
 -->
 
 
 
</head>



<body>


<header>
     
      <a href="https://github.com/dodortus/webrtc-lab" target="_blank">
        <img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/e7bbb0521b397edbd5fe43e7f760759336b5e05f/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f677265656e5f3030373230302e706e67" alt="Fork me on GitHub">
      </a>
    </header>
    
 <link href="/resources/rpjt/css/main.css" type="text/css" rel="stylesheet">
 
<div id="content">
  <div class="wrap">
    <section id="share-wrap">
      <a href="#" id="unique-token">Share this room link</a>
    </section>
    <section id="join-wrap">
      <p>영상회의를 시작하시겠습니까?</p>
      <button id="start">Start</button>
    </section>
    <section id="room-list"></section>

    <!-- local/remote videos container -->
    <section id="video-wrap">
      <div class="buttons">
        <button id="btn-camera">Camera Pause</button>
        <button id="btn-mic">Mic Mute</button>
      </div>
    </section>
  </div>
</div>


<script src="https://cdn.socket.io/socket.io-1.4.5.js"></script>

<script src="/resources/rpjt/js/ttt.js"></script>


<!-- webrtc spec changes crossbrowsing -->
<script src="/resources/rpjt/js/adapter.js"></script>

<script src="/resources/rpjt/js/main.js"></script>


<script src="/resources/rpjt/js/highlight.min.js"></script>

<script src="/resources/rpjt/js/global.js"></script>

</body>
</html>