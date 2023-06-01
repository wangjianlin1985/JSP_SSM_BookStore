package com.shopping.servlet;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.model.GoodsType;
import com.shopping.model.PageBean;
import com.shopping.service.GoodstypeService;
import com.shopping.vo.GoodstypeVO;

@Controller
public class GoodstypeServlet {
	
	/** 返回信息_返回结果标记 */
    public static final String RESULT = "RESULT";
    /** 返回信息_返回结果信息标记 */
    public static final String MESSAGE = "MESSAGE";
    /** 返回信息_成功 */
    public static final String SUCCESS = "SUCCESS";
    /** 返回信息_失败 */
    public static final String FAILURE = "FAILURE";
    
    @Autowired
	private GoodstypeService goodstypeService;
    
    @RequestMapping("/back/rolegoodstypelist")
	public ModelAndView rolegoodstypelist(Model model, String currentPage) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	GoodstypeVO goodstypeVO = new GoodstypeVO();
		int current;
		if(currentPage.equals("")){
			current = 0;
		}else{
			current = Integer.parseInt(currentPage);
		}
		PageBean<GoodstypeVO> rolegoodstypelist = goodstypeService.rolegoodstypelist(current, goodstypeVO);
		ma.addObject("rolegoodstypelist", rolegoodstypelist);
		ma.addObject(RESULT, SUCCESS);
        ma.setViewName("backjsp/rolegoodstypelist");
		return ma;
	}
    
    @RequestMapping("/back/addgoodstypev")
    public ModelAndView addgoodstypev(Model model) throws Exception {
    	ModelAndView ma = new ModelAndView();
		ma.setViewName("backjsp/addgoodstype");
		return ma;
	}
    
    @RequestMapping("/back/addgoodstype")
    public ModelAndView addgoodstype(Model model,String goodstype) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	GoodsType goodsType = new GoodsType();
    	goodsType.setGoodstype(goodstype);
    	goodsType.setCreatedate(new Date());
    	goodsType.setCreater("ADMIN");
    	int count = goodstypeService.addgoodstype(goodsType);
    	if(count!=0){
    		int current = 1;
    		GoodstypeVO goodstypeVO = new GoodstypeVO();
    		PageBean<GoodstypeVO> rolegoodstypelist = goodstypeService.rolegoodstypelist(current, goodstypeVO);
    		ma.addObject("rolegoodstypelist", rolegoodstypelist);
    		ma.addObject("addgoodstypelist", SUCCESS);
            ma.setViewName("backjsp/rolegoodstypelist");
    		return ma;
    	}else{
    		ma.addObject("roleactivelistfailure", SUCCESS);
    		ma.setViewName("backjsp/addactive");
    	}
		return ma;
	}
    
    
    @RequestMapping("/back/deletegoodstype")
    public ModelAndView deletegoodstype(Model model,String id) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	GoodsType goodsType = new GoodsType();
    	goodsType.setId(Integer.parseInt(id));
    	int count = goodstypeService.deletegoodstype(goodsType);
    	if(count!=0){
    		int current = 1;
    		GoodstypeVO goodstypeVO = new GoodstypeVO();
    		PageBean<GoodstypeVO> rolegoodstypelist = goodstypeService.rolegoodstypelist(current, goodstypeVO);
    		ma.addObject("rolegoodstypelist", rolegoodstypelist);
    		ma.addObject("deletegoodstypelist", SUCCESS);
            ma.setViewName("backjsp/rolegoodstypelist");
    		return ma;
    	}
		return ma;
	}
}	
