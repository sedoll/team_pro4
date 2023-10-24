<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path13" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
    <!-- 아이콘 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
          integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
          crossorigin="anonymous"/>
    <!-- 부트스트랩 4.0 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
            integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
            crossorigin="anonymous" type="text/javascript"></script>

    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/sidebar.css"/>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/validateUser.css"/>
    <link href="${path13}/resources/css/myPage/com_write.css" rel="stylesheet">
    <script type="text/javascript" src="${path13}/resources/js/com_write.js" charset="UTF-8"></script>

    <title>작성글</title>
    <style>
    </style>

</head>
<body>
<div class="page">
<jsp:include page="../include/header.jsp"></jsp:include>
<jsp:include page="../myclass/myclassTopbar.jsp"></jsp:include>
    <div class="mypage-base">
    <div class="content-wrap" style="float:left; margin-left: -50px">
        <div class="content-section">
            <h5 class="font" style="margin-left: 120px"> 내가 쓴 글</h5>
            <form class="content" style="font-size: 18px;">
                    <div id="ud_tab-content1" class="ud_content">
                        <h5 style="margin-left: 60px;"> 자유 게시판</h5>
                        <table style="width: 1000px; margin-left: 50px; font-size: 18px;">
                            <thead>
                            <tr>
                                <th style="width: 10%">글번호</th>
                                <th style="width: 65%; text-align: center">제목</th>
                                <th style="width: 25%; text-align: center">작성일</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${boardlist }" var="boardlist">
                                <tr class="boardlist1">
                                    <td>${boardlist.num}</td>
                                    <td>${boardlist.subject}</td>
                                    <td>${boardlist.write_date}</td>
                                    <td><button type="button" class ="button is-black is-outlined" onclick="location.href='${path13}/board/detail.do?bno=${boardlist.num}'">원문보기</button></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
            </form>
        </div>
    </div>
</div>
</div>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
