<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
video {
  position: fixed;
  top: 50%;
  left: 50%;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  z-index: -100;
  transform: translateX(-50%) translateY(-50%);
 /*  background: url('resources/video/vimage4.jpg') no-repeat;  */
  background-size: cover;
  transition: 1s opacity;
}
</style>

<!-- <video poster="resources/video/vimage4.jpg"  id="bgvid" playsinline autoplay muted loop > -->
<video id="bgvid" playsinline autoplay muted loop >
	<source src="resources/video/video4.mp4" type="video/mp4">
</video>

