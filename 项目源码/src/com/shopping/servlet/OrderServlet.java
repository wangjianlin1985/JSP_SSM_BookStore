package com.shopping.servlet;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.contant.BasicContant;
import com.shopping.model.Orders;
import com.shopping.model.PageBean;
import com.shopping.model.OrderDetial;
import com.shopping.model.ShoppingCart;
import com.shopping.service.GoodsService;
import com.shopping.service.OrderService;
import com.shopping.service.ShoppingCertService;
import com.shopping.vo.GoodsVO;
import com.shopping.vo.OrderVO;

@Controller
public class OrderServlet {
	
	/** 返回信息_返回结果标记 */
    public static final String RESULT = "RESULT";
    /** 返回信息_返回结果信息标记 */
    public static final String MESSAGE = "MESSAGE";
    /** 返回信息_成功 */
    public static final String SUCCESS = "SUCCESS";
    /** 返回信息_失败 */
    public static final String FAILURE = "FAILURE";
    
    @Autowired 
    private OrderService orderService;
    @Autowired 
    private ShoppingCertService shoppingCertService;
    @Autowired
    private GoodsService goodsService;
    
    @ResponseBody
	@RequestMapping("/addorder")
	public Map<String,Object> addorder(String userid,String goodslist,String address) throws Exception {
    	Map<String,Object> map = new HashMap<String,Object>();
    	String[] goodss = goodslist.split(",");
    	Orders order = new Orders();
		order.setUserid(Integer.parseInt(userid));
		order.setCreater(BasicContant.USER);
		order.setCreatedate(new Date());
		order.setOrdernum(String.valueOf((int)((Math.random()*9+1)*100000)));
    	int re = orderService.addorders(order);
    	if(re !=0){
    		OrderDetial orders = null;
        	for(int i=0;i<goodss.length;i++){
        		ShoppingCart sc = new ShoppingCart();
        		sc.setUserid(Integer.parseInt(userid));
        		sc.setGoodsid(Integer.parseInt(goodss[i]));
        		ShoppingCart shopping = shoppingCertService.selectShoppingCartByUserIdGoodsId(sc);
        		orders = new OrderDetial();
        		orders.setUserid(Integer.parseInt(userid));
        		orders.setOrdernum(order.getOrdernum());
        		orders.setGoodsid(Integer.parseInt(goodss[i]));
        		orders.setAddress(address);
        		orders.setStatus(1);
        		orders.setCount(shopping.getCount());
        		orders.setPrice(shopping.getPrice());
        		orders.setCreater(BasicContant.USER);
        		orders.setCreatedate(new Date());
        		int res = orderService.addorderdetail(orders);
        		if(res != 0){
        			GoodsVO goodsVO = goodsService.getGoodsById(Integer.parseInt(goodss[i]));
        			goodsVO.setCount(goodsVO.getCount()-shopping.getCount());
        			goodsVO.setTotal(goodsVO.getTotal()+shopping.getCount());
        			int ress = goodsService.updategoodscount(goodsVO);
        		    int res1 = shoppingCertService.deletegoodsbyid(shopping);
        		    if(res1 !=0){
        		    	map.put(RESULT, SUCCESS);
            			map.put(MESSAGE, "结算成功");
            		}else{
            			map.put(RESULT, FAILURE);
            			map.put(MESSAGE, "结算失败");
            			break;
            		}
        		 }
        	}
    		return map;
		}else{
			map.put(RESULT, FAILURE);
			map.put(MESSAGE, "结算失败");
			return map;
		}
    }
    
    @RequestMapping("/orderlist")
	public ModelAndView orderlist(Model model,String currentPage,String userid) throws Exception {
    	ModelAndView ma = new ModelAndView();
		OrderVO orderVO = new OrderVO();
		int current;
		if(currentPage.equals("")){
			current = 0;
		}else{
			current = Integer.parseInt(currentPage);
		}
		if(userid == null || userid.equals("")){
			ma.addObject(RESULT, FAILURE);
			ma.addObject(MESSAGE, "您还未登录请先登录");
			ma.setViewName("frontjsp/orderlist");
			return ma;
		}
		orderVO.setUserid(Integer.parseInt(userid));
		PageBean<OrderVO> orderslist = orderService.orderlist(current,orderVO);
		ma.addObject("orderlist", orderslist);
		ma.addObject(RESULT, SUCCESS);
        ma.setViewName("frontjsp/orderlist");
		return ma;
    }
    
