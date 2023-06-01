package com.shopping.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.contant.BasicContant;
import com.shopping.mapper.AddressMapper;
import com.shopping.model.Address;
import com.shopping.service.AddressService;
import com.shopping.vo.AddressVO;

@Service
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressMapper addressMapper;

	@Override
	public List<AddressVO> selectaddressbyid(Address address) throws Exception {
		return addressMapper.selectaddressbyid(address);
	}

	@Override
	public int addresscount(Address address) throws Exception {
		return addressMapper.addresscount(address);
	}

	@Override
	public int insertaddress(Address address) throws Exception {
		address.setCreater(BasicContant.USER);
		address.setCreatedate(new Date());
		int count = addressMapper.insertaddress(address);
		return count;
	}

	@Override
	public int deleteaddress(Address address) throws Exception {
		return addressMapper.deleteaddress(address);
	}

}
