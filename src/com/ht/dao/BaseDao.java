package com.ht.dao;

import org.hibernate.*;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2019/10/21.
 */

@Transactional
public class BaseDao {
    @Resource
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 查询列表(查询一个表的所有数据)
     *
     * @param hql
     * @return
     */
    public List listByHql(String hql) {
        return getSession().createQuery(hql).list();
    }

    //HQL分页  (查一个表的所有字段分页)
    public List pageByHql(String hql, int currPage, int pageSize) {
        Query query = getSession().createQuery(hql);
        query.setFirstResult((currPage - 1) * pageSize);//开始行数 0  5  10
        query.setMaxResults(pageSize);//每页行数(每次查几行)   5  5   5
        return query.list();
    }

    //SQL查询列表（连接多个表，筛选列时）
    public List listBySQL(String sql) {
        SQLQuery sqlquery = getSession().createSQLQuery(sql);
        sqlquery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);//把结果变形为 List<Map>
        return sqlquery.list();
    }

    //SQL查询分页列表（一个表或连接多个表，筛选列时）
    public List pageBySQL(String sql, int currPage, int pageSize) {
        SQLQuery sqlquery = getSession().createSQLQuery(sql);
        sqlquery.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);//把结果变形为 List<Map>
        /*一条数据就是一个map
         * Map map = new HashMap();
         * map.put("EMPNO",47);
         * map.put("ENAME","测试员2");
         *
         * map.put("DNAME",10);
         * ...
         * */
        sqlquery.setFirstResult((currPage - 1) * pageSize);//开始行数 0  5  10
        sqlquery.setMaxResults(pageSize);//每页行数(每次查几行)   5  5   5

        return sqlquery.list();
    }

    /**
     * 三合一SQL执行(增删改)
     */
    public void executeSQL(String sql) {
        SQLQuery sqlquery = getSession().createSQLQuery(sql);
        sqlquery.executeUpdate();
    }

    /**
     * SQL查询总行数
     */
    //select count(*) from newemp
    public int selTotalRow(String sql) {
        SQLQuery sqlquery = getSession().createSQLQuery(sql);
        int i = Integer.parseInt(sqlquery.uniqueResult()+"");
        return i;
    }

    /**
     * 保存对象
     *
     * @param obj
     */
    public void addObject(Object obj) {
        Session session = getSession();
        session.save(obj);
        session.flush();
    }

    /**
     * 根据ID获取对象
     *
     * @param clazz
     * @param id
     * @return
     */
    public Object getObject(Class clazz, Integer id) {
        return getSession().get(clazz, id);
    }

    /**
     * 修改对象
     *
     * @param obj
     */
    public void updObject(Object obj) {
        Session session = getSession();
        session.update(obj);
        session.flush();
    }

    /**
     * 删除对象
     *
     * @param obj
     */
    public void delObject(Object obj) {
        Session session = getSession();
        session.delete(obj);
        session.flush();
    }

}