    @RequestMapping("/back/roleorderlist")
	public ModelAndView roleorderlist(Model model,String currentPage,String status) throws Exception {
    	ModelAndView ma = new ModelAndView();
		OrderVO orderVO = new OrderVO();
		int current;
		if(currentPage.equals("")){
			current = 0;
		}else{
			current = Integer.parseInt(currentPage);
		}
		if(status == null || status.equals("")){
		}else{
			orderVO.setStatus(Integer.parseInt(status));
			ma.addObject("status", status);
		}
		PageBean<OrderVO> roleorderlist = orderService.roleorderlist(current,orderVO);
		ma.addObject("roleorderlist", roleorderlist);
		ma.addObject(RESULT, SUCCESS);
        ma.setViewName("backjsp/roleorderlist");
		return ma;
    }
    
    @RequestMapping("/deleteorderbyid")
    public ModelAndView deleteorderbyid(Model model,String ordernum,String goodsid,String userid) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	OrderDetial ordersDetail = new OrderDetial();
    	ordersDetail.setGoodsid(Integer.parseInt(goodsid));
    	ordersDetail.setUserid(Integer.parseInt(userid));
    	ordersDetail.setOrdernum(ordernum);
    	OrderVO orderVO = new OrderVO();
    	int current = 1;
    	int count = orderService.deleteorderbyid(ordersDetail);
    	if(count != 0){
    		orderVO.setUserid(Integer.parseInt(userid));
    		PageBean<OrderVO> orderslist = orderService.orderlist(current,orderVO);
    		ma.addObject("orderlist", orderslist);
    		ma.addObject("deletesuccess", SUCCESS);
			ma.addObject(RESULT, SUCCESS);
	        ma.setViewName("frontjsp/orderlist");
		}
    	return ma;
    }
    
    @RequestMapping("/back/roleupdateorder")
    public ModelAndView roleupdateorder(Model model,String ordernum,String goodsid,String userid,String status) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	OrderDetial ordersDetail = new OrderDetial();
    	ordersDetail.setGoodsid(Integer.parseInt(goodsid));
    	ordersDetail.setUserid(Integer.parseInt(userid));
    	ordersDetail.setOrdernum(ordernum);
    	ordersDetail.setStatus(Integer.parseInt(status));
    	OrderVO orderVO = new OrderVO();
    	int current = 1;
    	int count = orderService.roleupdateorder(ordersDetail);
    	if(count != 0){
    		PageBean<OrderVO> roleorderlist = orderService.roleorderlist(current,orderVO);
    		ma.addObject("roleorderlist", roleorderlist);
    		ma.addObject("updateorderr", SUCCESS);
			ma.addObject(RESULT, SUCCESS);
	        ma.setViewName("backjsp/roleorderlist");
		}
    	return ma;
    }
    
    
    @RequestMapping("/updateorderbyid")
    public ModelAndView updateorderbyid(Model model,String ordernum,String goodsid,String userid) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	OrderDetial ordersDetail = new OrderDetial();
    	ordersDetail.setGoodsid(Integer.parseInt(goodsid));
    	ordersDetail.setUserid(Integer.parseInt(userid));
    	ordersDetail.setOrdernum(ordernum);
    	ordersDetail.setStatus(3);
    	OrderVO orderVO = new OrderVO();
    	int current = 1;
    	int count = orderService.roleupdateorder(ordersDetail);
    	if(count != 0){
    		orderVO.setUserid(Integer.parseInt(userid));
    		PageBean<OrderVO> orderslist = orderService.orderlist(current,orderVO);
    		ma.addObject("orderlist", orderslist);
    		ma.addObject("updatesssuccess", SUCCESS);
			ma.addObject(RESULT, SUCCESS);
	        ma.setViewName("frontjsp/orderlist");
		}
    	return ma;
    }
    
}
