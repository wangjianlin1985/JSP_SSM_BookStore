package com.shopping.mapper;

import com.shopping.vo.AftersalesVO;

import java.util.List;
import java.util.Map;

import com.shopping.model.Aftersales;

public interface AftersalesMapper {
	public int insertAftersales(Aftersales aftersales) throws Exception;
	public int roleaftersalescount(AftersalesVO aftersalesVO) throws Exception;
	public List<AftersalesVO> roleaftersaleslist(Map<String, Object> map) throws Exception;
	public int roleupdateaftersales(AftersalesVO aftersalesVO) throws Exception;
	public int selectaftersalescountss(AftersalesVO aftersalesVO) throws Exception;
}
