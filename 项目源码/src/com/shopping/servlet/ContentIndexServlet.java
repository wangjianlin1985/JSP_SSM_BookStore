package com.shopping.servlet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.model.Goods;
import com.shopping.service.GoodsService;

@Controller
public class ContentIndexServlet {
	
	/** 返回信息_返回结果标记 */
    public static final String RESULT = "RESULT";
    /** 返回信息_返回结果信息标记 */
    public static final String MESSAGE = "MESSAGE";
    /** 返回信息_成功 */
    public static final String SUCCESS = "SUCCESS";
    /** 返回信息_失败 */
    public static final String FAILURE = "FAILURE";
    
    @Autowired
    private GoodsService goodsService;
    
    @RequestMapping("/contentindex")
	public ModelAndView contentindex(Model model) throws Exception {
		List<Goods> goodslist = goodsService.getTuiGoods();
		ModelAndView me = new ModelAndView();
		me.addObject("goodslist", goodslist);
		me.setViewName("frontjsp/index");
		return me;
	}
    
}	
