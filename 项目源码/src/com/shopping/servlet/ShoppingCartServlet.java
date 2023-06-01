package com.shopping.servlet;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.model.ShoppingCart;
import com.shopping.service.ShoppingCertService;
import com.shopping.vo.ShoppingCartVO;

@Controller
public class ShoppingCartServlet {
	
	/** 返回信息_返回结果标记 */
    public static final String RESULT = "RESULT";
    /** 返回信息_返回结果信息标记 */
    public static final String MESSAGE = "MESSAGE";
    /** 返回信息_成功 */
    public static final String SUCCESS = "SUCCESS";
    /** 返回信息_失败 */
    public static final String FAILURE = "FAILURE";
	
	@Autowired 
	private ShoppingCertService shoppingCertService;

	@RequestMapping("/shoppingcartlist")
	public ModelAndView shoppingcartlist(String userid) throws Exception {
		ModelAndView ma = new ModelAndView();
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setUserid(Integer.parseInt(userid));
		List<ShoppingCartVO> shoppinglist = shoppingCertService.selectShoppingCartByUserId(shoppingCart);
		if(shoppinglist != null){
			ma.addObject("shoppinglist", shoppinglist);
			ma.addObject(RESULT, SUCCESS);
	        ma.setViewName("frontjsp/shoppingcartlist");
		}
		else{
			ma.addObject(RESULT, FAILURE);
			ma.setViewName("frontjsp/shoppingcartlist");
		}
		return ma;	
	}
	
	@RequestMapping("/deletegoodsbyid")
	public ModelAndView deletegoodsbyid(String userid,String goodsid) throws Exception {
		ModelAndView ma = new ModelAndView();
		int res = 0;
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setUserid(Integer.parseInt(userid));
		shoppingCart.setGoodsid(Integer.parseInt(goodsid));
		res = shoppingCertService.deletegoodsbyid(shoppingCart);
		if(res != 0){
			List<ShoppingCartVO> shoppinglist = shoppingCertService.selectShoppingCartByUserId(shoppingCart);
			if(shoppinglist != null){
				ma.addObject("shoppinglist", shoppinglist);
				ma.addObject(RESULT, SUCCESS);
		        ma.setViewName("frontjsp/shoppingcartlist");
			}
			else{
				ma.addObject(RESULT, FAILURE);
				ma.setViewName("frontjsp/shoppingcartlist");
			}
		}
		return ma;
		
	}
	
	@ResponseBody
	@RequestMapping("/addshoppingcart")
	public Map<String,Object> addshoppingcart(String userid,String goodsid,String count,String price) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		ShoppingCart shoppingCart = new ShoppingCart();
		if(userid.equals(null) || userid.equals("")){
			map.put(RESULT, FAILURE);
			map.put(MESSAGE, "您还未登录请先登录");
			return map;
		}
		BigDecimal pirces = new BigDecimal(price).multiply(new BigDecimal(count));
		shoppingCart.setUserid(Integer.parseInt(userid));
		shoppingCart.setGoodsid(Integer.parseInt(goodsid));
		shoppingCart.setCount(Integer.parseInt(count));
		shoppingCart.setPrice(pirces);
		int res = 0;
		ShoppingCart checkshoppingCart = shoppingCertService.selectShoppingCartByUserIdGoodsId(shoppingCart);
		if(checkshoppingCart != null){
			shoppingCart.setCount(Integer.parseInt(count)+checkshoppingCart.getCount());
			shoppingCart.setPrice(new BigDecimal(price).add(checkshoppingCart.getPrice()));
			int cou = shoppingCertService.updateShoppingCartbyUserIdGoodsId(shoppingCart);
			if(cou != 0){
				map.put(RESULT, SUCCESS);
				map.put(MESSAGE, "商品加入购物车成功，请去购物车结算");
				return map;
			}
		}
		res = shoppingCertService.addshoppingcart(shoppingCart);
		if(res != 0){
			map.put(RESULT, SUCCESS);
			map.put(MESSAGE, "商品加入购物车成功，请去购物车结算");
			return map;
		}else{
			map.put(RESULT, FAILURE);
			map.put(MESSAGE, "商品加入购物车失败，请稍后再试");
			return map;
		}
	}
}
