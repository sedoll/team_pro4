package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Faq;
import kr.ed.haebeop.repository.FaqDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqServiceImpl implements FaqService{

    @Autowired
    private FaqDAO faqDAO;

    @Override
    public List<Faq> faqList() throws Exception {
        return faqDAO.faqList();
    }
}
