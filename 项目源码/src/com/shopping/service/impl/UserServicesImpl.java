package com.shopping.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.contant.BasicContant;
import com.shopping.mapper.UserMapper;
import com.shopping.model.PageBean;
import com.shopping.model.User;
import com.shopping.service.UserServices;
import com.shopping.vo.UserVO;

@Service
public class UserServicesImpl implements UserServices{
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User userLogin(User user) throws Exception {
		User users = userMapper.userLogin(user);
		int count = 0;
		if(users!=null){
			count = 1;
			if(count == 0){
				return null;
			}
		}
		return users;
	}

	
	public User checkUserById(int id)  throws Exception{
		User user = userMapper.checkUserById(id);
		return user;	
	}


	@Override
	public int insertUser(User user) throws Exception {
		user.setRole(0);
		user.setCreater(BasicContant.REGISTER);
		user.setCreatedate(new Date());
		int count = userMapper.insertUser(user);
		return count;
	}


	@Override
	public int updateuser(User user) throws Exception {
		return userMapper.updateuser(user);
	}


	@Override
	public PageBean<UserVO> userlist(int currentPage) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
        PageBean<UserVO> pageBean = new PageBean<UserVO>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int count=5;
        pageBean.setCount(count);

        //封装总记录数
        int totalCount = userMapper.usercount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/count);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*count);
        map.put("count", pageBean.getCount());
        //封装每页显示的数据
        List<UserVO> lists = userMapper.userlist(map);
        pageBean.setList(lists);
        return pageBean;
	}
}
