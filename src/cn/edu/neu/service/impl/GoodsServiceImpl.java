package cn.edu.neu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.GoodsMapper;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Stock;
import cn.edu.neu.service.GoodsService;

@Service
@Transactional
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	GoodsMapper mapper;

	@Override
	public List<Goods> getNewGoods() {
		// TODO Auto-generated method stub
		List<Goods> newGoods=mapper.findNewGoods();
		//System.out.println(newGoods);
		return newGoods;
	}

	@Override
	public List<Goods> getSalesGoods() {
		// TODO Auto-generated method stub
		List<Goods> salesGoods=mapper.findSalesGoods();
		System.out.println(salesGoods);
		return salesGoods;
	}

	@Override
	public Page<Goods> getGoodsByCate(String cateId,String sort) {
		// TODO Auto-generated method stub
		Page<Goods> page=new Page<Goods>(16);
		Map<String,Object> m=new HashMap();
		m.put("cateId", cateId);
		m.put("sort", sort);
		page.setParams(m);
		List<Goods> list=mapper.findGoodsByCate(page);
		page.setList(list);
		return page;
	}

	@Override
	public Page<Goods> searchGoods(String keyword, String sort) {
		// TODO Auto-generated method stub
		Page<Goods> page = new Page<Goods>(15);		
		Map<String,Object> m=new HashMap<String,Object>();
		m.put("keyword", keyword);
		m.put("sort", sort);
		page.setParams(m);
		List<Goods> goodsList=mapper.findGoodsByKeyword(page);
		page.setList(goodsList);
		return page;
	}

	@Override
	public Goods getGoodsDetailById(String goodsId) {
		// TODO Auto-generated method stub
		Goods goodsDetail=mapper.findGoodsDetailById(goodsId);		
		System.out.println(goodsDetail);	
		return goodsDetail;
	}
	@Override
	public Goods getGoodsSizesById(String goodsId) {
		// TODO Auto-generated method stub		
		Goods goodsSizes=mapper.findGoodsSizesById(goodsId);
		System.out.println(goodsSizes);
		return goodsSizes;
	}
	@Override
	public Goods getGoodsColorsById(String goodsId) {
		// TODO Auto-generated method stub
		Goods goodsColors=mapper.findGoodsColorsById(goodsId);
		System.out.println(goodsColors);
		System.out.println(goodsColors);
		return goodsColors;
	}

	@Override
	public List<Goods> getGoodsListByCate(String cateId) {
		// TODO Auto-generated method stub
		return mapper.findGoodsListByCate(cateId);
	}

	@Override
	public List<Goods> searchGoodsList(String keyword) {
		// TODO Auto-generated method stub
		return mapper.findGoodsListByKeyword(keyword);
	}

	@Override
	public Page<Goods> findAllGoods() {
		// TODO Auto-generated method stub
		Page<Goods> page = new Page<Goods>(15);		
		
		List<Goods> goodsList=mapper.findAllGoods(page);
		page.setList(goodsList);
		return page;
	}

	@Override
	public List<Stock> getStocksByGoodsId(int goodsId) {
		// TODO Auto-generated method stub
		return mapper.getStocksByGoodsId(goodsId);
	}

	@Override
	public boolean updateStock(int stockId, int stockNum) {
		// TODO Auto-generated method stub
		return mapper.updateStock(stockId,stockNum);
	}

	@Override
	public boolean updateGoodsStock(int goodsId, int goodsStock) {
		// TODO Auto-generated method stub
		return mapper.updateGoodsStock(goodsId,goodsStock);
	}

	@Override
	public boolean addGoods(Goods good) {
		// TODO Auto-generated method stub
		return mapper.addGoods(good);
	}
}
