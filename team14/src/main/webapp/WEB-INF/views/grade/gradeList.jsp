<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성적표 목록</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>

        tbody .button {
            width: 40px;
            height: 20px;
        }

    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<div class="page_wrap">
    <jsp:include page="../include/header.jsp"></jsp:include>
    <jsp:include page="../myclass/myclassTopbar.jsp"></jsp:include>
    <section class="hero is-white is-small">
        <div class="hero-body">
            <h5 class="is-size-4" style="margin-left: 440px">
                성적 게시판
            </h5>
        </div>
    </section>
    <div class="content" id="content"
         style="min-height: 10px; width: 1200px; margin-left: 40px; margin-bottom: 100px; margin-top: 0px">
        <div class="row column text-center" style="width: 1200px">
            <div class="container" style="width: 1000px; left: 320px; height: 470px;">
                <table id="myTable" style="font-size: 16px">
                    <thead>
                    <tr>
                        <th width="80">No</th>
                        <th>학생 이름</th>
                        <th>학생 아이디</th>
                        <th>담당선생님 성함</th>
                        <th>시험 종류</th>
                        <th width="120">등록일</th>
                        <th>비고</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${gradeList}" var="grade" varStatus="status">
                        <tr>
                            <td>${grade.no}</td>
                            <td>${grade.stuname}</td>
                            <td>${grade.stuid}</td>
                            <td>${grade.tname}
                                <input type="hidden" id="tid" name="tid" value="tid"/>
                            </td>
                            <td>${grade.exam}</td>
                            <td>
                                <fmt:parseDate value="${grade.regdate }" var="resdate" pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                            </td>
                            <td colspan="2">
                                <c:if test="${sid == grade.stuid || sid == grade.tid}">
                                    <a class="button is-black is-outlined"
                                       onclick="window.open('${path}/grade/gradedetail.do?no=${grade.no}', '_blank', 'popup=yes', 'width=700px', 'height=700px', 'top=50px', 'left=50px')">상세보기</a>
                                </c:if>
                                <c:if test="${sid == grade.tid}">
                                    <a href="${path}/grade/gradedelete.do?no=${grade.no}"
                                       class="button is-danger is-outlined">성적삭제</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="button-group">
                    <a class="button is-link is-outlined"
                       onclick="window.open('${path}/grade/gradeinsert.do', '_blanck', 'popup=yes', 'width=700px', 'height=700px', 'top=50px', 'left=50px')">성적입력</a>
                </div>
                <script>
                    $(document).ready(function () {
                        $('#myTable').DataTable({
                            pageLength: 10,
                            order: [[0, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
                            info: false,
                            dom: 't<f>p',
                            language: {
                                emptyTable: '등록된 글이 없습니다.'
                            }

                        });
                    });
                    $(document).ready(function () {
                        $('.dataTables_paginate').css({
                            'textAlign': 'left',
                            'float': 'none',
                            'margin-top': '10px',
                        });
                        $('.dataTables_filter').css({
                            'float': 'left',
                            'margin-right': '280px'
                        });
                        $('#myTable_paginate').css({
                            'margin-right': '120px'
                        });
                    });
                </script>
            </div>
        </div>
    </div>
</div>
<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>