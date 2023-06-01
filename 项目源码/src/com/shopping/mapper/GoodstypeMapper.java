package com.shopping.mapper;

import java.util.List;
import java.util.Map;

import com.shopping.model.GoodsType;
import com.shopping.vo.GoodstypeVO;

public interface GoodstypeMapper {
	public int addgoodstype(GoodsType goodsType)  throws Exception;
	public int deletegoodstype(GoodsType goodsType)  throws Exception;
	public List<GoodstypeVO> rolegoodstypelist(Map<String, Object> map) throws Exception;
	public int rolegoodstypecount(GoodstypeVO goodstypeVO) throws Exception;
}
