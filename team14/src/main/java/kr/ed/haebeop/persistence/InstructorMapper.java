package kr.ed.haebeop.persistence;

import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.InstructorNotice;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface InstructorMapper {

    //선생님 리스트
    @Select("select * from instructor")
    public List<Instructor> getInstructorList();
    //강의 리스트
    @Select("select * from lecture where instructorname = #{instructorname}")
    public List<Lecture> getInstructorLectureList(String instructorname);

    //공지 목록
    @Select("select * from instructornotice where instructorname=#{instructorname}")
    public List<InstructorNotice> getInstructorNoticeList(String instructorname);

    //공지 상세
    @Select("select * from instructornotice where no=#{no}")
    public InstructorNotice getInstructorNoticeDetail(int no);

    //instructor id
    @Select("select * from instructor where instructorname=#{instructorname}")
    public Instructor getInstructorId(String instructorname);


    @Insert("insert into instructor(no,instructorid,instructorname,category) values (default,#{instructorid},#{instructorname},#{category})")
    public void instructorInsert(Instructor instructor);

    @Delete("delete from instructor where instructorid=#{instructorid}")
    public void instructorDelete(String instructorid);

    @Update("update instructor set instructorid=#{instructorid},instructorname=#{instructorname},category=#{category}")
    public void instructorUpdate(Instructor instructor);


}
