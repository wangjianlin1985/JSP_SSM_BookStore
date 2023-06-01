package com.shopping.mapper;

import com.shopping.model.Orders;
import com.shopping.vo.OrderVO;

import java.util.List;
import java.util.Map;

import com.shopping.model.OrderDetial;

public interface OrderMapper {
	public int addorders(Orders order) throws Exception;
	public int addorderdetail(OrderDetial orderDetial) throws Exception;
	public List<OrderVO> orderlist(Map<String, Object> map) throws Exception;
	public int ordercount(OrderVO orderVO) throws Exception;
	public int deleteorderbyid(OrderDetial ordersDetail) throws Exception;
	public int roleordercount(OrderVO orderVO) throws Exception;
	public List<OrderVO> roleorderlist(Map<String, Object> map) throws Exception;
	public int roleupdateorder(OrderDetial ordersDetail) throws Exception;
	public OrderDetial selectorderbyid(OrderDetial ordersDetail) throws Exception;
}
