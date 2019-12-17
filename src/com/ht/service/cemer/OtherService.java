package com.ht.service.cemer;

import com.ht.vo.student.*;

public interface OtherService {
    StudentFamily getStuFalById(int familyid);
    void updateStuFal(StudentFamily studentFamily);
    void delStuFal(StudentFamily studentFamily);

    StudentEduVo getStuEduById(int Eduid);
    void updateStuEdu(StudentEduVo studentEduVo);
    void delStuEdu(StudentEduVo studentEduVo);

    StudentHappeningVo getStuHapById(int happenid);
    void updateStuHap(StudentHappeningVo studentHappeningVo);
    void delStuHap(StudentHappeningVo studentHappeningVo);

    holidayStudentVo getHolidayById(int holidayId);
    void updateHoliday(holidayStudentVo holidayStudentVo);
    void delHoliday(holidayStudentVo holidayStudentVo);

    StudentReplyScoreVo getReScoreById(int replyId);
    void updateReScore(StudentReplyScoreVo studentReplyScoreVo);
    void delReScore(StudentReplyScoreVo studentReplyScoreVo);

    StudentScoreVo getStuScore(int scoreId);
    void updateStuScore(StudentScoreVo studentScoreVo);
    void delStuScore(StudentScoreVo studentScoreVo);
}
