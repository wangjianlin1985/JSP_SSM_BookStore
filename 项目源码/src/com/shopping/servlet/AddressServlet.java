package com.shopping.servlet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.model.Address;
import com.shopping.model.User;
import com.shopping.service.AddressService;
import com.shopping.service.UserServices;
import com.shopping.vo.AddressVO;

@Controller
public class AddressServlet {
	
	/** 返回信息_返回结果标记 */
    public static final String RESULT = "RESULT";
    /** 返回信息_返回结果信息标记 */
    public static final String MESSAGE = "MESSAGE";
    /** 返回信息_成功 */
    public static final String SUCCESS = "SUCCESS";
    /** 返回信息_失败 */
    public static final String FAILURE = "FAILURE";
    
    @Autowired
	private AddressService addressService;
    
    @Autowired
    private UserServices userServices;
    
    
    @ResponseBody
	@RequestMapping("/selectaddressbyid")
	public Map<String,Object> selectaddressbyid(Model model,String userid) throws Exception {
    	Map<String,Object> map = new HashMap<String,Object>();
    	Address address = new Address();
    	address.setUserid(Integer.parseInt(userid));
    	List<AddressVO> addresslist = addressService.selectaddressbyid(address);
		if(addresslist.isEmpty()){
			map.put(RESULT, FAILURE);
			map.put(MESSAGE, "没有地址");
			return map;		
		}else{
			map.put("addresslist", addresslist);
			map.put(RESULT, SUCCESS);
			return map;
		}
	}
    
    @RequestMapping("/insertaddress")
	public ModelAndView insertaddress(Model model,String userid,String address) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	Address address1 = new Address();
    	address1.setUserid(Integer.parseInt(userid));
    	address1.setAddress(address);
    	int res = addressService.addresscount(address1);
    	if(res >= 8){
    		User users = userServices.checkUserById(Integer.parseInt(userid));
			Address address2 = new Address();
			address2.setUserid(Integer.parseInt(userid));
			List<AddressVO> adresslist = addressService.selectaddressbyid(address2);
			if(users != null){
				ma.addObject("count8", SUCCESS);
				ma.addObject("adresslist", adresslist);
				ma.addObject("users", users);
				ma.setViewName("frontjsp/personcenter");
				return ma;
			}
			else{
				ma.addObject("insertaddress", FAILURE);
				ma.setViewName("frontjsp/login");
				return ma;
			}
    	}else{
    		int count = addressService.insertaddress(address1);
    		if(count != 0){
    			User users = userServices.checkUserById(Integer.parseInt(userid));
    			Address address2 = new Address();
    			address2.setUserid(Integer.parseInt(userid));
    			List<AddressVO> adresslist = addressService.selectaddressbyid(address2);
    			if(users != null){
    				ma.addObject("adresslist", adresslist);
    				ma.addObject("users", users);
    				ma.addObject("insertaddress", SUCCESS);
    				ma.setViewName("frontjsp/personcenter");
    				return ma;
    			}
    			else{
    				ma.addObject("insertaddress", FAILURE);
    				ma.setViewName("frontjsp/login");
    				return ma;
    			}
    		}else{
    			ma.addObject("insertaddress", FAILURE);
    			return ma;
    		}
    	}	
	}
    
    @RequestMapping("/deleteaddressbyid")
	public ModelAndView deleteaddress(Model model,String userid,String id) throws Exception {
    	ModelAndView ma = new ModelAndView();
    	Address address = new Address();
    	address.setUserid(Integer.parseInt(userid));
    	address.setId(Integer.parseInt(id));
    	int res = addressService.deleteaddress(address);
    	if(res != 0){
			User users = userServices.checkUserById(Integer.parseInt(userid));
			Address address2 = new Address();
			address2.setUserid(Integer.parseInt(userid));
			List<AddressVO> adresslist = addressService.selectaddressbyid(address2);
			if(users != null){
				ma.addObject("adresslist", adresslist);
				ma.addObject("users", users);
				ma.addObject("deleteaddress", SUCCESS);
				ma.setViewName("frontjsp/personcenter");
				return ma;
			}
			else{
				ma.addObject("deleteaddress", FAILURE);
				ma.setViewName("frontjsp/login");
				return ma;
			}
		}else{
			ma.addObject("deleteaddress", FAILURE);
			return ma;
		}
	}
}	
