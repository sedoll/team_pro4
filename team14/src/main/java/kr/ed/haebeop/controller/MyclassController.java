package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Course;
import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.MyClassVO;
import kr.ed.haebeop.service.CourseService;
import kr.ed.haebeop.service.InstService;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.MyclassService;
import kr.ed.haebeop.util.DateCalculator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    HttpSession session;


    // 수강 중인 강의 리스트 가져오기
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
    @RequestMapping(value = "/myclassDetail", method = RequestMethod.GET)
    public String myclassDetail(Model model, HttpServletRequest req) {
        int no = Integer.parseInt(req.getParameter("no"));

        return "myclass/myclassDetail";
    }


    // 강좌안에 강의목차 리스트
    @RequestMapping(value = "/myclassDetailList", method = RequestMethod.GET)
    public String myclassList(Model model, HttpServletRequest req) {
        int no = Integer.parseInt(req.getParameter("no"));

        return "myclass/myclassDetailList";
    }

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
