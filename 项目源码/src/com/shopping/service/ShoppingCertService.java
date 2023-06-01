package com.shopping.service;

import java.util.List;

import com.shopping.model.ShoppingCart;
import com.shopping.vo.ShoppingCartVO;

public interface ShoppingCertService {
	public int addshoppingcart(ShoppingCart shoppingCart) throws Exception;
	public ShoppingCart selectShoppingCartByUserIdGoodsId(ShoppingCart shoppingCart) throws Exception;
	public int updateShoppingCartbyUserIdGoodsId(ShoppingCart shoppingCart) throws Exception;
	public List<ShoppingCartVO> selectShoppingCartByUserId(ShoppingCart shoppingCart) throws Exception;
	public int deletegoodsbyid(ShoppingCart shoppingCart) throws Exception;
}
