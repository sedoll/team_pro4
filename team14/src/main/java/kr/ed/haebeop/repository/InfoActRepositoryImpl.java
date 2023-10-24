package kr.ed.haebeop.repository;

import kr.ed.haebeop.domain.Infomation;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class InfoActRepositoryImpl implements InfoRepository {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Infomation> infoList() throws Exception {
        return sqlSession.selectList("infoAct.infoList");
    }

    @Override
    public Infomation infoDetail(int bno) throws Exception {
//        sqlSession.update("infoAct.countUp", bno); // 이건 나중에 서비스 쪽에 넣어라
        return sqlSession.selectOne("infoAct.infoDetail", bno);
    }

    @Override
    public void countUp(int bno) throws Exception {
        sqlSession.update("infoAct.countUp", bno);
    }

    @Override
    public void infoInsert(Infomation dto) throws Exception {
        sqlSession.insert("infoAct.infoInsert", dto);
    }

    @Override
    public void infoDelete(int bno) throws Exception {
        sqlSession.delete("infoAct.infoDelete", bno);
    }

    @Override
    public void infoEdit(Infomation dto) throws Exception {
        sqlSession.update("infoAct.infoEdit", dto);
    }
}
