package com.ht.service.xiaoen;

import com.ht.vo.employee.AttendanceVo;
import com.ht.vo.employee.EmpCkBean;
import com.ht.vo.employee.EmpVo;

import java.util.List;

/**
 * Created by shkstart on 2019/12/13
 * @author LaIWeiChun
 */
public interface IAttendanceService {

    List<AttendanceVo> selectAll();

    void delete(AttendanceVo attendanceVo);

    void update(AttendanceVo attendanceVo);

    AttendanceVo select(AttendanceVo attendanceVo);

    List<AttendanceVo> selectPage(int currPage, int pageSize,String empName);

    int selectCount();

    void save(AttendanceVo attendanceVo);

    /**
     *      查看自己的审批任务
     * @param auditor
     *
     * @return
     */
    List<AttendanceVo> selectMyAuditor(String auditor);


}
