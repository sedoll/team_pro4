package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.MyClassVO;
import kr.ed.haebeop.persistence.MyclassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MyclassService {

    // 수강 중인 강좌 가져오기
    @Autowired
    private MyclassMapper myclassMapper;

    public List<MyClassVO> getMyclassList(String id) throws Exception {

        return myclassMapper.getMyclassList(id);
    }



}
