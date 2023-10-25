<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        #search_from {
            text-align: right;
            font-size: 18px;
            margin-bottom: 20px; /* 아래쪽 여백 추가 */
        }
        #select_filter {
            padding: 5px; /* 셀렉트 박스 내부 패딩 추가 */
            border: 1px solid #ccc; /* 테두리 추가 */
            border-radius: 5px; /* 테두리 둥글게 만듭니다. */
            margin-right: 10px; /* 셀렉트 박스 오른쪽 여백 추가 */
            font-size: 16px; /* 폰트 크기 조정 */
        }

        #search_filter {
            padding: 5px; /* 입력 필드 내부 패딩 추가 */
            border: 1px solid #ccc; /* 테두리 추가 */
            border-radius: 5px; /* 테두리 둥글게 만듭니다. */
            font-size: 16px; /* 폰트 크기 조정 */
        }

        /* 선택된 셀렉트 박스 옵션 스타일 */
        #select_filter option:checked {
            background-color: #f2f2f2;
            font-weight: bold;
        }
    </style>
</head>
<body>
<!-- 헤더 부분 인클루드 -->
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="hero is-white">
    <div class="hero-body has-text-centered">
        <p class="title is-size-3">
        </p>
        <p class="subtitle">

        </p>
    </div>
</section>

<div class="container">
    <div class="columns">
        <jsp:include page="./adminMenu.jsp"></jsp:include>


<%--        -----------------이하 컨텐츠 부분--------------------------   ----%>
        <div class="column is-9">
            <nav class="breadcrumb" aria-label="breadcrumbs">
                <ul>
                    <li><a href="../">Haebeop</a></li>
                    <li class="is-active"><a href="#" aria-current="page">Admin</a></li>
                </ul>
            </nav>
            <section class="hero is-white welcome is-small">
                <div class="hero-body">
                    <div class="container">
                        <h1 class="title" style="text-align: center">
                            회원 목록
                        </h1>
                    </div>
                </div>
            </section>
            <div  id="search_from">
                <select name="select_filter" id="select_filter">
                    <option value="1">아이디</option>
                    <option value="2">이름</option>
                    <option value="3">전화번호</option>
                    <option value="4">이메일</option>
                    <option value="5">직분</option>
                    <option value="6">가입일</option>
                </select>
                <input type="text" name="search_filter" id="search_filter">
            </div>
            <table class="table is-fullwidth" id="myTable">
                <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Tel</th>
                    <th>Email</th>
                    <th>Member Type</th>
                    <th>RegDate</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${memberList}" var="member" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td><a href="${path}/admin/memberDetail.do?id=${member.id}">${member.id}</a></td>
                        <td>${member.name}</td>
                        <td>${member.tel}</td>
                        <td>${member.email}</td>
                        <td>${member.job == 1 ? '일반회원' : (member.job == 2 ? '선생님' : '-')}</td>
                        <td>
                            <fmt:parseDate value="${member.regdate}" var="resdate" pattern="yyyy-MM-dd HH:mm:ss" />
                            <fmt:formatDate value="${resdate}" pattern="yyyy-MM-dd" />
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <script>
                $(document).ready( function () {
                    let $table = $('#myTable').DataTable({
                        //search 창 오른쪽 상단으로 이동
                        "dom": '<"top"i>rt<"bottom"flp><"clear">',

                        pageLength : 5,
                        order: [[6, 'desc']], // 0번째 컬럼을 기준으로 내림차순 정렬
                        info: false,
                        lengthChange: false, // show entries 제거
                        language: {
                            emptyTable: '등록된 게시글(이)가 없습니다.'
                        }
                    });

                    $('.dataTables_paginate').css({
                        'textAlign':'center',
                        'float': 'none',
                        'margin-top':'10px',
                    });

                    $('.dataTables_filter').remove();  // dataTable 자체 search input 없애기

                    $('#select_filter').change(function () { // select 선택값에 따라  해당 선택 열 input이 검색하는곳 변경
                        $table.columns('').search('').draw();
                        $table.columns(Number($('#select_filter').val())).search($('#search_filter').val()).draw();
                    });

                    $('#search_filter').keyup(function () { //input의 값대로 search
                        let $value = $(this).val();
                        $table.columns(Number($('#select_filter').val())).search($value).draw();
                    })
                });
            </script>
        </div>
    </div>
</div>


<footer id="footer" class="footer-nav row expanded collapse">
    <!-- 푸터 부분 인클루드 -->
    <jsp:include page="../include/footer.jsp"></jsp:include>
</footer>
</body>
</html>