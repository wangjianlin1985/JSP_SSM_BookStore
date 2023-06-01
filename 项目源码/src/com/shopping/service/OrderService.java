package com.shopping.service;

import com.shopping.model.Orders;
import com.shopping.model.PageBean;
import com.shopping.vo.OrderVO;

import com.shopping.model.OrderDetial;

public interface OrderService {
	public int addorders(Orders order) throws Exception;
	public int addorderdetail(OrderDetial orderDetial) throws Exception;
	public PageBean<OrderVO> orderlist(int currentPage,OrderVO orderVO) throws Exception;
	public int deleteorderbyid(OrderDetial ordersDetail) throws Exception;
	public PageBean<OrderVO> roleorderlist(int currentPage,OrderVO orderVO) throws Exception;
	public int roleupdateorder(OrderDetial ordersDetail) throws Exception;
	public OrderDetial selectorderbyid(OrderDetial ordersDetail) throws Exception;
}
