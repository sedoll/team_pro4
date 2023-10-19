<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path14" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <title>나의 학습방</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <link rel="stylesheet" href="${path14}/resources/css/myStudy/myStudyIndex.css"/>


</head>


<body>


<div id="wrap">
    <jsp:include page="../include/header.jsp"></jsp:include>
    <%@ include file="/WEB-INF/views/myclass/myclassTopbar.jsp" %>


    <div class="mainCont">

        <div class="titArea">
            <h3 class="subMtit">최근 수강 강좌</h3>
            <span>수강 중인 강좌 <em> 0</em>개</span>


            <div class="board_wrap">
                <!-- <div class="board_title">
                    <strong>공지사항</strong>
                    <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
                </div> -->
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top">
                            <div class="leccate" style="width: 10%">분류</div>
                            <div class="lectitle" style="width: 40%">강좌명</div>
                            <div class="insName" style="width: 10%">강사님</div>
                            <div class="lecday" style="width: 10%; line-height: 3;">수강기간</div>
                            <div class="deaddate" style="width: 10%">남은기간</div>
                            <div class="check" style="width: 10%">상태</div>
                            <div class="study" style="width: 10%">학습</div>
                        </div>


                        <c:forEach items="${myclassList }" var="myclass" varStatus="status">
                            <div>
                                <div class="leccate" style="width: 10%">${myclass.lecCate }</div>
                                <div class="lectitle" style="width: 40%">${myclass.lecTitle }</div>
                                <div class="insName" style="width: 10%">${myclass.insName }</div>
                                <div class="lecday" style="width: 10%;">${myclass.lecStudystart} -
                                    <br> ${myclass.lecStudyend }</div>
                                <c:if test="${Ddays >= 0}">
                                    <div class="deaddate" style="width: 10%">${Ddays}일</div>
                                </c:if>
                                <c:if test="${Ddays < 0}">
                                    <div class="deaddate" style="width: 10%">기간만료</div>
                                </c:if>
                                <div class="check" style="width: 10%">${check}</div>
                                <div class="study" style="width: 10%">
                                    <%--<button type="button"
                                            onclick="location.href='${path14}/myclass/getLecVideo?no=${myclass.lec_no}' ">
                                        학습
                                    </button>--%>
                                        <button type="button" class="button is-info"
                                                onclick="location.href='${path14}/myclass/myclassDetail?no=${myclass.lec_no}' ">
                                            학습
                                        </button>
                                </div>
                            </div>

                        </c:forEach>

                        <%--페이징--%>
                        <!-- <div class="board_page">
                            <a href="#" class="bt first"><<</a>
                            <a href="#" class="bt prev"><</a>
                            <a href="#" class="num on">1</a>
                            <a href="#" class="num">2</a>
                            <a href="#" class="num">3</a>
                            <a href="#" class="num">4</a>
                            <a href="#" class="num">5</a>
                            <a href="#" class="bt next">></a>
                            <a href="#" class="bt last">>></a>
                        </div>
                        <div class="bt_wrap">
                            <a href="write.html" class="on">등록</a>

                        </div> -->
                    </div>
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