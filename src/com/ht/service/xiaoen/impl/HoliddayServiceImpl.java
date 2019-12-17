package com.ht.service.xiaoen.impl;

import com.ht.dao.BaseDao;
import com.ht.service.xiaoen.IHolidayService;
import com.ht.vo.employee.HolidayVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shkstart on 2019/12/16
 * @author LaiWeiChun
 */
@Service
public class HoliddayServiceImpl extends BaseDao implements IHolidayService {


    @Override
    public List<HolidayVo> selectAll(int empId) {
        return listByHql("from HolidayVo");
    }

    @Override
    public void delete(HolidayVo holidayVo) {
        delObject(holidayVo);
    }

    @Override
    public void update(HolidayVo holidayVo) {
        updObject(holidayVo);
    }

    @Override
    public HolidayVo select(HolidayVo holidayVo) {
        return (HolidayVo)getObject(HolidayVo.class,holidayVo.getHolidayid());
    }

    @Override
    public List<HolidayVo> selectPage(int currPage, int pageSize,int empId) {
        return pageBySQL("select h.holidayid,e.empName,h.holidayDay,h.startTime,h.endTime,h.status,h.remark from  t_holiday h left join t_emp e on h.empid=e.empId where h.empid="+empId,currPage,pageSize);
    }

    @Override
    public int selectCount() {
        return selTotalRow("select count(*) from t_holiday");
    }

    @Override
    public void save(HolidayVo holidayVo) {
            addObject(holidayVo);
    }

    @Override
    public List selectById(int hid) {
        return listBySQL("select h.holidayid,e.empName,h.holidayDay,h.startTime,h.endTime,h.status,h.remark from t_holiday h left join t_emp e on h.empid=e.empId where h.holidayid="+hid);
    }


}


