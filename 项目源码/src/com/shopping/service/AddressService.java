package com.shopping.service;

import java.util.List;

import com.shopping.model.Address;
import com.shopping.vo.AddressVO;

public interface AddressService {
	public List<AddressVO> selectaddressbyid(Address address) throws Exception;
	public int addresscount(Address address) throws Exception;
	public int insertaddress(Address address) throws Exception;
	public int deleteaddress(Address address) throws Exception;
}
