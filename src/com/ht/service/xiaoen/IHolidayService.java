package com.ht.service.xiaoen;

import com.ht.vo.employee.HolidayVo;
import com.ht.vo.employee.JobVo;

import java.util.List;

/**
 * Created by shkstart on 2019/12/16
 * @author LaiWeiChun
 */
public interface IHolidayService {

    List<HolidayVo> selectAll(int empId);

    void delete(HolidayVo holidayVo);

    void update(HolidayVo holidayVo);

    HolidayVo select(HolidayVo holidayVo);

    List<HolidayVo> selectPage(int currPage, int pageSiz,int empId);

    int selectCount();

    void save(HolidayVo holidayVo);

    List selectById(int hid);

}
