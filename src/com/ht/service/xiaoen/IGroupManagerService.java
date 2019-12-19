package com.ht.service.xiaoen;

import com.ht.vo.employee.GroupManagerVo;
import com.ht.vo.employee.ModuleVo;

import java.util.List;

/**
 *
 * Created by shkstart on 2019/12/18
 * @author LaIWeiChun
 */
public interface IGroupManagerService {

    List<GroupManagerVo> selectAll();

    void delete(GroupManagerVo groupManagerVo);

    void update(GroupManagerVo groupManagerVo);

    GroupManagerVo select(GroupManagerVo groupManagerVo);

    List<GroupManagerVo> selectPage(int currPage, int pageSize);

    int selectCount();

    void save(GroupManagerVo groupManagerVo);
}
