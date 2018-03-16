package com.bdqn.controller;

import com.alibaba.fastjson.JSON;
import com.bdqn.entity.Users;
import com.bdqn.service.UsersService;
import com.bdqn.util.Message;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Max on 3-13-2018-013.
 */

@Controller
@RequestMapping("user")
public class UsersController {
    @Resource
    private UsersService usersService;

    //登录
    @RequestMapping(value = "toUser", method = RequestMethod.GET,
            produces = "application/json;charset=UTF-8")
    public String login(Users users, HttpSession httpSession, Model model) {
        System.out.println(users);
        Users loginUser = usersService.UsersLogin(users);
        if (loginUser.getStatus()==1) {
            httpSession.setAttribute("loginUser", loginUser);
            return "main";
        }
        if (loginUser.getStatus() == 0) {
            httpSession.setAttribute("message","此用户已冻结");
            return "index";
        }
        model.addAttribute("message", "用户名密码错误");
        return "index";
    }

    //添加
    @ResponseBody
    @RequestMapping(value = "addUser",method = RequestMethod.POST,
        produces ="application/json;charset=utf-8" )
    public String addUser(Users users){
        int n=usersService.addUser(users);
        if (n>0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    //查询所有
    @RequestMapping("toUserList")
    public String toUserList(Integer pageNum,Integer pageSize,Model model) {
        PageInfo<Users> pageInfo = usersService.queryAll(pageNum, pageSize);
        model.addAttribute("pageInfo", pageInfo);
        System.out.println(pageInfo);
        return "user";
    }


    //修改
    @ResponseBody
    @RequestMapping(value = "updateUser",method = RequestMethod.POST,
            produces ="application/json;charset=utf-8" )
    public String updateUser(Users users){
        int n=usersService.updateUser(users);
        if (n>0) {
            return JSON.toJSONString(Message.success());
        }
        return JSON.toJSONString(Message.error());
    }

    //查询单条
    @ResponseBody
    @RequestMapping(value = "queryUserById",method = RequestMethod.GET,
            produces ="application/json;charset=utf-8" )
    public String queryUserById(int id){
        Users users=usersService.queryUserById(id);
        return JSON.toJSONString(users);
    }

    @RequestMapping(value = "logout")
    public String logout(HttpSession session) {
        System.out.println(1);
        session.removeAttribute("loginUser");
        session.removeAttribute("message");
        return "index";
    }
}