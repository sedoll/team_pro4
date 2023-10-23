package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Calendar;
import kr.ed.haebeop.service.CalendarServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/calendar/*")
public class CalendarContoller {
    @Autowired
    private CalendarServiceImpl calendarService;

    @GetMapping("list.do")
    public String calendarList(HttpSession session, Model model) throws Exception{
        String id = (String) session.getAttribute("sid");
        List<Calendar> calendarList = calendarService.calendarList(id);

        model.addAttribute("calendarList", calendarList);
        return "calendar/calendar";
    }

    @GetMapping("detail.do")
    public String getCalendar(HttpServletRequest request, Model model,HttpSession session) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Calendar calendar = calendarService.getCalendar(no);
        model.addAttribute("calendar", calendar);
        return "/calendar/calendarDetail";
    }

    //일정 추가 폼
    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception{
        return "/calendar/calendarInsert";
    }

    //일정 추가
    @PostMapping("insert.do")
    public String calendarInsert(HttpServletRequest request, Model model) throws Exception{
        Calendar calendar = new Calendar();
        calendar.setId(request.getParameter("id"));
        calendar.setTitle(request.getParameter("title"));
        calendar.setContent(request.getParameter("content"));
        calendar.setStart(request.getParameter("start"));
        calendar.setEnd(request.getParameter("end"));
        calendar.setTextColor(request.getParameter("textColor"));
        calendar.setBackgroundColor(request.getParameter("backgroundColor"));
        calendar.setBorderColor(request.getParameter("borderColor"));
        calendarService.calendarInsert(calendar);
        return "/calendar/blankpage"; // blankpage 이동, 리스트 창 새로고침 후 부모창 닫을 예정
    }

    //일정 수정 폼
    @GetMapping("edit.do")
    public String editForm(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Calendar calendar = calendarService.getCalendar(no);
        model.addAttribute("calendar", calendar);
        return "/calendar/calendarEdit";
    }

    //일정 수정
    @PostMapping("edit.do")
    public String calendarEdit(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        Calendar calendar = new Calendar();
        calendar.setNo(no);
        calendar.setTitle(request.getParameter("title"));
        calendar.setContent(request.getParameter("content"));
        calendar.setStart(request.getParameter("start"));
        calendar.setEnd(request.getParameter("end"));
        calendar.setTextColor(request.getParameter("textColor"));
        calendar.setBackgroundColor(request.getParameter("backgroundColor"));
        calendar.setBorderColor(request.getParameter("borderColor"));
        calendarService.calendarEdit(calendar);
        return "/calendar/blankpage";
    }

    //일정 삭제
    @GetMapping("delete.do")
    public String calendarDelete(HttpServletRequest request, Model model) throws Exception{
        int no = Integer.parseInt(request.getParameter("no"));
        calendarService.calendarDelete(no);
        return "/calendar/blankpage";
    }

}