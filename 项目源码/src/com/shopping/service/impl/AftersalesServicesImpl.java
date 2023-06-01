package com.shopping.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.mapper.AftersalesMapper;
import com.shopping.model.PageBean;
import com.shopping.model.Aftersales;
import com.shopping.service.AftersalesService;
import com.shopping.vo.AftersalesVO;

@Service
public class AftersalesServicesImpl implements AftersalesService{
	
	@Autowired
	private AftersalesMapper aftersalesMapper;

	@Override
	public int insertAftersales(Aftersales aftersales) throws Exception {
		return aftersalesMapper.insertAftersales(aftersales);
	}

	@Override
	public PageBean<AftersalesVO> roleaftersaleslist(int currentPage,AftersalesVO aftersalesVO) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
        PageBean<AftersalesVO> pageBean = new PageBean<AftersalesVO>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int count=5;
        pageBean.setCount(count);

        //封装总记录数
        int totalCount = aftersalesMapper.roleaftersalescount(aftersalesVO);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/count);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*count);
        map.put("count", pageBean.getCount());
        map.put("status", aftersalesVO.getStatus());
        //封装每页显示的数据
        List<AftersalesVO> lists = aftersalesMapper.roleaftersaleslist(map);
        pageBean.setList(lists);
        return pageBean;
	}

	@Override
	public int roleupdateaftersales(AftersalesVO aftersalesVO) throws Exception {
		return aftersalesMapper.roleupdateaftersales(aftersalesVO);
	}

	@Override
	public int selectaftersalescountss(AftersalesVO aftersalesVO) throws Exception {
		return aftersalesMapper.selectaftersalescountss(aftersalesVO);
	}

}
