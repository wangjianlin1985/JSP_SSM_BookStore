package com.shopping.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.mapper.GoodstypeMapper;
import com.shopping.model.GoodsType;
import com.shopping.model.PageBean;
import com.shopping.service.GoodstypeService;
import com.shopping.vo.GoodstypeVO;

@Service
public class GoodstypeServiceImpl implements GoodstypeService{

	@Autowired
	private GoodstypeMapper goodstypeMapper;

	@Override
	public int addgoodstype(GoodsType goodsType) throws Exception {
		return goodstypeMapper.addgoodstype(goodsType);
	}

	@Override
	public int deletegoodstype(GoodsType goodsType) throws Exception {
		return goodstypeMapper.deletegoodstype(goodsType);
	}

	@Override
	public PageBean<GoodstypeVO> rolegoodstypelist(int currentPage, GoodstypeVO goodstypeVO) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
        PageBean<GoodstypeVO> pageBean = new PageBean<GoodstypeVO>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int count=5;
        pageBean.setCount(count);

        //封装总记录数
        int totalCount = goodstypeMapper.rolegoodstypecount(goodstypeVO);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/count);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*count);
        map.put("count", pageBean.getCount());
        //封装每页显示的数据
        List<GoodstypeVO> lists = goodstypeMapper.rolegoodstypelist(map);
        pageBean.setList(lists);
        return pageBean;
	}

}
