package com.shopping.service;

import com.shopping.model.PageBean;
import com.shopping.model.User;
import com.shopping.vo.UserVO;

public interface UserServices {
	public 	User userLogin(User user) throws Exception;
	public User checkUserById(int id)  throws Exception;
	public int insertUser(User user) throws Exception;
	public int updateuser(User user) throws Exception;
	public PageBean<UserVO> userlist(int currentPage) throws Exception;
}
