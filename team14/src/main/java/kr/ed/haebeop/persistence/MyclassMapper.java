package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.MyClassVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MyclassMapper {

    @Select("SELECT * FROM myclass;")
    public List<MyClassVO> myclassList();

    @Select("SELECT * FROM myclass WHERE id = #{id};")
    public List<MyClassVO> getMyclassList(String id);
}
