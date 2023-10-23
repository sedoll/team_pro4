<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성적표 수정</title>
    <!-- 헤드 부분 인클루드 -->
    <jsp:include page="../include/head.jsp"></jsp:include>
    <style>
        .hero {
            height: 250px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<div class="page_wrap">
    <jsp:include page="../include/header.jsp"></jsp:include>
    <jsp:include page="../myclass/myclassTopbar.jsp"></jsp:include>
<figure class="visual" id="vs1">
    <ul class="imgbox">
        <li class="hero is-white is-medium">
            <div class="hero-body has-text-centered">
                <p class="title is-size-3">
                    성적표 수정
                </p>
                <p class="subtitle is-size-5">
                </p>
            </div>
        </li>
    </ul>
    <nav class="breadcrumb is-small has-bullet-separator is-right" aria-label="breadcrumbs">
        <ul>
            <li><a href="#">Bulma</a></li>
            <li><a href="#">Documentation</a></li>
            <li><a href="#">Components</a></li>
            <li class="is-active"><a href="#" aria-current="page">Breadcrumb</a></li>
        </ul>
    </nav>
</figure>
<div class="content" id="content">
<div class="container is-fullhd">
    <!-- 헤더 부분 인클루드 -->
        <div class="row column text-center">
            <div class="container">
                <form action="${path}/grade/gradeedit.do?no=${grade.no}" method="post">
                    <div class="table_form_wrap">
                        <table class="table_form">
                            <tbody>
                            <tr>
                                <th>시험 종류</th>
                                <td>

                                    <div class="select">
                                        <select name="exam"  value="${grade.exam}">
                                            <option value="1학기 중간고사">1학기 중간고사</option>
                                            <option value="1학기 기말고사">1학기 기말고사</option>
                                            <option value="2학기 중간고사">2학기 중간고사</option>
                                            <option value="2학기 기말고사">2학기 기말고사</option>
                                        </select>
                                        <input type="hidden" name="exam" id="exam" value="${grade.exam}">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>국어</th>
                                <td><input type="text" name="kor" id="kor" class="input"  value="${grade.kor}"></td>
                            </tr>
                            <tr>
                                <th>수학</th>
                                <td><input type="text" name="math" id="math"  class="input" value="${grade.math}"></td>
                            </tr>
                            <tr>
                                <th>영어</th>
                                <td><input type="text" name="eng" id="eng" class="input" value="${grade.eng}"></td>
                            </tr>
                            <tr>
                                <th>사회</th>
                                <td><input type="text" name="social" id="social" class="input" value="${grade.social}"></td>
                            </tr>
                            <tr>
                                <th>과학</th>
                                <td><input type="text" name="science" id="science" class="input" value="${grade.science}"></td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="1">
                                    <input type="submit" class="button is-link is-outlined" value="등록하기">
                                    <a href="${path }/grade/gradedelete.do?no=${grade.no}" class="button is-danger is-outlined">성적 삭제</a>
                                    <a href="${path }/grade/list.do" class="button is-black is-outlined">회원 목록</a>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </form>
            </div>
            </div>
        </div>
</div>
</div>
        <!-- 푸터 부분 인클루드 -->
        <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>