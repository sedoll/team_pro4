<
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

    <%-- <!-- 부트스트랩 4.0 CSS -->
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
           integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
     <!-- 제이쿼리 -->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
             integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
             crossorigin="anonymous" type="text/javascript"></script>
 --%>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path13}/resources/css/myPage/validateUser.css"/>
    <link href="${path13}/resources/css/myStudy/com_write.css" rel="stylesheet">
    <script type="text/javascript" src="${path13}/resources/js/com_write.js" charset="UTF-8"></script>

    <title>강의 상세보기</title>


</head>
<body>

<div class="wrap">
    <jsp:include page="../include/header.jsp"></jsp:include>
    <%@ include file="/WEB-INF/views/myclass/myclassTopbar.jsp" %>

    <div class="content-wrap" style="display: flex;justify-content: center;">
        <div class="content-section">
            <%--<h5 class="font"> 작성글관리 > </h5>--%>
            <br>

            <form class="content">

                <div id="ud_tab" style="">
                    <input type="radio" name="ud_tabs" id="tab1" checked>
                    <label for="tab1">강좌소개</label>
                    <input type="radio" name="ud_tabs" id="tab2">
                    <label for="tab2">강좌목차</label>
                    <input type="radio" name="ud_tabs" id="tab3">
                    <label for="tab3">공지사항</label>
                    <input type="radio" name="ud_tabs" id="tab4">
                    <label for="tab4">QnA</label>
                    <input type="radio" name="ud_tabs" id="tab5">
                    <label for="tab5">수강후기</label>
                    <input type="radio" name="ud_tabs" id="tab6">
                    <label for="tab6">자료실</label>


                <%--강의 소개--%>
                <jsp:include page="myclassIntro.jsp"></jsp:include>






                <%--강의 목차--%>
                <div id="ud_tab-content2" class="ud_content">
                    <%-- <tr>
                            <th style="width: 10%">학습상태</th>
                            <th style="width: 65%; text-align: center">수강기간</th>
                            <th style="width: 25%; text-align: center">수강 일시정지 기간</th>
                            <th style="width: 25%; text-align: center">진도율</th>
                        </tr>

                    <%--<h5> 강의 목차 </h5>--%>
                    <table>
                        <thead>

                        <tr>
                            <th style="width: 10%">순번</th>
                            <th style="width: 50%; text-align: center">강의명</th>
                            <th style="width: 10%; text-align: center">강의 시간</th>
                            <th style="width: 10%; text-align: center">최근 학습일</th>
                            <th style="width: 10%; text-align: center">학습 완료</th>
                            <th style="width: 10%; text-align: center">학습 하기</th>
                        </tr>
                        </thead>

                        <%-- <tbody>
                         <c:forEach items="${board_comlist }" var="board_comlist">
                             <tr class = "commentlist">
                                 <td>${board_comlist.content}</td>
                                 <td>${board_comlist.write_date}</td>
                                 <td><button type="button" class ="origin" onclick="location.href='${path13}/board/detail.do?bno=${board_comlist.num}'">원문보기</button></td>
                             </tr>

                         </c:forEach>
                         </tbody>--%>
                    </table>
                </div>

                <%--공지사항--%>
                <div id="ud_tab-content3" class="ud_content">

                    <%--<h5> 공지사항 </h5>--%>
                    <table>
                        공지사항 페이지 입니다

                        <thead>

                        <tr>
                            <th style="width: 10%"></th>
                            <th style="width: 65%; text-align: center"></th>
                            <th style="width: 25%; text-align: center"></th>
                            <th style="width: 25%; text-align: center"></th>
                        </tr>

                        </thead>

                        <%-- <tbody>
                         <c:forEach items="${board_comlist }" var="board_comlist">
                             <tr class = "commentlist">
                                 <td>${board_comlist.content}</td>
                                 <td>${board_comlist.write_date}</td>
                                 <td><button type="button" class ="origin" onclick="location.href='${path13}/board/detail.do?bno=${board_comlist.num}'">원문보기</button></td>
                             </tr>

                         </c:forEach>
                         </tbody>--%>
                    </table>

                    <%--QnA--%>
                    <div id="ud_tab-content4" class="ud_content">

                        <%--<h5> 수강 후기 </h5>--%>
                        <table>
                            QnA 페이지 입니다
                            <thead>

                            <tr>
                                <th style="width: 10%"></th>
                                <th style="width: 65%; text-align: center"></th>
                                <th style="width: 25%; text-align: center"></th>
                                <th style="width: 25%; text-align: center"></th>
                            </tr>

                            </thead>

                            <%-- <tbody>
                             <c:forEach items="${board_comlist }" var="board_comlist">
                                 <tr class = "commentlist">
                                     <td>${board_comlist.content}</td>
                                     <td>${board_comlist.write_date}</td>
                                     <td><button type="button" class ="origin" onclick="location.href='${path13}/board/detail.do?bno=${board_comlist.num}'">원문보기</button></td>
                                 </tr>

                             </c:forEach>
                             </tbody>--%>
                        </table>
                    </div>

                    <%--수강 후기--%>
                    <div id="ud_tab-content5" class="ud_content">

                        <%--<h5> 수강 후기 </h5>--%>
                        <table>
                            수강 후기 페이지 입니다
                            <thead>

                            <tr>
                                <th style="width: 10%"></th>
                                <th style="width: 65%; text-align: center"></th>
                                <th style="width: 25%; text-align: center"></th>
                                <th style="width: 25%; text-align: center"></th>
                            </tr>

                            </thead>

                            <%-- <tbody>
                             <c:forEach items="${board_comlist }" var="board_comlist">
                                 <tr class = "commentlist">
                                     <td>${board_comlist.content}</td>
                                     <td>${board_comlist.write_date}</td>
                                     <td><button type="button" class ="origin" onclick="location.href='${path13}/board/detail.do?bno=${board_comlist.num}'">원문보기</button></td>
                                 </tr>

                             </c:forEach>
                             </tbody>--%>
                        </table>
                    </div>

                    <%--자료실--%>
                    <div id="ud_tab-content6" class="ud_content">

                        <%--<h5> 자료실 </h5>--%>
                        <table>
                            자료실 페이지 입니다
                            <thead>

                            <tr>
                                <th style="width: 10%"></th>
                                <th style="width: 65%; text-align: center"></th>
                                <th style="width: 25%; text-align: center"></th>
                                <th style="width: 25%; text-align: center"></th>
                            </tr>

                            </thead>

                            <%-- <tbody>
                             <c:forEach items="${board_comlist }" var="board_comlist">
                                 <tr class = "commentlist">
                                     <td>${board_comlist.content}</td>
                                     <td>${board_comlist.write_date}</td>
                                     <td><button type="button" class ="origin" onclick="location.href='${path13}/board/detail.do?bno=${board_comlist.num}'">원문보기</button></td>
                                 </tr>

                             </c:forEach>
                             </tbody>--%>
                        </table>
                    </div>


                </div>


        </div>

    </div>
</div>
</div>


<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
