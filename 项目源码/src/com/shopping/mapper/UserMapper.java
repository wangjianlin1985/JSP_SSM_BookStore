package com.shopping.mapper;

import java.util.List;
import java.util.Map;

import com.shopping.model.User;
import com.shopping.vo.UserVO;

public interface UserMapper {
	public User userLogin(User user) throws Exception;
	public int insertUser(User user) throws Exception;
	public User checkUserById(int id)  throws Exception;
	public int updateuser(User user) throws Exception;
	public int usercount() throws Exception;
	public List<UserVO> userlist(Map<String, Object> map) throws Exception;
}
