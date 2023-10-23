<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath() %>"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
    <script src='${path}/resources/fullcalendar-6.1.9/dist/index.global.js'></script>
    <title>calendar</title>
    <%@include file="../include/head.jsp"%>

    <style>

        body {
            margin: 40px 10px;
            padding: 0;
            font-family: 'NanumSquare' !important;
            font-size: 16px;
        }

        #calendar {
            max-width: 1100px;
            margin: 0 auto;
        }

        .reg-button{
            margin-left: 1558px;
            height: 30px;
            width: 102px;
            top: 30px;
            font-size: 12px;
            background-color: #007BFF;
            color: black;
        }
        .section-middle{
            padding-top: 0px;
        }

        .content-container{
            width: 624px;
            margin-right: 1000px;
            border-bottom: rgb(229, 229, 229) solid 1px;
        }

        .container h4{
            width: 150px;
            margin-left: 250px;
            margin-top: 50px;
            padding-bottom: 20px;
        }

        .fc-day-sun a{
            color: red;
        }

        .fc-day-mon a{color: black;}
        .fc-day-tue a{color: black;}
        .fc-day-wed a{color: black;}
        .fc-day-thu a{color: black;}
        .fc-day-fri a{color: black;}





    </style>
</head>
<body>
<div class="page_wrap">
    <%@include file="../include/header.jsp"%>
    <%@include file="../myclass/myclassTopbar.jsp"%>
    <div class="container content-container">
        <h4 class="title is-4">학습계획표</h4>
    </div>
    <div class="section section-middle">
    <div class="registar-btn">
        <button class="button reg-button is-link is-medium is-outlined" onclick="window.open('${path}/calendar/insert.do', '_blank', 'popup=true')">일정등록</button>
    </div>
    <div id='calendar'></div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            themeSystem: 'bootstrap5',
            locale:'ko',
            editable: true,
            selectable: true,
            businessHours: true,
            dayMaxEvents: true, // allow "more" link when too many events
            events:
                [
                    <c:forEach items="${calendarList}" var="calen">
                    {
                        no: '${calen.no}',
                        groupId: '${calen.groupId}',
                        title: '${calen.title}',
                        start: '${calen.start}',
                        end: '${calen.end}',
                        rurl : '${path}/calendar/detail.do?no=${calen.no}',
                        textColor: '${calen.textColor}',
                        backgroundColor:'${calen.backgroundColor}',
                        borderColor:'${calen.borderColor}'
                    },
                    </c:forEach>
                ],
            eventClick: function (info){
                let popOption = 'width=1344px, height=570px, top=50px, left=50px, _blank, popup=true';
                let url = info.event.extendedProps.rurl;
                var zz;
                zz = window.open(url,'popup=yes',popOption);
                zz.foucus();
            }
        });

        calendar.render();
    });

</script>
<%@include file="../include/footer.jsp"%>
</body>
</html>