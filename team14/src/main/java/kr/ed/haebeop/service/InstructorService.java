package kr.ed.haebeop.service;


import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.InstructorNotice;

import java.util.List;

public interface InstructorService {
    public List<Lecture> getInstructorLectureList(String instructorname);
    public List<InstructorNotice> getInstructorNoticeList(String instructorname);
    public InstructorNotice getInstructorNoticeDetail(int no);
    public Instructor getInstructorId(String instructorname);

}
