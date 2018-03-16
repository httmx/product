package com.bdqn.controller;

import com.bdqn.entity.Sale;
import com.bdqn.service.SaleService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2018/3/14.
 */
@Controller
@RequestMapping("sale")
public class SaleController {
    @Resource
    private SaleService saleService;

    @RequestMapping("toSale")
    public String toSale(Integer pageNum,Integer pageSize,Model model){
        PageInfo<Sale> pageInfo=saleService.queryAllList(pageNum, pageSize);
        model.addAttribute("pageInfo",pageInfo);
            return "ListSale";
    }
//模糊查询
    @RequestMapping(value = "querySale",method= RequestMethod.GET)
    public String querySale(Integer pageNum, Integer pageSize, String title, Model model){
        PageInfo<Sale> pageInfo=saleService.querySale(title, pageNum, pageSize);
        model.addAttribute("pageInfo",pageInfo);
        return "ListSale";
    }



}
