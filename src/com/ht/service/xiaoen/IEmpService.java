package com.ht.service.xiaoen;

import com.ht.vo.employee.DeptVo;
import com.ht.vo.employee.EmpCkBean;
import com.ht.vo.employee.EmpVo;

import java.util.List;

/**
 * Created by shkstart on 2019/12/5
 * @author LaIWeiChun
 */
public interface IEmpService  {


    List<EmpVo> selectAll();

    void delete(EmpVo empVo);

    void update(EmpVo empVo);

    EmpVo select(EmpVo empVo);

    List<EmpVo> selectPage(int currPage, int pageSize, EmpCkBean empCk);

    int selectCount();

    void save(EmpVo empVo);

    void udtStatus(int empId,int status);

    void resetPwd(int empId);

    void delAll(String empIds);

    /**
     * 查找对应考核指标的分数
     *      由于zjw没有写
     *      所以在这里加
     * @param checkContext
     *      考核内容
     * @return
     */
    List findCheckFraction(String checkContext);


    /**
     * 通过员工id查询考核指标
     * @param empId
     *
     * @return
     */
    List listCheckInsertByEmpId(int empId);

    /**
     * 修改密码，验证旧密码是否正确
     * @param password
     * @param empId
     * @return
     */
    EmpVo ckOldPwd(String password,String empId);

}
