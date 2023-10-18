package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.InstructorNotice;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.service.InstructorService;
import kr.ed.haebeop.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/instructor/*")
public class InstructorController {

    @Autowired
    private LectureService lectureService;

    @Autowired
    private InstructorService instructorService;

    @GetMapping("instructorList")		// board/list.do
    public String getInstructorList(HttpServletRequest request,Model model) throws Exception {

        String instructor = request.getParameter("instructor");

        //모든 강사 정보 불러옴.
        //활동 상태에 대한 컬럼이 필요한가? (선생님 목록에 노출 여부를 결정하기 위해.)
        //정렬 기준 : 수강생 수?
        //
        //



        return "/instructor/instructorList";
    }

    @GetMapping("instructorDetail.do")
    public String getInstructorDetail(HttpServletRequest request, Model model) throws Exception {
        String instructorName = request.getParameter("instructorName");

        model.addAttribute("instructorName",instructorName);
        return "/instructor/instructorDetail";
    }

    //강의 목록
    @GetMapping("instructorLecture.do")
    public String getInstructorLecture(HttpServletRequest request, Model model) throws Exception {
        String instructorName = request.getParameter("instructorName");
        List<Lecture> lectureList = instructorService.getInstructorLectureList(instructorName);

        model.addAttribute("instructorName",instructorName);
        model.addAttribute("lectureList", lectureList);
        return "/instructor/instructorLecture";
    }

    //공지
    @GetMapping("instructorNotice.do")
    public String getInstructorNotice(HttpServletRequest request, Model model) throws Exception {
        String instructorName = request.getParameter("instructorName");
        model.addAttribute("instructorName",instructorName);

        List<InstructorNotice> instructorNotices = instructorService.getInstructorNoticeList(instructorName);
        model.addAttribute("instructorNotices",instructorNotices);

        //이름으로 instructor id 가져오기
        Instructor instructor = instructorService.getInstructorId(instructorName);
        model.addAttribute("instructor",instructor);


        return "/instructor/instructorNotice";
    }

    //공지 상세 보기
    @GetMapping("instructorNoticeDetail.do")
    public String getInstructorNoticeDetail(HttpServletRequest request, Model model) throws Exception {
        String instructorName = request.getParameter("instructorName");
        model.addAttribute("instructorName",instructorName);
        int no = Integer.parseInt(request.getParameter("no"));
        InstructorNotice instructorNotice = instructorService.getInstructorNoticeDetail(no);
        model.addAttribute("instructorNotice",instructorNotice);

        return "/instructor/instructorNoticeDetail";
    }

    //QNA
    @GetMapping("instructorQNA.do")
    public String getInstructorQNA(HttpServletRequest request, Model model) throws Exception {
        String instructorName = request.getParameter("instructorName");
        model.addAttribute("instructorName",instructorName);


        return "/instructor/instructorQNA";
    }

    //자료실
    @GetMapping("instructorFile.do")
    public String getInstructorFile(HttpServletRequest request, Model model) throws Exception {
        String instructorName = request.getParameter("instructorName");
        model.addAttribute("instructorName",instructorName);


        return "/instructor/instructorFile";
    }

    //후기
    @GetMapping("instructorReview.do")
    public String getInstructorReview(HttpServletRequest request, Model model) throws Exception {
        String instructorName = request.getParameter("instructorName");
        model.addAttribute("instructorName",instructorName);


        return "/instructor/instructorReview";
    }



}
