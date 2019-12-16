package com.ht.service.cemer.Impl;

import com.ht.dao.BaseDao;
import com.ht.service.cemer.OtherService;
import com.ht.vo.student.*;
import org.springframework.stereotype.Service;

@Service
public class OtherServiceImpl extends BaseDao implements OtherService {
    @Override
    public StudentFamily getStuFalById(int familyid) {
        return (StudentFamily)getObject(StudentFamily.class,familyid);
    }

    @Override
    public void updateStuFal(StudentFamily studentFamily) {
        updObject(studentFamily);
    }

    @Override
    public void delStuFal(StudentFamily studentFamily) {
        delObject(studentFamily);
    }

    @Override
    public StudentEduVo getStuEduById(int Eduid) {
        return (StudentEduVo)getObject(StudentEduVo.class,Eduid);
    }

    @Override
    public void updateStuEdu(StudentEduVo studentEduVo) {
        updObject(studentEduVo);
    }

    @Override
    public void delStuEdu(StudentEduVo studentEduVo) {
        delObject(studentEduVo);
    }

    @Override
    public StudentHappeningVo getStuHapById(int happenid) {
        return (StudentHappeningVo)getObject(StudentHappeningVo.class,happenid);
    }

    @Override
    public void updateStuHap(StudentHappeningVo studentHappeningVo) {
        updObject(studentHappeningVo);
    }

    @Override
    public void delStuHap(StudentHappeningVo studentHappeningVo) {
        delObject(studentHappeningVo);
    }

    @Override
    public holidayStudentVo getHolidayById(int holidayId) {
        return (holidayStudentVo)getObject(holidayStudentVo.class,holidayId);
    }

    @Override
    public void updateHoliday(holidayStudentVo holidayStudentVo) {
        updObject(holidayStudentVo);
    }

    @Override
    public void delHoliday(holidayStudentVo holidayStudentVo) {
        delObject(holidayStudentVo);
    }

    @Override
    public StudentReplyScoreVo getReScoreById(int replyId) {
        return (StudentReplyScoreVo)getObject(StudentReplyScoreVo.class,replyId);
    }

    @Override
    public void updateReScore(StudentReplyScoreVo studentReplyScoreVo) {
        updObject(studentReplyScoreVo);
    }

    @Override
    public void delReScore(StudentReplyScoreVo studentReplyScoreVo) {
        delObject(studentReplyScoreVo);
    }

    @Override
    public StudentScoreVo getStuScore(int scoreId) {
        return (StudentScoreVo)getObject(StudentScoreVo.class,scoreId);
    }

    @Override
    public void updateStuScore(StudentScoreVo studentScoreVo) {
        updObject(studentScoreVo);
    }

    @Override
    public void delStuScore(StudentScoreVo studentScoreVo) {
        delObject(studentScoreVo);
    }
}
