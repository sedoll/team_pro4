package kr.ed.haebeop.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/mystudyroom/*")
public class MystudyController {

    @RequestMapping("myStudyIndex.do")
    public String myStudyIndex(Model model) throws Exception {

        return "/mystudyroom/myStudyIndex";

    }
}
