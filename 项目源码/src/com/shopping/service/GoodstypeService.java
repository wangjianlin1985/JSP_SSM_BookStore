package com.shopping.service;

import com.shopping.model.GoodsType;
import com.shopping.model.PageBean;
import com.shopping.vo.GoodstypeVO;

public interface GoodstypeService {

	public int addgoodstype(GoodsType goodsType)  throws Exception;
	public int deletegoodstype(GoodsType goodsType)  throws Exception;
	public PageBean<GoodstypeVO> rolegoodstypelist(int currentPage,GoodstypeVO goodstypeVO) throws Exception;
}
