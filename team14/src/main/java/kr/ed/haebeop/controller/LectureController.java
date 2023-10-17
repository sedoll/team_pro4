package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.PayCheck;
import kr.ed.haebeop.domain.Payment;
import kr.ed.haebeop.service.InstService;
import kr.ed.haebeop.service.LectureService;
import kr.ed.haebeop.service.PaymentService;
import kr.ed.haebeop.util.DateCalculator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/lecture/*")
public class LectureController {

    @Resource(name="uploadPath")
    String uploadPath;

    @Autowired
    private LectureService lectureService;
    @Autowired
    private InstService instService;
    @Autowired
    private PaymentService paymentService;
    @Autowired
    HttpSession session; // 세션 생성

    @RequestMapping(value = "/addLectureForm", method = RequestMethod.GET)
    public String addLectureForm(Model model) {
        String msg = "관리자의 상품 등록폼이 로딩되었습니다.";
        List<Instructor> instList = instService.getInstructorList();
        model.addAttribute("msg", msg);
        model.addAttribute("instList", instList);
        return "admin/addLecture";
    }

    @PostMapping("/addLecture")
    public String addLecture(HttpServletRequest req, Model model) {
        MultipartHttpServletRequest files = (MultipartHttpServletRequest) req;

        // 파일 처리
        MultipartFile simg = files.getFile("simg");
        MultipartFile sfile1 = files.getFile("sfile1");
        MultipartFile sfile2 = files.getFile("sfile2");
        MultipartFile sfile3 = files.getFile("sfile3");
        MultipartFile sfile4 = files.getFile("sfile4");
        MultipartFile sfile5 = files.getFile("sfile5");

        // 다른 폼 필드 처리
        Lecture lecture = new Lecture();
        lecture.setCate(files.getParameter("cate"));
        lecture.setSlevel(files.getParameter("level1") + " " + files.getParameter("level2"));
        lecture.setTitle(files.getParameter("title"));
        lecture.setContent(files.getParameter("content"));
        lecture.setPrice(Integer.parseInt(files.getParameter("price")));
        lecture.setIno(Integer.parseInt(files.getParameter("ino")));
        lecture.setLec_max(Integer.parseInt(files.getParameter("lec_max")));
        lecture.setAplctClss1(files.getParameter("aplctClss1"));
        lecture.setAplctClss2(files.getParameter("aplctClss2"));
        lecture.setStudyStart(files.getParameter("studystart"));
        lecture.setStudyEnd(files.getParameter("studyend"));

        // 개발 서버 파일 저장 경로
        String uploadDir = "D:/spring_study/pro04/src/main/webapp/resources/upload/"; // 회사
        // String uploadDir = "E:/git/spring_study/pro04/src/main/webapp/resources/upload/"; // 집
        // 실제 서버 파일 저장 경로
        String uploadSev = req.getRealPath("/resources/upload/");

        if (!simg.isEmpty()) {
            String randomUUID = UUID.randomUUID().toString(); // 파일 이름 중복 방지를 위한 랜덤 설정
            String OriginalFilename = simg.getOriginalFilename();
            String Extension = OriginalFilename.substring(OriginalFilename.lastIndexOf("."));
            String RandomFileName = randomUUID + Extension;
            lecture.setSimg(RandomFileName);

            try {
                simg.transferTo(new File(uploadDir + RandomFileName));
                simg.transferTo(new File(uploadSev + RandomFileName));
            } catch (IOException e) {
                e.printStackTrace(); // 오류 처리
            }
        }

        if (!sfile1.isEmpty()) {
            String randomUUID = UUID.randomUUID().toString(); // 파일 이름 중복 방지를 위한 랜덤 설정
            String OriginalFilename = sfile1.getOriginalFilename();
            String Extension = OriginalFilename.substring(OriginalFilename.lastIndexOf("."));
            String RandomFileName = randomUUID + Extension;
            lecture.setSfile1(RandomFileName);

            try {
                sfile1.transferTo(new File(uploadDir + RandomFileName)); // 개발 서버용
                sfile1.transferTo(new File(uploadSev + RandomFileName)); // 운영 서버용
            } catch (IOException e) {
                e.printStackTrace(); // 오류 처리
            }
        }

        if (!sfile2.isEmpty()) {
            String randomUUID = UUID.randomUUID().toString(); // 파일 이름 중복 방지를 위한 랜덤 설정
            String OriginalFilename = sfile2.getOriginalFilename();
            String Extension = OriginalFilename.substring(OriginalFilename.lastIndexOf("."));
            String RandomFileName = randomUUID + Extension;
            lecture.setSfile2(RandomFileName);

            try {
                sfile2.transferTo(new File(uploadDir + RandomFileName)); // 개발 서버용
                sfile2.transferTo(new File(uploadSev + RandomFileName)); // 운영 서버용
            } catch (IOException e) {
                e.printStackTrace(); // 오류 처리
            }
        }

        if (!sfile3.isEmpty()) {
            String randomUUID = UUID.randomUUID().toString(); // 파일 이름 중복 방지를 위한 랜덤 설정
            String OriginalFilename = sfile3.getOriginalFilename();
            String Extension = OriginalFilename.substring(OriginalFilename.lastIndexOf("."));
            String RandomFileName = randomUUID + Extension;
            lecture.setSfile3(RandomFileName);

            try {
                sfile3.transferTo(new File(uploadDir + RandomFileName)); // 개발 서버용
                sfile3.transferTo(new File(uploadSev + RandomFileName)); // 운영 서버용
            } catch (IOException e) {
                e.printStackTrace(); // 오류 처리
            }
        }

        if (!sfile4.isEmpty()) {
            String randomUUID = UUID.randomUUID().toString(); // 파일 이름 중복 방지를 위한 랜덤 설정
            String OriginalFilename = sfile4.getOriginalFilename();
            String Extension = OriginalFilename.substring(OriginalFilename.lastIndexOf("."));
            String RandomFileName = randomUUID + Extension;
            lecture.setSfile4(RandomFileName);

            try {
                sfile4.transferTo(new File(uploadDir + RandomFileName)); // 개발 서버용
                sfile4.transferTo(new File(uploadSev + RandomFileName)); // 운영 서버용
            } catch (IOException e) {
                e.printStackTrace(); // 오류 처리
            }
        }

        if (!sfile5.isEmpty()) {
            String randomUUID = UUID.randomUUID().toString(); // 파일 이름 중복 방지를 위한 랜덤 설정
            String OriginalFilename = sfile5.getOriginalFilename();
            String Extension = OriginalFilename.substring(OriginalFilename.lastIndexOf("."));
            String RandomFileName = randomUUID + Extension;
            lecture.setSfile5(RandomFileName);

            try {
                sfile5.transferTo(new File(uploadDir + RandomFileName)); // 개발 서버용
                sfile5.transferTo(new File(uploadSev + RandomFileName)); // 운영 서버용
            } catch (IOException e) {
                e.printStackTrace(); // 오류 처리
            }
        }

        lectureService.addLecture(lecture);

        return "redirect:/lecture/lecList";
    }

    @RequestMapping(value = "/deleteLecture", method = RequestMethod.GET)
    public String deleteLecture(@RequestParam("no") int no) {
        lectureService.delLecture(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        return "redirect:/product/proList";
    }

    @RequestMapping(value = "/likeLecture", method = RequestMethod.GET)
    public String likeLecture(Model model, @RequestParam("pno") String pno, @RequestParam("sid") String sid) {
        return "redirect:/product/getLecture?no=" + pno;
    }

    @RequestMapping(value = "/getLecture", method = RequestMethod.GET)
    public String getLecture(Model model, @RequestParam("no") int no) {
        lectureService.countUp(no); // 조회수 갱신
        Lecture product = lectureService.getLecture(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        Instructor inst = instService.getInstructorName(product.getIno()); // 강사 번호로 이름 추출
        // 강의 영상 개수 카운트
        int cnt = 0;
        if(product.getSfile2()!=null) cnt += 1;
        if(product.getSfile3()!=null) cnt += 1;
        if(product.getSfile4()!=null) cnt += 1;
        if(product.getSfile5()!=null) cnt += 1;
        
        model.addAttribute("pro", product);
        model.addAttribute("cnt", cnt);
        model.addAttribute("inst", inst);
        return "lecture/getLecture";
    }

    @RequestMapping(value = "/getLecVideo", method = RequestMethod.GET)
    public String getLecture(Model model, HttpServletRequest req) {
        int no = Integer.parseInt(req.getParameter("no"));
        Lecture product = lectureService.getLecture(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        Instructor inst = instService.getInstructorName(product.getIno()); // 강사 번호로 이름 추출

        model.addAttribute("pro", product);
        model.addAttribute("inst", inst);
        return "member/myPage/lecVideo";
    }

    @RequestMapping(value = "/updateLectureForm", method = RequestMethod.GET)
    public String updateLectureForm(Model model, @RequestParam("no") int no) {
        Lecture product = lectureService.getLecture(no); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        model.addAttribute("product", product);
        return "admin/updateLecture";
    }

    @RequestMapping(value = "/updateLecture", method = RequestMethod.POST)
    public String updateLecture(Model model, @ModelAttribute Lecture product) {
        lectureService.updateLecture(product); // 서비스 클래스에 비즈니스 로직을 정의하고 호출
        return "redirect:/product/getLecture?no=" + product.getNo();
    }

    @RequestMapping(value = "/lecList", method = RequestMethod.GET)
    public String proList(Model model) {
        List<Lecture> productList = lectureService.getLectureList();// 서비스 클래스에 비즈니스 로직을 정의하고 호출
        model.addAttribute("lecList", productList);
        for (Lecture lec: productList) {
            System.out.println(lec.toString());
        }
        return "lecture/lecList";
    }

    @GetMapping("lecMemList.do")
    public String paymentList(Model model) throws Exception{
        DateCalculator dateCalculator = new DateCalculator();
        String id = (String) session.getAttribute("sid");
        List<Payment> payList =  paymentService.paymentMemList(id);
        List<PayCheck> payChecks = new ArrayList<>();
        List<Lecture> lecList = new ArrayList<>();
        List<Instructor> instList = new ArrayList<>();

        for (Payment pay: payList) {
            Lecture lec = lectureService.getLecture(pay.getLec_no());
            PayCheck check = new PayCheck();

            String startDate = "";

            String buyDate = pay.getBuydate(); // 사용자가 강의를 구매한 날
            if(buyDate!=null && !buyDate.equals("")) {
                int endDay = lec.getEndDay(); // 강의 정보에 게시된 수강일
                String endDate = dateCalculator.endDays(buyDate, endDay); // 마지막 날 구하기
                boolean ck1 = dateCalculator.isAfterEndDays(endDate); // 수강 가능 여부 확인
                long dDay = dateCalculator.daysRemainingInMonths(endDate); // 남은 일 수

                startDate = buyDate.split(" ")[0];

                check.setCheck(ck1);
                check.setDay(dDay);
                check.setValue(2);
                check.setStartDate(startDate);
                check.setEndDate(endDate);
            } else {
                check.setCheck(false);
                check.setDay(0);
                check.setValue(1);
                check.setStartDate(startDate);
                check.setEndDate("");
            }
            payChecks.add(check);
            
            // 강의 정보
            Lecture lecture = lectureService.getLecture(pay.getLec_no());
            lecList.add(lecture);

            // 강사 정보
            Instructor inst = instService.getInstructorName(lecture.getIno());
            instList.add(inst);
        }

        model.addAttribute("lecList", lecList);
        model.addAttribute("payList", payList);
        model.addAttribute("instList", instList);
        model.addAttribute("payChecks", payChecks);
        return "/member/myPage/lecMemList";
    }
}