package com.ht.global;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 过滤器类
 * Created by shkstart on 2019/11/27
 * @author LaIWeiChun
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        String url =httpServletRequest.getRequestURI();
        //toLowerCase()转小写
        //返回true则继续往下执行
        if (url.toLowerCase().indexOf("login")>=0){
            return true;
        }

       HttpSession session = httpServletRequest.getSession();
        //判断用户是否登录,登录了则继续往下执行
       if (session.getAttribute("empVo")!=null){
            return true;
       }
       //转发到登录页面
       httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/login.jsp");

       return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
