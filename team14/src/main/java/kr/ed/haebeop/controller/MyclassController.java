package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.*;
import kr.ed.haebeop.service.*;
import kr.ed.haebeop.util.DateCalculator;
import kr.ed.haebeop.util.VideoTimeCut;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@Slf4j
@RequestMapping("/myclass/*")
public class MyclassController {


    @Autowired
    private MyclassService myclassService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private LectureService lectureService;

    @Autowired
    private InstService instService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    HttpSession session;

    @GetMapping("myclassList.do")		// board/list.do
    public String myclassList(Model model) throws Exception {
        List<MyClassVO> myclassList= myclassService.myclassList();
        model.addAttribute("myclassList", myclassList);
        return "/myclass/";
    }


    // 해당회원이 수강 중인 강의 리스트 가져오기
    @RequestMapping("myclassIndex.do")
    public String myclassIndex(Model model) throws Exception {
        DateCalculator dateCalculator = new DateCalculator();
        String id = (String) session.getAttribute("sid");
        List<MyClassVO> myclassList = myclassService.getMyclassList(id);

        //출력해보기
        System.out.println(myclassList.toString());

        String ck ="";
        int Ddays = 0;
        for(MyClassVO myClass : myclassList) {
            //테스트
            //String strDate = "2023-10-17";

            String strDate = myClass.getLecStudyend(); // 기준 날짜 데이터 (("yyyy-MM-dd")의 형태)
            String todayFm = new SimpleDateFormat("yyyy-MM-dd").format(new Date(System.currentTimeMillis())); // 오늘날짜

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date date = new Date(dateFormat.parse(strDate).getTime());
            Date today = new Date(dateFormat.parse(todayFm).getTime());

            long calculate = date.getTime() - today.getTime();

            Ddays = (int) (calculate / ( 24*60*60*1000));

            System.out.println(myClass.getLecTitle()+ " : 남은 기간: " + Ddays);


            Course course = new Course();

            if(Ddays < 0){
                course.setSid(id);
                course.setLec_no(myClass.getLec_no());
                course.setCheck(3);
                courseService.checkUpdate(course);
            }


            System.out.println(myClass);

            int check = myClass.getCk();

            System.out.println(check);

            if(check == 1){
                ck = "수강 중";
            }else if (check == 2){
                ck = "수강 정지";
            }else if(check == 3){
                ck = "수강 완료";
            }

            Map<String, Object> myclassMap = new HashMap<>();
            myclassMap.put("Ddays", Ddays);
            myclassMap.put("ck", ck);

            System.out.println(myclassList);
            System.out.println(myclassMap);
            model.addAttribute("myclassList", myclassList);
            myClass.setMyclassMap(myclassMap);
        }
        return "/myclass/myclassIndex";
    }


    // 수강신청한 강좌 디테일
    @RequestMapping(value = "/myclassDetail.do", method = RequestMethod.GET)
    public String myclassDetail(Model model, HttpServletRequest req) throws Exception {
        int no = Integer.parseInt(req.getParameter("no"));
        String id = (String) session.getAttribute("sid");
        List<MyClassVO> myclassList = myclassService.getMyclassList(id);

        /* 1. 강의소개 메뉴 */

        model.addAttribute("myclassList", myclassList);

        // region 2. 강의목차 메뉴
        Lecture lecture = lectureService.getLecture(no); // 강의 정보 추출
        List<String> videoList = new ArrayList<>(); // 비디오 이름 받기
        List<String> videoList2 = new ArrayList<>(); // 실제 저장된 UUID 비디오 이름
        List<String> vtl = new ArrayList<>(); // 비디오 길이 추출
        Instructor inst = instService.getInstructorName(lecture.getIno());
        
        // 서버 절대경로 주소
//        String path = req.getSession().getServletContext().getRealPath("/");
//        String path2 = req.getContextPath();
//        path = path.replace("\\", "/");
//        path2 = path2.replace("\\", "/");

        if(lecture.getSfile2()!=null) {
            String sfileName = lecture.getSfile2();
            String realName = lectureService.getLecFileName(sfileName);
            videoList.add(realName);
            videoList2.add(sfileName);
//            String t = VideoTimeCut.media_player_time(path2, path, sfileName);
//            vtl.add(t);
        }
        if(lecture.getSfile3()!=null) {
            String sfileName = lecture.getSfile3();
            String realName = lectureService.getLecFileName(sfileName);
            videoList.add(realName);
            videoList2.add(sfileName);
//            String t = VideoTimeCut.media_player_time(path2, path, sfileName);
//            vtl.add(t);
        }
        if(lecture.getSfile4()!=null) {
            String sfileName = lecture.getSfile4();
            String realName = lectureService.getLecFileName(sfileName);
            videoList.add(realName);
            videoList2.add(sfileName);
//            String t = VideoTimeCut.media_player_time(path2, path, sfileName);
//            vtl.add(t);
        }
        if(lecture.getSfile5()!=null) {
            String sfileName = lecture.getSfile5();
            String realName = lectureService.getLecFileName(sfileName);
            videoList.add(realName);
            videoList2.add(sfileName);
//            String t = VideoTimeCut.media_player_time(path2, path, sfileName);
//            vtl.add(t);
        }

        System.out.println(videoList);
        System.out.println(videoList2);
        System.out.println(lecture);
        System.out.println(inst);
        System.out.println(vtl);

//        model.addAttribute("vtl", vtl);
        model.addAttribute("videoList", videoList);
        model.addAttribute("videoList2", videoList2);
        model.addAttribute("lecture", lecture);
        model.addAttribute("inst", inst);
        // endregion

        return "myclass/myclassDetail";
    }


    /* 1. 강의소개 메뉴 */
    @RequestMapping(value = "/myclassDetail/myclassIntro.do", method = RequestMethod.GET)
    public String myclassIntro(Model model, HttpServletRequest req , RedirectAttributes rattr) throws Exception {
        int no = Integer.parseInt(req.getParameter("no"));
        String id = (String) session.getAttribute("sid");
        List<MyClassVO> myclassList = myclassService.getMyclassList(id);
        //model.addAttribute("myclassList", myclassList);

        // 데이터를 전달합니다.
        rattr.addFlashAttribute("myclassList", myclassList);

        // 리다이렉트할 경로를 반환합니다.
        return "redirect:/myclass/myclassIntro";
    }

//    @RequestMapping("/myclass/myclassIntro")
//    public ModelAndView intro(HttpServletRequest request){
//
//        return
//    }


    // 강의 영상 보기
    @RequestMapping(value = "/getLecVideo", method = RequestMethod.GET)
    public String getLecture(Model model, HttpServletRequest req) {
        int no = Integer.parseInt(req.getParameter("no"));
        Lecture product = lectureService.getLecture(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        Instructor inst = instService.getInstructorName(product.getIno()); // 강사 번호로 이름 추출

        model.addAttribute("pro", product);
        model.addAttribute("inst", inst);
        return "myclass/lecVideo";
    }


}
