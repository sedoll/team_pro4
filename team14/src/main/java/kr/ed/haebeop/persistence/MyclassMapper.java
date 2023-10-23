package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.MyClassVO;
import kr.ed.haebeop.domain.Notice;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MyclassMapper {




    @Select("SELECT * FROM myclass;")
    public List<MyClassVO> myclassList();


    // 해당 회원이 수강신청한 전체 강좌리스트
    @Select("SELECT * FROM myclass WHERE id = #{id};")
    public List<MyClassVO> getMyclassList(String id);

    // 수강신청한 강좌 중 선택한 강의의 정보 selectone
    @Select("SELECT * FROM myclass WHERE lec_no = #{lec_no};")
    public List<MyClassVO> gettakingClassList(int lec_no);


    // 강의 별 공지사항
    @Select("SELECT * FROM instructornotice WHERE lec_no = #{lec_no};")
    public Notice getClassNoticeList(int lec_no);


}
