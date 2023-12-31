package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Notice;

import java.util.List;

public interface NoticeService {
    public List<Notice> noticeList() throws Exception;
    public Notice noticeDetail(int no) throws Exception;
    public void noticeInsert(Notice dto) throws Exception;
    public void noticeDelete(int no) throws Exception;
    public void noticeEdit(Notice dto) throws Exception;
    public void countUp(int no) throws Exception;


}
