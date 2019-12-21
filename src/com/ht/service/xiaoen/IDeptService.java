package com.ht.service.xiaoen;

import com.ht.vo.employee.DeptVo;
import java.util.List;

/**
 * Created by shkstart on 2019/12/4
 * @author LaIWeiChun
 */
public interface IDeptService {

    /**
     * 查询所有部门
     * @return
     */
    List<DeptVo> selectAll();

    /**
     * 根据id删除部门
     * @param deptVo
     */
    void delete(DeptVo deptVo);

    /**
     * 修改部门
     * @param deptVo
     */
    void update(DeptVo deptVo);

    /**
     * 根据id查找单个部门
     * @param deptId
     * @return
     */
    DeptVo select(Integer deptId);

    /**
     * 分页查询部门
     * @return
     */
    List<DeptVo> selectPage(int currPage,int pageSize);

    /**
     * 查询部门个数
     * @return
     */
    int selectCount();

    /**
     * 保存
     * @param deptVo
     */
    void save(DeptVo deptVo);

    /**
     * 删除多个部门
     * @param depIds
     *         多个部门id拼成的字符串
     *              1,2,3,4
     */
    void delAll(String depIds);

    /**
     * 通过部门名称查部门负责人id
     * @param deptId
     *      部门id
     * @return
     *      部门负责人
     *          id
     */
    String selectChairman(Integer deptId);


    /**
     * 通过部门id名称查部门负责人名称
     * @param deptId
     * @return
     *      部门负责人name
     */
    public String selectChairmanName(Integer deptId);

}
