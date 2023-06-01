package com.shopping.servlet;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.contant.BasicContant;
import com.shopping.model.PageBean;
import com.shopping.model.Aftersales;
import com.shopping.model.OrderDetial;
import com.shopping.service.AftersalesService;
import com.shopping.service.OrderService;
import com.shopping.vo.AftersalesVO;
import com.shopping.vo.OrderVO;

@Controller
public class AftersalesServlet {
	
	/** 返回信息_返回结果标记 */
    public static final String RESULT = "RESULT";
    /** 返回信息_返回结果信息标记 */
    public static final String MESSAGE = "MESSAGE";
    /** 返回信息_成功 */
    public static final String SUCCESS = "SUCCESS";
    /** 返回信息_失败 */
    public static final String FAILURE = "FAILURE";
    
    @Autowired 
    private AftersalesService aftersalesService;
    @Autowired
    private OrderService orderService;
    
	@RequestMapping("/insertAftersales")
	public ModelAndView insertAftersales(String userid,String id,String goodsid,String type,String cause) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	Aftersales aftersales = new Aftersales();
    	aftersales.setGoodsid(Integer.parseInt(goodsid));
    	aftersales.setUserid(Integer.parseInt(userid));
    	aftersales.setType(type);
    	aftersales.setCause(cause);
    	aftersales.setCreater(BasicContant.USER);
    	aftersales.setCreatedate(new Date());
    	aftersales.setStatus(1);
    	aftersales.setOrderid(Integer.parseInt(id));
    	int re = aftersalesService.insertAftersales(aftersales);
    	if(re !=0){
    		OrderDetial orders1 = new OrderDetial();
    		orders1.setId(Integer.parseInt(id));
    		OrderDetial orders = orderService.selectorderbyid(orders1);
    		orders.setStatus(4);
    		int count = orderService.roleupdateorder(orders);
    		if(count != 0){
    			int current = 1;
    			OrderVO orderVO = new OrderVO();
	    		orderVO.setUserid(Integer.parseInt(userid));
	    		PageBean<OrderVO> orderslist = orderService.orderlist(current,orderVO);
	    		ma.addObject("orderlist", orderslist);
	    		ma.addObject("installsuccess", SUCCESS);
				ma.addObject(RESULT, SUCCESS);
		        ma.setViewName("frontjsp/orderlist");
    		}
    	}
		return ma;	
    }
    
	@RequestMapping("/back/roleaftersaleslist")
	public ModelAndView roleaftersaleslist(Model model,String currentPage,String status) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	AftersalesVO aftersalesVO = new AftersalesVO();
		int current;
		if(currentPage.equals("")){
			current = 0;
		}else{
			current = Integer.parseInt(currentPage);
		}
		if(status == null || status.equals("")){
		}else{
			aftersalesVO.setStatus(Integer.parseInt(status));
			ma.addObject("status", status);
		}
		PageBean<AftersalesVO> roleaftersaleslist = aftersalesService.roleaftersaleslist(current, aftersalesVO);
		ma.addObject("roleaftersaleslist", roleaftersaleslist);
		ma.addObject(RESULT, SUCCESS);
        ma.setViewName("backjsp/roleaftersaleslist");
		return ma;
    }
	
	@RequestMapping("/back/roleupdateaftersales")
    public ModelAndView roleupdateaftersales(Model model,String type,String orderid,String goodsid,String userid) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	AftersalesVO aftersalesVO = new AftersalesVO();
    	aftersalesVO.setGoodsid(Integer.parseInt(goodsid));
    	aftersalesVO.setUserid(Integer.parseInt(userid));
    	aftersalesVO.setOrderid(Integer.parseInt(orderid));
    	aftersalesVO.setStatus(2);
    	int current = 1;
    	int count = aftersalesService.roleupdateaftersales(aftersalesVO);
    	if(count != 0){
    		
    		OrderDetial orders1 = new OrderDetial();
    		orders1.setId(Integer.parseInt(orderid));
    		OrderDetial orders = orderService.selectorderbyid(orders1);
    		orders.setStatus(5);
    		int count1 = orderService.roleupdateorder(orders);
    		if(count1 !=0){
    			AftersalesVO aftersalesVO1 = new AftersalesVO();
    			PageBean<AftersalesVO> roleaftersaleslist = aftersalesService.roleaftersaleslist(current, aftersalesVO1);
    			
    			ma.addObject("roleaftersaleslist", roleaftersaleslist);
    			ma.addObject(RESULT, SUCCESS);
        		ma.addObject("updateinstall", SUCCESS);
    			ma.setViewName("backjsp/roleaftersaleslist");
    		}
    		
		}
    	return ma;
    }
}
