package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.MyClassVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface MyclassMapper {

    @Select("SELECT * FROM myclass WHERE id = #{id};")
    public List<MyClassVO> getMyclassList(String id);
}