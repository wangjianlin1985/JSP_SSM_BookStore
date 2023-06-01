package com.shopping.service;

import java.util.List;

import com.shopping.model.Goods;
import com.shopping.model.GoodsType;
import com.shopping.model.PageBean;
import com.shopping.vo.GoodsVO;

public interface GoodsService {
	public List<Goods> getTuiGoods() throws Exception;
	public GoodsVO getGoodsById(int id) throws Exception;
	public PageBean<Goods> goodslist(int currentPage,Goods goods) throws Exception;
	public PageBean<GoodsVO> rolegoodslist(int currentPage,Goods goods) throws Exception;
	public List<GoodsType>goodstypelist() throws Exception;
	public GoodsType goodstypebyid(int id) throws Exception;
	public int updategoodstui(Goods goods) throws Exception;
	public int savegoods(Goods goods) throws Exception;
	public int deletegoodsbyid(Goods goods) throws Exception;
	public int addgoods(Goods goods) throws Exception;
	public int updategoodscount(GoodsVO goodsVO) throws Exception;
}
