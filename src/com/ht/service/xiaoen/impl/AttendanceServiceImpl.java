package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IAttendanceService;
import com.ht.vo.employee.AttendanceVo;
import com.ht.vo.employee.EmpVo;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by shkstart on 2019/12/13
 * @author LaIWeiChun
 */
@Service
public class AttendanceServiceImpl extends BaseDao implements IAttendanceService {
    @Override
    public List<AttendanceVo> selectAll() {
        return listByHql("from AttendanceVo");
    }

    @Override
    public void delete(AttendanceVo attendanceVo) {
        delObject(attendanceVo);
    }

    @Override
    public void update(AttendanceVo attendanceVo) {
        updObject(attendanceVo);
    }

    @Override
    public AttendanceVo select(AttendanceVo attendanceVo) {
        return (AttendanceVo)getObject(AttendanceVo.class,attendanceVo.getAttId());
    }

    @Override
    public List<AttendanceVo> selectPage(int currPage, int pageSize,String empName) {
        return pageByHql("from AttendanceVo a where a.empName='"+empName+"'",currPage,pageSize);
    }


    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_attendance");
    }

    @Override
    public void save(AttendanceVo attendanceVo) {
        addObject(attendanceVo);
    }

    @Override
    public List<AttendanceVo> selectMyAuditor(String auditor){
        return listByHql("from AttendanceVo a where a.auditor='"+auditor+"' and a.status=1");
    }
}
