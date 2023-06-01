package com.shopping.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.contant.BasicContant;
import com.shopping.mapper.ShoppingCertMapper;
import com.shopping.model.ShoppingCart;
import com.shopping.service.ShoppingCertService;
import com.shopping.vo.ShoppingCartVO;

@Service
public class ShoppingCertServiceImpl implements ShoppingCertService {

	@Autowired
	private ShoppingCertMapper shoppingCertMapper;
	
	@Override
	public int addshoppingcart(ShoppingCart shoppingCart) throws Exception {
		shoppingCart.setCreater(BasicContant.USER);
		shoppingCart.setCreatedate(new Date());
		int count = shoppingCertMapper.addshoppingcart(shoppingCart);
		return count;
	}

	@Override
	public ShoppingCart selectShoppingCartByUserIdGoodsId(ShoppingCart shoppingCart) throws Exception {
		return shoppingCertMapper.selectShoppingCartByUserIdGoodsId(shoppingCart);
	}

	@Override
	public int updateShoppingCartbyUserIdGoodsId(ShoppingCart shoppingCart) throws Exception {
		return shoppingCertMapper.updateShoppingCartbyUserIdGoodsId(shoppingCart);
	}

	@Override
	public List<ShoppingCartVO> selectShoppingCartByUserId(ShoppingCart shoppingCart) throws Exception {
		return shoppingCertMapper.selectShoppingCartByUserId(shoppingCart);
	}

	@Override
	public int deletegoodsbyid(ShoppingCart shoppingCart) throws Exception {
		return shoppingCertMapper.deletegoodsbyid(shoppingCart);
	}

}
