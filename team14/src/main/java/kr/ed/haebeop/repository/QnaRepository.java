package kr.ed.haebeop.repository;

import kr.ed.haebeop.domain.Qna;

import java.util.List;

public interface QnaRepository {
    public List<Qna> qnaList() throws Exception;
    public Qna qnaDetail(int bno) throws Exception;
    public void qnaInsert(Qna dto) throws Exception;
    public void qnaDelete(int bno) throws Exception;
    public void qnaEdit(Qna dto) throws Exception;
    public void commentInsert(Qna dto) throws Exception;
    public List<Qna> commentList(int bno) throws Exception;
    public void commentDeleteAll(int bno) throws Exception;
    void countUp(int bno) throws Exception;
}
