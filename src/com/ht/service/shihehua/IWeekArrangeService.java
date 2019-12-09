package com.ht.service.shihehua;

import com.ht.vo.educational.WeekArrangeVo;

import java.util.List;

/**
 * Created by 华 on 2019/12/4.
 */
public interface IWeekArrangeService {

    public void addWeekArrange(WeekArrangeVo weekArrangeVo);

    public List selWeekArrangeList();

    public List selWeekArrangePage(Integer currPage,Integer pageSize);

    public WeekArrangeVo selWeekArrange(Integer weekArrangeid);

    public int selWeekArrangeCount();

    public void delWeekArrange(WeekArrangeVo weekArrangeVo);

    public void delWeekArranges(String ids);

    public void updateWeekArrange(WeekArrangeVo weekArrangeVo);
}
