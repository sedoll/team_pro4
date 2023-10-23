<
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="<%=request.getContextPath() %>"/>
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
    <link rel="stylesheet" href="${path}/resources/css/myPage/baseLayout.css"/>
    <link rel="stylesheet" href="${path}/resources/css/myPage/validateUser.css"/>
    <link href="${path}/resources/css/myStudy/com_write.css" rel="stylesheet">
    <%--    <script type="text/javascript" src="${path}/resources/js/com_write.js" charset="UTF-8"></script>--%>

    <title>강의 상세보기</title>

    <style>
        .search_from {
            text-align: right;
            font-size: 18px;
            margin-bottom: 20px; /* 아래쪽 여백 추가 */
        }

        .select_filter {
            padding: 5px; /* 셀렉트 박스 내부 패딩 추가 */
            border: 1px solid #ccc; /* 테두리 추가 */
            border-radius: 5px; /* 테두리 둥글게 만듭니다. */
            margin-right: 10px; /* 셀렉트 박스 오른쪽 여백 추가 */
            font-size: 16px; /* 폰트 크기 조정 */
            height: auto;
        }

        .search_filter {
            padding: 5px; /* 입력 필드 내부 패딩 추가 */
            border: 1px solid #ccc; /* 테두리 추가 */
            border-radius: 5px; /* 테두리 둥글게 만듭니다. */
            font-size: 16px; /* 폰트 크기 조정 */
            display: inline;
        }

        /* 선택된 셀렉트 박스 옵션 스타일 */
        .select_filter option:checked {
            background-color: #f2f2f2;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="wrap">
    <jsp:include page="../include/header.jsp"></jsp:include>
    <jsp:include page="./myclassTopbar.jsp"></jsp:include>

    <div class="content-wrap" style="display: flex;justify-content: center;">
        <div class="content-section">
            <%--<h5 class="font"> 작성글관리 > </h5>--%>
            <br>
            <div class="content">
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
                    <jsp:include page="./myclassIntro.jsp"></jsp:include>


                    <%--강의 목차--%>
                    <%-- 강의 소개 처럼 따로 jsp파일에 넣어서 해봤는데 잘 안되서 그냥 여기에 코드 넣음 (오세훈) --%>
                    <div id="ud_tab-content2" class="ud_content">
                        <%--<h5> 강의 목차 </h5>--%>
                        <div id="search_from2" class="search_from">
                            <select name="select_filter2" id="select_filter2" class="select_filter">
                                <option value="0">강의번호</option>
                                <option value="1">강의명</option>
                                <option value="2">작성자</option>
                                <option value="3">내용</option>
                            </select>
                            <input type="text" name="search_filter2" id="search_filter2" class="search_filter">
                        </div>
                        <table id="myTable2" class="table">
                            <thead>
                            <tr>
                                <th style="width: 10%">순번</th>
                                <th style="width: 50%; text-align: center">강의명</th>
                                <th style="width: 10%; text-align: center">강의 과목</th>
                                <th style="width: 10%; text-align: center">강사</th>
<%--                                <th style="width: 10%; text-align: center">시간</th>--%>
                                <%--                                <th style="width: 10%; text-align: center">최근 학습일</th>--%>
                                <%--                                <th style="width: 10%; text-align: center">학습 완료</th>--%>
                                <th style="width: 10%; text-align: center">학습 하기</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="video" items="${videoList }" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${video}</td>
                                    <td>${lecture.cate }</td>
                                    <td>${inst.name }</td>
                                        <%--                                    <td>${vtl.get(status.index)} 초</td>--%>
                                    <td>
                                        <a href="javascript:void(0);" onclick="openVideoWindow('${path}/lecture/getLecVideo?sfile=${videoList2.get(status.index)}')" target="_blank">학습</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
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
                                     <td><button type="button" class ="origin" onclick="location.href='${path}/board/detail.do?bno=${board_comlist.num}'">원문보기</button></td>
                                 </tr>

                             </c:forEach>
                             </tbody>--%>
                        </table>
                    </div>

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
                                     <td><button type="button" class ="origin" onclick="location.href='${path}/board/detail.do?bno=${board_comlist.num}'">원문보기</button></td>
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
                                     <td><button type="button" class ="origin" onclick="location.href='${path}/board/detail.do?bno=${board_comlist.num}'">원문보기</button></td>
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
                                     <td><button type="button" class ="origin" onclick="location.href='${path}/board/detail.do?bno=${board_comlist.num}'">원문보기</button></td>
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

<%-- 강의 창 띄울때 사이즈 조절하는 js 코드 --%>
<script>
    function openVideoWindow(url) {
        var width = 800;
        var height = 400;
        var left = (window.innerWidth - width) / 2;
        var top = (window.innerHeight - height) / 2;

        window.open(url, 'VideoPlayer', 'width=' + width + ',height=' + height + ',left=' + left + ',top=' + top);
    }
</script>
<%-- datatables 관련 코드가 들어있는 스크립트 파일 --%>
<script src="${path}/resources/js/myStudy/myclassDetail.js"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
