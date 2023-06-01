package com.shopping.servlet;

import java.io.File;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.model.Goods;
import com.shopping.model.GoodsType;
import com.shopping.model.PageBean;
import com.shopping.service.GoodsService;
import com.shopping.vo.GoodsVO;

@Controller
public class GoodsServlet {
	
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
	
	@RequestMapping("/goodsdetails")
	public ModelAndView goodsdetails(Model model,String id) throws Exception {
		ModelAndView ma = new ModelAndView();
		int ids = Integer.parseInt(id);
		GoodsVO goods = goodsService.getGoodsById(ids);
		if(goods != null){
			ma.addObject("goods", goods);
			ma.addObject(RESULT, SUCCESS);
	        ma.setViewName("frontjsp/goodsdetails");
		}
		else{
			ma.addObject(RESULT, FAILURE);
			ma.setViewName("frontjsp/goodsdetails");
		}
		return ma;
	}
	
	@ResponseBody
	@RequestMapping("/back/selectgoodsbyId")
	public Map<String,Object> selectgoodsbyId(Model model,String goodsid) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		int ids = Integer.parseInt(goodsid);
		GoodsVO goods = goodsService.getGoodsById(ids);
		if(goods != null){
			map.put("goods", goods);
			map.put(RESULT, SUCCESS);
			map.put(MESSAGE, "获取商品信息成功");
			return map;
		}
		else{
			map.put(MESSAGE, "获取商品信息失败");
			map.put(RESULT, FAILURE);
			return map;
		}
		
	}
	
	@RequestMapping("/goodslist")
	public ModelAndView goodslist(Model model,String currentPage,String typeid) throws Exception {
		ModelAndView ma = new ModelAndView();
		Goods goods = new Goods();
		int current;
		if(currentPage.equals("")){
			current = 0;
		}else{
			current = Integer.parseInt(currentPage);
		}
		if(typeid == null || typeid.equals("")){
		}else{
			goods.setTypeid(Integer.parseInt(typeid));
		}
		PageBean<Goods> goodslist = goodsService.goodslist(current,goods);
		List<GoodsType> goodstypelist = goodsService.goodstypelist();
		if(!(typeid == null ||typeid.equals("") )){
			ma.addObject("typeid",typeid);
		}
		ma.addObject("goodslist", goodslist);
		ma.addObject("goodstypelist", goodstypelist);
		ma.addObject(RESULT, SUCCESS);
        ma.setViewName("frontjsp/goodslist");
		return ma;
	}
	
	@RequestMapping("/back/goodstypelist")
	public ModelAndView goodstypelist(Model model) throws Exception {
		ModelAndView ma = new ModelAndView();
		List<GoodsType> goodstypelist = goodsService.goodstypelist();
		ma.addObject("goodstypelist", goodstypelist);
		ma.addObject(RESULT, SUCCESS);
        ma.setViewName("backjsp/addgoods");
		return ma;
	}
	
	@RequestMapping("/back/rolegoodslist")
	public ModelAndView rolegoodslist(Model model,String currentPage,String typeid) throws Exception {
		ModelAndView ma = new ModelAndView();
		Goods goods = new Goods();
		int current;
		if(currentPage.equals("")){
			current = 0;
		}else{
			current = Integer.parseInt(currentPage);
		}
		if(typeid == null || typeid.equals("")){
		}else{
			goods.setTypeid(Integer.parseInt(typeid));
		}
		PageBean<GoodsVO> goodslist = goodsService.rolegoodslist(current,goods);
		List<GoodsType> goodstypelist = goodsService.goodstypelist();
		if(!(typeid == null ||typeid.equals("") )){
			ma.addObject("typeid",typeid);
		}
		ma.addObject("goodslist", goodslist);
		ma.addObject("goodstypelist", goodstypelist);
		ma.addObject(RESULT, SUCCESS);
        ma.setViewName("backjsp/goodslist");
		return ma;
	}
	
	@RequestMapping("/back/savegoods")
	public ModelAndView savegoods(Model model,String id,String name,String price,String title,String descript,MultipartFile item_pic) throws Exception {
		ModelAndView ma = new ModelAndView();
		Goods goods = new Goods();
		goods.setId(Integer.parseInt(id));
		goods.setName(name);
		goods.setDescript(descript);
		goods.setTitle(title);
		goods.setPrice(new BigDecimal(price));
		String originalFilename = item_pic.getOriginalFilename();
		if(item_pic != null && originalFilename != null && originalFilename.length()>0){
			//String pic_path="C:\\apache-tomcat-8.0.47\\wtpwebapps\\onlinestemp\\upload\\image\\";
			String pic_path="C:\\image\\";
			String newFileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
			File newFile= new File(pic_path+newFileName);
			item_pic.transferTo(newFile);
			goods.setPhotourl(newFileName);
		}
		int count = goodsService.savegoods(goods);
		if(count != 0){
			Goods goods1 = new Goods();
			int current = 1;
			PageBean<GoodsVO> goodslist = goodsService.rolegoodslist(current,goods1);
			List<GoodsType> goodstypelist = goodsService.goodstypelist();
			ma.addObject("goodslist", goodslist);
			ma.addObject("savegoodss", SUCCESS);
			ma.addObject("goodstypelist", goodstypelist);
			ma.addObject(RESULT, SUCCESS);
	        ma.setViewName("backjsp/goodslist");
		}
		return ma;
	}
	
	@RequestMapping("/back/addgoods")
	public ModelAndView addgoods(Model model,String name,String count,String typeid,String weight,String price,String title,String descript,MultipartFile item_pic,MultipartFile message_item_pic) throws Exception {
		ModelAndView ma = new ModelAndView();
		Goods goods = new Goods();
		goods.setName(name);
		goods.setDescript(descript);
		goods.setTitle(title);
		goods.setCount(Integer.parseInt(count));
		goods.setTypeid(Integer.parseInt(typeid));
		goods.setWeight(new BigDecimal(weight));
		goods.setPrice(new BigDecimal(price));
		String originalFilename = item_pic.getOriginalFilename();
		String meoriginalFilename = message_item_pic.getOriginalFilename();
		if(item_pic != null && originalFilename != null && originalFilename.length()>0){
			//String pic_path="C:\\apache-tomcat-8.0.47\\wtpwebapps\\onlinestemp\\upload\\image\\";
			String pic_path="C:\\image\\";
			String newFileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
			File newFile= new File(pic_path+newFileName);
			item_pic.transferTo(newFile);
			goods.setPhotourl(newFileName);
		}
		if(message_item_pic != null && meoriginalFilename != null && meoriginalFilename.length()>0){
			String pic_path="C:\\image\\";
			String newFileName=UUID.randomUUID()+originalFilename.substring(originalFilename.lastIndexOf("."));
			File newFile= new File(pic_path+newFileName);
			message_item_pic.transferTo(newFile);
			goods.setMessageurl(newFileName);
		}
		int count1 = goodsService.addgoods(goods);
		if(count1 != 0){
			Goods goods1 = new Goods();
			int current = 1;
			PageBean<GoodsVO> goodslist = goodsService.rolegoodslist(current,goods1);
			List<GoodsType> goodstypelist = goodsService.goodstypelist();
			ma.addObject("goodslist", goodslist);
			ma.addObject("addgoodss", SUCCESS);
			ma.addObject("goodstypelist", goodstypelist);
			ma.addObject(RESULT, SUCCESS);
	        ma.setViewName("backjsp/goodslist");
		}
		return ma;
	}
	
	@RequestMapping("/back/deletegoodsbyid")
	public ModelAndView deletegoodsbyid(Model model,String id) throws Exception {
		ModelAndView ma = new ModelAndView();
		Goods goods = new Goods();
		goods.setId(Integer.parseInt(id));
		int count = goodsService.deletegoodsbyid(goods);
		if(count != 0){
			Goods goods1 = new Goods();
			int current = 1;
			PageBean<GoodsVO> goodslist = goodsService.rolegoodslist(current,goods1);
			List<GoodsType> goodstypelist = goodsService.goodstypelist();
			ma.addObject("goodslist", goodslist);
			ma.addObject("deletegoodsbyidd", SUCCESS);
			ma.addObject("goodstypelist", goodstypelist);
			ma.addObject(RESULT, SUCCESS);
	        ma.setViewName("backjsp/goodslist");
		}
		return ma;
	}
	
	@RequestMapping("/back/updategoodstui")
	public ModelAndView updategoodstui(Model model,String id,String tuijian) throws Exception {
		ModelAndView ma = new ModelAndView();
		Goods goodss = new Goods();
		goodss.setId(Integer.parseInt(id));
		goodss.setTuijian(Integer.parseInt(tuijian));
		int count = goodsService.updategoodstui(goodss);
		if(count != 0){
			Goods goods = new Goods();
			int current = 1;
			PageBean<GoodsVO> goodslist = goodsService.rolegoodslist(current,goods);
			List<GoodsType> goodstypelist = goodsService.goodstypelist();
			ma.addObject("goodslist", goodslist);
			ma.addObject("goodstypelist", goodstypelist);
			ma.addObject(RESULT, SUCCESS);
	        ma.setViewName("backjsp/goodslist");
			return ma;
		}
		else{
			Goods goods = new Goods();
			int current = 1;
			PageBean<GoodsVO> goodslist = goodsService.rolegoodslist(current,goods);
			List<GoodsType> goodstypelist = goodsService.goodstypelist();
			ma.addObject("goodslist", goodslist);
			ma.addObject("goodstypelist", goodstypelist);
			ma.addObject(RESULT, SUCCESS);
	        ma.setViewName("backjsp/goodslist");
			ma.addObject("updatetui", FAILURE);
			return ma;
		}
	}
	
}
