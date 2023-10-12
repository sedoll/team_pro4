package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Infomation;
import kr.ed.haebeop.repository.InfoActDAOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InfoActServiceImpl implements InfoService{

    @Autowired
    private InfoActDAOImpl infoActDAO;

    @Override
    public List<Infomation> infoList() throws Exception {
        return infoActDAO.infoList();
    }

    @Override
    public Infomation infoDetail(int bno) throws Exception {
        return infoActDAO.infoDetail(bno);
    }

    @Override
    public void infoInsert(Infomation dto) throws Exception {
        infoActDAO.infoInsert(dto);
    }

    @Override
    public void infoDelete(int bno) throws Exception {
        infoActDAO.infoDelete(bno);
    }

    @Override
    public void infoEdit(Infomation dto) throws Exception {
        infoActDAO.infoEdit(dto);
    }
}
