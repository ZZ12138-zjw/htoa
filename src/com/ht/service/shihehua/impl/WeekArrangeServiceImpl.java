package com.ht.service.shihehua.impl;

import com.ht.dao.BaseDao;
import com.ht.service.shihehua.IWeekArrangeService;
import com.ht.vo.educational.WeekArrangeVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 华 on 2019/12/4.
 */
@Service
public class WeekArrangeServiceImpl extends BaseDao implements IWeekArrangeService{


    @Override
    public void addWeekArrange(WeekArrangeVo weekArrangeVo) {
        addObject(weekArrangeVo);
    }

    @Override
    public List selWeekArrangeList() {
        return listByHql("from WeekArrangeVo");
    }

    @Override
    public List selWeekArrangePage(Integer currPage, Integer pageSize) {
        return pageBySQL("select w.*,e.empName from weekarrange w left join t_emp e on w.empId=e.empId",currPage,pageSize);
    }

    @Override
    public WeekArrangeVo selWeekArrange(Integer weekArrangeid) {
        return (WeekArrangeVo)getObject(WeekArrangeVo.class,weekArrangeid);
    }

    @Override
    public int selWeekArrangeCount() {
        return selTotalRow("select count(*) from weekarrange");
    }

    @Override
    public void delWeekArrange(WeekArrangeVo weekArrangeVo) {
        delObject(weekArrangeVo);
    }

    @Override
    public void delWeekArranges(String ids) {
        executeSQL("delete from weekarrange where weekArrangeid in("+ids+")");
    }

    @Override
    public void updateWeekArrange(WeekArrangeVo weekArrangeVo) {
        updObject(weekArrangeVo);
    }


}
