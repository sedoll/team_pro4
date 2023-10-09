package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Infomation;
import kr.ed.haebeop.repository.InfoStuDAOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InfoStuServiceImpl implements InfoService{

    @Autowired
    private InfoStuDAOImpl infoStuDAO;

    @Override
    public List<Infomation> infoList() throws Exception {
        return infoStuDAO.infoList();
    }

    @Override
    public Infomation infoDetail(int bno) throws Exception {
        return infoStuDAO.infoDetail(bno);
    }

    @Override
    public void infoInsert(Infomation dto) throws Exception {
        infoStuDAO.infoInsert(dto);
    }

    @Override
    public void infoDelete(int bno) throws Exception {
        infoStuDAO.infoDelete(bno);
    }

    @Override
    public void infoEdit(Infomation dto) throws Exception {
        infoStuDAO.infoEdit(dto);
    }
}
