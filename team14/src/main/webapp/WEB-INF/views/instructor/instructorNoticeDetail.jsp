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
    <link rel="stylesheet" href="${path14}/resources/css/teacherPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/teacherPage/sidebar.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/teacherPage/validateUser.css"/>
    <link rel="stylesheet" href="${path14}/resources/css/teacherPage/myPageindex.css"/>
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

                        <table class="table is-bordered is-striped is-hoverable is-fullwidth">
                            <thead>
                            <tr class="title">
                                <th colspan="5">${teacherNotice.title}</th>
                            </tr>
                            <tr>
                                <td>
                                    <c:if test="${not empty sid && sid eq 'admin'}">
                                        <a href="${path}/teacherNotice/teacherNoticeEdit.do?no=${dto.no}" class="button is-outlined is-link">수정</a>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${not empty sid && sid eq 'admin'}">
                                        <a href="${path}/teacherNotice/teacherNoticeDelete.do?no=${dto.no}" class="button is-outlined is-danger">삭제</a>
                                    </c:if>
                                </td>
                                <td>관리자</td>
                                <td>${teacherNotice.resdate}</td>
                                <td>조회수 : ${teacherNotice.cnt}</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td colspan="5" class="content">
                                    <div>
                                        ${teacherNotice.content}
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>



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