package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Infomation;
import kr.ed.haebeop.repository.InfoUniDAOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InfoUniServiceImpl implements InfoService{

    @Autowired
    private InfoUniDAOImpl infoUniDAO;

    @Override
    public List<Infomation> infoList() throws Exception {
        return infoUniDAO.infoList();
    }

    @Override
    public Infomation infoDetail(int bno) throws Exception {
        return infoUniDAO.infoDetail(bno);
    }

    @Override
    public void infoInsert(Infomation dto) throws Exception {
        infoUniDAO.infoInsert(dto);
    }

    @Override
    public void infoDelete(int bno) throws Exception {
        infoUniDAO.infoDelete(bno);
    }

    @Override
    public void infoEdit(Infomation dto) throws Exception {
        infoUniDAO.infoEdit(dto);
    }
}
