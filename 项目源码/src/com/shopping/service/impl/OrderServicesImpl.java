package com.shopping.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.mapper.OrderMapper;
import com.shopping.model.Orders;
import com.shopping.model.PageBean;
import com.shopping.model.OrderDetial;
import com.shopping.service.OrderService;
import com.shopping.vo.OrderVO;

@Service
public class OrderServicesImpl implements OrderService{
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public int addorders(Orders order) throws Exception {
		return orderMapper.addorders(order);
	}

	@Override
	public int addorderdetail(OrderDetial orderDetial) throws Exception {
		return orderMapper.addorderdetail(orderDetial);
	}

	@Override
	public PageBean<OrderVO> orderlist(int currentPage, OrderVO orderVO) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
        PageBean<OrderVO> pageBean = new PageBean<OrderVO>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int count=5;
        pageBean.setCount(count);

        //封装总记录数
        int totalCount = orderMapper.ordercount(orderVO);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/count);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*count);
        map.put("count", pageBean.getCount());
        map.put("userid", orderVO.getUserid());
        //封装每页显示的数据
        List<OrderVO> lists = orderMapper.orderlist(map);
        pageBean.setList(lists);
        return pageBean;
	}

	@Override
	public int deleteorderbyid(OrderDetial ordersDetail) throws Exception {
		return orderMapper.deleteorderbyid(ordersDetail);
	}

	@Override
	public PageBean<OrderVO> roleorderlist(int currentPage, OrderVO orderVO) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
        PageBean<OrderVO> pageBean = new PageBean<OrderVO>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int count=3;
        pageBean.setCount(count);

        //封装总记录数
        
        int totalCount = orderMapper.roleordercount(orderVO);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/count);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*count);
        map.put("count", pageBean.getCount());
        map.put("status", orderVO.getStatus());
        //封装每页显示的数据
        List<OrderVO> lists = orderMapper.roleorderlist(map);
        pageBean.setList(lists);
        return pageBean;
	}

	@Override
	public int roleupdateorder(OrderDetial ordersDetail) throws Exception {
		return orderMapper.roleupdateorder(ordersDetail);
	}

	@Override
	public OrderDetial selectorderbyid(OrderDetial ordersDetail) throws Exception {
		return orderMapper.selectorderbyid(ordersDetail);
	}
	
}
