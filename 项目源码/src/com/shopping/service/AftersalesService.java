package com.shopping.service;

import com.shopping.model.PageBean;
import com.shopping.vo.AftersalesVO;
import com.shopping.model.Aftersales;

public interface AftersalesService {
	public int insertAftersales(Aftersales aftersales) throws Exception;
	public PageBean<AftersalesVO> roleaftersaleslist(int currentPage,AftersalesVO aftersalesVO) throws Exception;
	public int roleupdateaftersales(AftersalesVO aftersalesVO) throws Exception;
	public int selectaftersalescountss(AftersalesVO aftersalesVO) throws Exception;
}
