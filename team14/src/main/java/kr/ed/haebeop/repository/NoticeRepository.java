package kr.ed.haebeop.repository;

import kr.ed.haebeop.domain.Notice;

import java.util.List;

public interface NoticeRepository {
    public List<Notice> noticeList() throws Exception;
    public Notice noticeDetail(int no) throws Exception;
    public void noticeInsert(Notice dto) throws Exception;
    public void noticeDelete(int no) throws Exception;
    public void noticeEdit(Notice dto) throws Exception;
    void countUp(int no) throws Exception;
}
