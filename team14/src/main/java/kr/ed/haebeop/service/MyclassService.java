package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.MyClassVO;
import kr.ed.haebeop.persistence.MyclassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MyclassService {


    @Autowired
    private MyclassMapper myclassMapper;


    // 전체 수강 강좌 가져오기
    public List<MyClassVO> myclassList() throws Exception{
        return myclassMapper.myclassList();
    }

    // 해당 수강 중인 강좌 가져오기
    public List<MyClassVO> getMyclassList(String id) throws Exception {
        return myclassMapper.getMyclassList(id);
    }



}
