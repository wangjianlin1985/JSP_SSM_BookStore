package com.shopping.servlet;

import java.awt.image.RenderedImage;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shopping.util.CodeUtil;
import com.shopping.vo.AddressVO;
import com.shopping.vo.UserVO;
import com.shopping.model.Address;
import com.shopping.model.PageBean;
import com.shopping.model.User;
import com.shopping.service.AddressService;
import com.shopping.service.UserServices;

@Controller
public class UserServlet {
	
	/** 返回信息_返回结果标记 */
    public static final String RESULT = "RESULT";
    /** 返回信息_返回结果信息标记 */
    public static final String MESSAGE = "MESSAGE";
    /** 返回信息_成功 */
    public static final String SUCCESS = "SUCCESS";
    /** 返回信息_失败 */
    public static final String FAILURE = "FAILURE";
	
	@Autowired
	private UserServices userServices;
	@Autowired
	private AddressService addressService;
	
	@ResponseBody
	@RequestMapping("/userLogin")
	public Map<String, Object> userLogin(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//输入的验证码
		String code = request.getParameter("code");
		// 验证验证码
        String sessionCode = request.getSession().getAttribute("code").toString();
        if (code != null && !"".equals(code) && sessionCode != null && !"".equals(sessionCode)) {
            if (code.equalsIgnoreCase(sessionCode)) {
            	User user = new User();
                user.setUsername(username);
                user.setPassword(password);
                user.setRole(0);
        		User users = userServices.userLogin(user);
        		if(users != null){
        			request.getSession().setAttribute("user", users);
        			map.put("result", SUCCESS);
                    map.put("message", "登陆成功");
        		}
        		else{
        			map.put("result", FAILURE);
                    map.put("message", "用户名或密码错误");
        		}
            } else {
            	map.put("result", FAILURE);
                map.put("message", "验证码错误");
            }
        } else {
        	map.put("result", FAILURE);
            map.put("message", "验证码错误");
        }
        
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping("/roleUserLogin")
	public Map<String, Object> roleUserLogin(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
    	User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(1);
		User users = userServices.userLogin(user);
		if(users != null){
			request.getSession().setAttribute("roleuser", users);
			map.put("result", SUCCESS);
            map.put("message", "登陆成功");
		}
		else{
			map.put("result", FAILURE);
            map.put("message", "用户名或密码错误");
		}
		return map;
	}
	
	@RequestMapping("/personcenter")
	public ModelAndView personcenter(Model model,String userid) throws Exception {
		ModelAndView ma = new ModelAndView();
		int userids = Integer.parseInt(userid);
		User users = userServices.checkUserById(userids);
		Address address = new Address();
		address.setUserid(Integer.parseInt(userid));
		List<AddressVO> adresslist = addressService.selectaddressbyid(address);
		if(users != null){
			ma.addObject("adresslist", adresslist);
			ma.addObject("users", users);
			ma.addObject(RESULT, SUCCESS);
			ma.setViewName("frontjsp/personcenter");
			return ma;
		}
		else{
			ma.setViewName("frontjsp/login");
			return ma;
		}
	}
	
	@RequestMapping("/rolelogout")
	public void rolelogout(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getParameter("userid") == null || request.getParameter("userid").equals("")){
			response.sendRedirect("jsp/backjsp/login.jsp");
		}else{
			int userid = Integer.parseInt(request.getParameter("userid"));
			User users = userServices.checkUserById(userid);
			if(users != null){
				request.getSession().removeAttribute("roleuser");
				request.getSession().invalidate();
				response.sendRedirect("jsp/backjsp/login.jsp");
			}
		}
	}
	
	@RequestMapping("/logout")
	public void logout(Model model,HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int userid = Integer.parseInt(request.getParameter("userid"));
		User users = userServices.checkUserById(userid);
		if(users != null){
			request.getSession().removeAttribute("user");
			request.getSession().invalidate();
			response.sendRedirect("contentindex");
		}
		else{
			response.sendRedirect("jsp/frontjsp/login.jsp");
		}
	}
	
	@RequestMapping("/getCode")
	public void getCode(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 调用工具类生成的验证码和验证码图片
        Map<String, Object> codeMap = CodeUtil.generateCodeAndPic();

        // 将四位数字的验证码保存到Session中。
        HttpSession session = req.getSession();
        session.setAttribute("code", codeMap.get("code").toString());

        // 禁止图像缓存。
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", -1);

        resp.setContentType("image/jpeg");

        // 将图像输出到Servlet输出流中。
        ServletOutputStream sos;
        try {
            sos = resp.getOutputStream();
            ImageIO.write((RenderedImage) codeMap.get("codePic"), "jpeg", sos);
            sos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
	@ResponseBody
	@RequestMapping("/register")
	public Map<String, Object> register(Model model,@Validated UserVO user,HttpSession session) throws Exception {
		Map<String, Object> map = new HashMap<String,Object>();
		if(user.getPassword() != user.getPasswordtwo()){
			map.put("result", FAILURE);
            map.put("message", "前后输入的两次密码不同，请重新输入");
		}
		User user1 =  new User();
		user1.setUsername(user.getUsername());
		user1.setPassword(user.getPassword());
		user1.setEmail(user.getEmail());
		user1.setRole(0);
		User users = userServices.userLogin(user1);
		if(users != null){
			map.put("result", FAILURE);
            map.put("message", "用户名已被注册，请换一个用户名");
			return map;
		}else{
			int id = userServices.insertUser(user1);
			User user2 = userServices.checkUserById(user.getId());
			session.setAttribute("user", user2);
			if(id != 0){
				map.put("result", SUCCESS);
	            map.put("message", "");
				return map;
			}else{
				map.put("result", FAILURE);
	            map.put("message", "用户注册失败");
				return map;
			}
		}
		
	}
	
	@RequestMapping("/updateuser")
	public ModelAndView updateuser(Model model,String userid,String email,String mobile,String sex,String age,String usersign) throws Exception {
		ModelAndView ma = new ModelAndView();
		User user = new User();
		user.setId(Integer.parseInt(userid));
		user.setAge(age);
		user.setEmail(email);
		user.setSex(sex);
		user.setMobile(mobile);
		user.setUsersign(usersign);
		int count = userServices.updateuser(user);
		if(count != 0){
			User users = userServices.checkUserById(Integer.parseInt(userid));
			Address address = new Address();
			address.setUserid(Integer.parseInt(userid));
			List<AddressVO> adresslist = addressService.selectaddressbyid(address);
			if(users != null){
				ma.addObject("adresslist", adresslist);
				ma.addObject("users", users);
				ma.addObject("userupdate", SUCCESS);
				ma.setViewName("frontjsp/personcenter");
				return ma;
			}
			else{
				ma.addObject("userupdate", FAILURE);
				ma.setViewName("frontjsp/login");
				return ma;
			}
		}else{
			ma.addObject("userupdate", FAILURE);
			ma.setViewName("frontjsp/personcenter");
			return ma;
		}
	}
	
	@RequestMapping("/back/roleuserlist")
	public ModelAndView roleuserlist(Model model,String currentPage) throws Exception {
		ModelAndView ma = new ModelAndView();
		PageBean<UserVO> roleuserlist = userServices.userlist(Integer.parseInt(currentPage));
		ma.addObject("roleuserlist", roleuserlist);
		ma.addObject(RESULT, SUCCESS);
        ma.setViewName("backjsp/roleuserlist");
		return ma;
	}

}
