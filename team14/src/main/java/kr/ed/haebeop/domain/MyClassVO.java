package kr.ed.haebeop.domain;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MyClassVO {

    String id; //회원아이디
    int lec_no; //강의코드
    String lecCate; // 강의 강테고리
    String lecTitle; // 강의타이틀
    String lecStudystart;
    String lecStudyend;
    String insName; // 강사이름
    int ck; // 1.수강중 , 2.수강정지, 3.수강취소





}
