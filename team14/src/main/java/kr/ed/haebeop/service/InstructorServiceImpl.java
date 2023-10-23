package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Instructor;
import kr.ed.haebeop.domain.Lecture;
import kr.ed.haebeop.domain.InstructorNotice;
import kr.ed.haebeop.persistence.InstructorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InstructorServiceImpl implements InstructorService{

    @Autowired
    InstructorMapper instructorMapper;

    @Override
    public List<Lecture> getInstructorLectureList(String instructorname) {
        return instructorMapper.getInstructorLectureList(instructorname);
    }

    @Override
    public List<InstructorNotice> getInstructorNoticeList(String instructorname) {
        return instructorMapper.getInstructorNoticeList(instructorname);
    }

    @Override
    public InstructorNotice getInstructorNoticeDetail(int no) {
        return instructorMapper.getInstructorNoticeDetail(no);
    }

    @Override
    public Instructor getInstructorId(String instructorname) {
        return instructorMapper.getInstructorId(instructorname);
    }

    //선생님 리스트
    @Override
    public List<Instructor> getInstructorList() {
        return instructorMapper.getInstructorList();
    }
}
