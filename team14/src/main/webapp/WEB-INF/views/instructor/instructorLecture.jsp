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
                        <table class="tb1" id="myTable">
                            <thead>
                            <tr>
                                <th></th>
                                <th>정보</th>
                                <th>가격</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="lecture" items="${lectureList }">
                                <tr>
                                    <td class="item1">
                                        <div class="img_tit"><a href="${path}/lecture/lectureDetail.do?no=${lecture.no}"><img src="${path }/storage/${lecture.no }"/></a></div>
                                    </td>
                                    <td class="item2">
                                        <p>${lecture.teachername }</p>
                                        <a href="${path}/lecture/lectureDetail.do?no=${lecture.no}"><p>${lecture.title}</p></a>
                                        <p>수강인원 : ${lecture.cnt}/${lecture.max_cnt}</p>
                                    </td>
                                    <td class="item3">
                                        <p>${lecture.price}</p>

                                    </td>
                                    <td class="item4">
                                        <c:if test="${not empty sid}">
                                            <%--                                <c:set var="isLiked" value="${likedProductIds.contains(pro.no)}" />--%>
                                            <p style="margin-bottom: 4px; height: 50px">
                                                <a href="${path }/AddCart.do?pno=${lecture.no }&cate=${lecture.title}" class="btn1">맛보기</a>
                                                <a href="${path }/AddPayment.do?pno=${lecture.no }" class="btn1">OT</a>
                                            </p>
                                            <p>
                                                <a href="${path }/AddCart.do?pno=${lecture.no }&cate=${lecture.title}" class="btn1">장바구니</a>
                                                <a href="${path }/lecture/lectureEnroll.do?no=${lecture.no }" class="btn1">수강신청</a>
                                            </p>
                                            <%--                                <c:choose>--%>
                                            <%--                                    <c:when test="${isLiked }">--%>
                                            <%--                                        &lt;%&ndash; 눌러도 새로고침 안되게 처리 ///                         현재 로그인한 사용자 ID                 pro.no을 저장하기 위한 역할 &ndash;%&gt;--%>
                                            <%--                                        <a href="javascript:void(0);" onclick="toggleLike(${lecture.no}, '${sessionScope.sid}');" class="likebtn" data-product-id="${lecture.no}" style="color: #ff5050">♥</a>--%>
                                            <%--                                    </c:when>--%>
                                            <%--                                    <c:otherwise>--%>
                                            <%--                                        <a href="javascript:void(0);" onclick="toggleLike(${lecture.no}, '${sessionScope.sid}');" class="likebtn" data-product-id="${lecture.no}"  style="color: #b4b4b4">♥</a>--%>
                                            <%--                                    </c:otherwise>--%>
                                            <%--                                </c:choose>--%>

                                        </c:if>
                                        <script>
                                            function toggleLike(productNo, ${sid }) {
                                                $.ajax({
                                                    url: "ProductLike.do",
                                                    method: "POST",
                                                    data: {
                                                        pno: productNo,
                                                        sid: ${sid }
                                                    },
                                                    success: function(response) {
                                                        var likeButton = $("[data-product-id='" + productNo + "']");

                                                        if (response.trim() === "liked") {
                                                            alert("상품을 좋아요 했습니다!");
                                                            likeButton.css("color","#ff5050");
                                                        } else if (response.trim() === "unliked") {
                                                            alert("상품의 좋아요를 취소했습니다.");
                                                            likeButton.css("color","#b4b4b4");                                                } else {
                                                            alert("오류가 발생했습니다. 다시 시도해주세요.");
                                                        }
                                                    }
                                                });
                                            }
                                            $(document).ready(function() {
                                                // 좋아요 상태를 기반으로 버튼 색 변경
                                                $(".inbtn").each(function() {
                                                    var isLiked = $(this).hasClass("liked");
                                                    if (isLiked) {
                                                        $(this).addClass("liked");
                                                    }
                                                });
                                            });
                                        </script>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <script>
                            $(document).ready( function () {
                                $('#myTable').DataTable({
                                    pageLength : 5,
                                    order: [[3, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
                                    info: false,
                                    dom: 't<f>p',
                                    language: {
                                        emptyTable: '등록된 강의가 없습니다.'
                                    }

                                });
                            } );
                            $(document).ready(function() {
                                $('.dataTables_paginate').css({
                                    'textAlign':'left',
                                    'float': 'none',
                                    'margin-top':'10px',
                                });
                                $('.dataTables_filter').css({
                                    'float': 'left',
                                    'margin-top':'14px',
                                    'margin-right':'280px'
                                });
                                $('#myTable_paginate').css({
                                    'margin-right':'120px'
                                });


                            });

                        </script>
                        <div class="btn_group">
                            <c:if test="${sid eq 'admin' }">
                                <a href="${path}/AddProduct.do" class="inbtn">강의 등록</a>
                            </c:if>
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


</body>
</html>