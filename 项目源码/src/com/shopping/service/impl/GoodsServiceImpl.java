package com.shopping.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.mapper.GoodsMapper;
import com.shopping.model.Goods;
import com.shopping.model.GoodsType;
import com.shopping.model.PageBean;
import com.shopping.service.GoodsService;
import com.shopping.vo.GoodsVO;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public List<Goods> getTuiGoods() throws Exception {
		return goodsMapper.getTuiGoods();
	}

	@Override
	public GoodsVO getGoodsById(int id) throws Exception {
		return goodsMapper.getGoodsById(id);
	}

	@Override
	public PageBean<Goods> goodslist(int currentPage,Goods goods) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
        PageBean<Goods> pageBean = new PageBean<Goods>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int count=8;
        pageBean.setCount(count);

        //封装总记录数
        int totalCount = goodsMapper.goodsCount(goods);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/count);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*count);
        map.put("count", pageBean.getCount());
        map.put("typeid", goods.getTypeid());
        //封装每页显示的数据
        List<Goods> lists = goodsMapper.goodslist(map);
        pageBean.setList(lists);
        return pageBean;
	}

	@Override
	public List<GoodsType> goodstypelist() throws Exception {
		return goodsMapper.goodstypelist();
	}

	@Override
	public GoodsType goodstypebyid(int id) throws Exception {
		return goodsMapper.goodstypebyid(id);
	}

	@Override
	public PageBean<GoodsVO> rolegoodslist(int currentPage, Goods goods) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
        PageBean<GoodsVO> pageBean = new PageBean<GoodsVO>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int count=5;
        pageBean.setCount(count);

        //封装总记录数
        int totalCount = goodsMapper.goodsCount(goods);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/count);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*count);
        map.put("count", pageBean.getCount());
        map.put("typeid", goods.getTypeid());
        //封装每页显示的数据
        List<GoodsVO> lists = goodsMapper.rolegoodslist(map);
        pageBean.setList(lists);
        return pageBean;
	}

	@Override
	public int updategoodstui(Goods goods) throws Exception {
		return goodsMapper.updategoodstui(goods);
	}

	@Override
	public int savegoods(Goods goods) throws Exception {
		return goodsMapper.savegoods(goods);
	}

	@Override
	public int deletegoodsbyid(Goods goods) throws Exception {
		return goodsMapper.deletegoodsbyid(goods);
	}

	@Override
	public int addgoods(Goods goods) throws Exception {
		goods.setTuijian(0);
		goods.setTotal(0);
		goods.setCreater("ADMIN");
		goods.setCreatedate(new Date());
		return goodsMapper.addgoods(goods);
	}

	@Override
	public int updategoodscount(GoodsVO goodsVO) throws Exception {
		return goodsMapper.updategoodscount(goodsVO);
	}
	
}
