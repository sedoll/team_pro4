<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <%@include file="../include/head.jsp"%>
</head>
<body>
<div class="content" id="content">
    <div class="container is-fullhd">
        <!-- title -->
        <section class="hero is-small is-dark">
            <div class="hero-body">
                <p class="title">
                    일정 수정
                </p>
            </div>
        </section>
        <!-- title -->
        <div class="row column text-center">
            <div class="container">
                <form action="${path}/calendar/edit.do?no=${calendar.no}" method="post" id="calendarForm">
                    <div class="table_form_wrap">
                        <table class="table_form">
                            <tbody>
                            <tr>
                                <th>그룹명</th>
                                <td>
                                    <div class="select">
                                        <select name="groupId"  value="${calendar.groupId}">
                                            <option value="1">수업 수강 관련</option>
                                            <option value="2">개인 일정 관련</option>
                                        </select>
                                        <input type="hidden" name="groupId" id="groupId" value="${calendar.groupId}">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>일정명</th>
                                <td><input type="text" name="title" id="title" class="input"  value="${calendar.title}"></td>
                            </tr>
                            <tr>
                                <th>일정 내용</th>
                                <td><textarea class="textarea" name="content" cols="30" rows="10" value="${calendar.content}"></textarea></td>
                            </tr>
                            <tr>
                                <th>시작일</th>
                                <td><input type="date" name="start" id="start" class="input" value="${calendar.start}"></td>
                            </tr>
                            <tr>
                                <th>종료일</th>
                                <td><input type="date" name="end" id="end" class="input" value="${calendar.end}"></td>
                            </tr>
                            <tr>
                                <th>글자색</th>
                                <td>
                                    <div class="select">
                                        <select name="textColor"  value="${calendar.textColor}">
                                            <option value="red">red</option>
                                            <option value="black">black</option>
                                            <option value="white">white</option>
                                            <option value="blue">blue</option>
                                            <option value="green">green</option>
                                            <option value="navy">navy</option>
                                            <option value="yellow">yellow</option>
                                            <option value="silver">silver</option>
                                            <option value="purple">purple</option>
                                            <option value="pink">pink</option>
                                            <option value="lightpink">lightpink</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>배경색</th>
                                <td>
                                    <div class="select">
                                        <select name="backgroundColor"  value="${calendar.backgroundColor}">
                                            <option value="red">red</option>
                                            <option value="black">black</option>
                                            <option value="white">white</option>
                                            <option value="blue">blue</option>
                                            <option value="green">green</option>
                                            <option value="navy">navy</option>
                                            <option value="yellow">yellow</option>
                                            <option value="silver">silver</option>
                                            <option value="purple">purple</option>
                                            <option value="pink">pink</option>
                                            <option value="lightpink">lightpink</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>테두리색</th>
                                <td>
                                    <div class="select">
                                        <select name="borderColor"  value="${calendar.borderColor}">
                                            <option value="red">red</option>
                                            <option value="black">black</option>
                                            <option value="white">white</option>
                                            <option value="blue">blue</option>
                                            <option value="green">green</option>
                                            <option value="navy">navy</option>
                                            <option value="yellow">yellow</option>
                                            <option value="silver">silver</option>
                                            <option value="purple">purple</option>
                                            <option value="pink">pink</option>
                                            <option value="lightpink">lightpink</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="1">
                                    <input type="submit" class="button is-link is-medium is-outlined" value="등록하기">
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
</body>
</html>
