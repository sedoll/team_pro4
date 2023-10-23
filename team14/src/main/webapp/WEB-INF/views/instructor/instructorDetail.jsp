<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path14" value="${pageContext.request.contextPath }"/>

<html>
<head>
    <title>${instructor.name} 선생님</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path14}/resources/css/instructorPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/instructorPage/sidebar.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/instructorPage/validateUser.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/instructorPage/myPageindex.css"/>

    <style>
        #container {
            margin-top: 80px;
        }
        .instRight{
            float:right;
            /*background-color: red;*/
            height: 400px;
            width: 400px;
            padding-right: 30px;
        }
        .instName{
            text-align: right;
            font-size: 24px;
            margin-top: 30px;
        }
        .instIntro{
            text-align: right;
            font-size: 30px;
            margin-top: 6px;
            height: 110px;
            word-wrap: break-word;
            overflow: hidden;

        }
        .instReview{

        }
        .instReview h5 {
            text-align: left;
            float: left;
            margin-left: 20px;
            color: #0a0a0a;
        }
        .instReview h6 {
            text-align: right;
            float: right;
            color: #0a0a0a;

        }
        .reviewList {
            /*background-color: #c5d6e6;*/
            /*border-radius: 14px;*/
            width: 350px;
            height: 180px;
            margin-left: 20px;
            margin-top: 20px;
            border-top: 1px solid black;
        }
    </style>

</head>
<body>
<div id="wrap">
    <jsp:include page="../include/header.jsp"></jsp:include>

    <div id="container">
        <div class="mypage-base">
            <%@ include file="./sidebar.jsp" %>
            <article class="my-page">
                <main class="container__inner" style="background-color: #DEEBFA; height: 400px">
                    <div style="float:left; width: 400px; height: 400px; position: relative;">
                        <img src="${path14}/resources/upload/${instructor.img}" alt=""  style="position: absolute; bottom: 0; left: 10%">
                    </div>
                    <div class="instRight">
                        <div class="instName">
                            [${instructor.cate}] ${instructor.name} 선생님
                        </div>
                        <div class="instIntro">
                            ${instructor.intro}
                        </div>
                        <div class="instReview">
                                <h5>최신 후기</h5>
                                <h6>+ 더보기</h6>

                        </div>
                        <div class="reviewList">

                        </div>
                    </div>

                </main>
            </article>
        </div>






    </div>
    <footer id="footer" class="footer-nav row expanded collapse">
        <!-- 푸터 부분 인클루드 -->
        <jsp:include page="../include/footer.jsp"></jsp:include>
    </footer>
</div>

<script
        src="https://kit.fontawesome.com/b17793764c.js"
        crossorigin="anonymous"
></script>


</body>
</html>