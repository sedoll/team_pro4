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
    <link href="${path}/resources/css/starrr.css"/>
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

        #ud_tab-content1 th {
            width: 170px;
        }

        #ud_tab-content1 td {
            padding-right: 100px;
        }

        #myTable2 {
            font-size: 20px;
        }


    </style>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="wrap">
    <jsp:include page="./myclassTopbar.jsp"></jsp:include>


    <div class="content-wrap" style="display: flex;justify-content: center;">
        <div class="content-section">
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
                    <div id="ud_tab-content1" class="ud_content">
                        <h3> 강좌 정보 </h3>
                        <table style="font-size: 25px">
                            <c:forEach items="${takingList }" var="takingList" varStatus="status">
                                <tr>
                                    <th>강좌 제목</th>
                                    <td> ${takingList.lecTitle }</td>
                                </tr>

                                <tr>
                                    <th>강좌 설명</th>
                                    <td>${takingList.lecContent }</td>
                                </tr>

                                <tr>
                                    <th>강사</th>
                                    <td>${takingList.insName }</td>
                                </tr>

                                <tr>
                                    <th>대상 학년</th>
                                    <td> ${takingList.slevel} </td>
                                </tr>

                                <tr>
                                    <th>제작 강의수</th>
                                    <td>${cnt}개</td>
                                </tr>

                                <tr>
                                    <th>강좌 관심수</th>
                                    <td> 강좌 관심수</td>
                                </tr>

                                <tr>
                                    <th>평균 별점</th>
                                    <c:choose>
                                        <c:when test="${empty avg || avg eq ''}">
                                            <td>0/5</td>
                                        </c:when>

                                        <c:otherwise>
                                            <td class="starRating" data-score="${avg}"></td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>

                                <tr>
                                    <th>관련 교재</th>
                                    <td> 교재</td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>


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
                                        <a href="javascript:void(0);"
                                           onclick="openVideoWindow('${path}/lecture/getLecVideo?sfile=${videoList2.get(status.index)}')"
                                           target="_blank">학습</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>


                    <%--공지사항--%>
                    <div id="ud_tab-content3" class="ud_content">

                        <div class="content" id="content">
                            <div class="row column text-center">
                                <div class="container">
                                    <table id="myTable2">
                                        <thead>
                                        <tr>
                                            <th width="80">No</th>
                                            <th>Title</th>
                                            <th width="120">RegDate</th>
                                            <th width="100">Visited</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${instructorNotices}" var="notice" varStatus="status">
                                            <tr>
                                                <td>${status.count }</td>
                                                <td>
                                                    <a href="${path14}/instructor/instructorNoticeDetail.do?noticeNo=${notice.no }&no=${instructor.no}">${notice.title }</a>
                                                </td>
                                                <td>
                                                    <fmt:parseDate value="${notice.resdate }" var="resdate"
                                                                   pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                                </td>
                                                <td>${notice.cnt }</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <c:if test='${sid eq "admin"}'>
                                        <div class="button-group">
                                            <a class="button is-link is-outlined"
                                               href="${path}/notice/insert.do">글쓰기</a>
                                        </div>
                                    </c:if>

                                </div>

                            </div>
                        </div>
                    </div>


                    <%--QnA--%>
                    <div id="ud_tab-content4" class="ud_content">

                        <div class="container">
                            <table id="myTable2">
                                <thead>
                                <tr>
                                    <th width="80">No</th>
                                    <th>제목</th>
                                    <th width="120">등록일</th>
                                    <th width="100">조회수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${qnaList }" var="board" varStatus="status">
                                    <tr>
                                        <td>${status.count }</td>
                                        <c:choose>
                                            <c:when test="${empty board.pw || board.pw eq ''}">
                                                <td><a href="${path}/qna/detail.do?bno=${board.bno}">${board.title}</a>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>
                                                    <a href="${path}/qna/qnapw.do?bno=${board.bno}">[비밀글] ${board.title}</a>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>
                                            <fmt:parseDate value="${board.resdate }" var="resdate"
                                                           pattern="yyyy-MM-dd HH:mm:ss"/>
                                            <fmt:formatDate value="${resdate }" pattern="yyyy-MM-dd"/>
                                        </td>
                                        <td>${board.cnt }</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <c:if test='${not empty sid}'>
                                <div class="button-group">
                                    <a class="button is-link is-outlined" href="${path}/qna/insert.do">글쓰기</a>
                                </div>
                            </c:if>

                        </div>
                    </div>


                    <%--수강 후기--%>
                    <div id="ud_tab-content5" class="ud_content">

                        <table class="table is-fullwidth" id="myTable2">
                            <thead>
                            <tr>
                                <th class="rev">강의</th>
                                <th class="rev">점수</th>
                                <th class="rev-con">댓글</th>
                                <th class="rev2">작성일</th>
                                <%--                            <th class="rev2">비고</th>--%>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="lev" items="${reviewList }">
                                <tr>
                                    <td><a href="${path14}/lecture/getLecture?no=${lev.lno}">${lev.title}</a></td>
                                    <td>${lev.score}</td>
                                    <td>${lev.content}</td>
                                    <td>${lev.resdate}</td>
                                        <%--                                <td>--%>
                                        <%--                                    <c:if test="${sid eq lev.id || sid eq 'admin'}">--%>
                                        <%--                                        <a href="${path14}/review/updateReviewForm.do?par=${pro.no}" class="button is-info">수정</a>--%>
                                        <%--                                        <a href="${path14}/review/deleteReview.do?par=${pro.no}" class="button is-danger"> 삭제 </a>--%>
                                        <%--                                    </c:if>--%>
                                        <%--                                </td>--%>
                                </tr>
                            </c:forEach>
                            </tbody>
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

<script>
    $(document).ready(function() {
        const filledStarPath = '${path}/resources/img/star.png';
        const emptyStarPath = '${path}/resources/img/empty_star.png';

        function renderStars($starContainer, score) {
            $starContainer.empty(); // 기존 내용을 지웁니다.
            for (let i = 1; i <= 5; i++) {
                const starPath = i <= score ? filledStarPath : emptyStarPath;
                const $star = $('<img>').attr('src', starPath)
                    .attr('alt', 'star')
                    .width(20)
                    .height(20);
                $starContainer.append($star);
            }
        }

        $('.starRating').each(function() {
            const $this = $(this);
            const score = $this.data('score');
            renderStars($this, score);
        });
    });
</script>

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
            'margin-top': '14px',
            'margin-right': '280px'
        });
        $('#myTable_paginate').css({
            'margin-right': '120px'
        });
    });
</script>

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
