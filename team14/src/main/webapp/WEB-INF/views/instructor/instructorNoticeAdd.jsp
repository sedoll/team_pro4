<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path14" value="${pageContext.request.contextPath }"/>

<html>
<head>
    <title>${instructorName} 선생님</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path14}/resources/css/instructorPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/instructorPage/sidebar.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/instructorPage/validateUser.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/instructorPage/myPageindex.css"/>
<style>

</style>

</head>
<body>
<div id="wrap">
    <jsp:include page="../include/header.jsp"></jsp:include>

    <div id="container">
        <div class="mypage-base">
            <%@ include file="./sidebar.jsp" %>
            <article class="my-page">
                <main class="container__inner">
                    <div>

                        <form action="${path }/notice/insert.do" method="post">
                            <table id="table1">
                                <tbody>
                                <tr>
                                    <th style="background-color:#dcdcdc">글 제목</th>
                                    <td>
                                        <input type="text" name="title" id="title" class="input" placeholder="제목 입력" maxlength="98" required>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="background-color:#dcdcdc">글 내용</th>
                                    <td>
                                        <textarea name="content" id="content" class="textarea" placeholder="내용 입력" rows="8" cols="100" maxlength="1400" required></textarea>
                                        <script>
                                            CKEDITOR.replace('content',	{filebrowserUploadUrl:'${path}/notice/imageUpload.do'});
                                        </script>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <input type="submit" class="submit button is-link is-outlined" value="글 등록" >
                                        <a class="button is-blac is-outlined" href="${path }/instructor/instructorNotice.do?instructorName=${teacherName}">글 목록</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>



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