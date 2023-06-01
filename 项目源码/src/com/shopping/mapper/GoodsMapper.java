package com.shopping.mapper;

import java.util.List;
import java.util.Map;

import com.shopping.model.Goods;
import com.shopping.model.GoodsType;
import com.shopping.vo.GoodsVO;

public interface GoodsMapper {
	public List<Goods> getTuiGoods() throws Exception;
	public GoodsVO getGoodsById(int id) throws Exception;
	public List<Goods> goodslist(Map<String, Object> map) throws Exception;
	public List<GoodsVO> rolegoodslist(Map<String, Object> map) throws Exception;
	public List<GoodsType> goodstypelist() throws Exception;
	public int goodsCount(Goods goods) throws Exception;
	public GoodsType goodstypebyid(int id) throws Exception;
	public int updategoodstui(Goods goods) throws Exception;
	public int savegoods(Goods goods) throws Exception;
	public int deletegoodsbyid(Goods goods) throws Exception;
	public int addgoods(Goods goods) throws Exception;
	public int updategoodscount(GoodsVO goodsVO) throws Exception;
}
