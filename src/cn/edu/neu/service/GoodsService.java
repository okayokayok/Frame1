package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Stock;

public interface GoodsService {
	public List<Goods> getNewGoods();

	public List<Goods> getSalesGoods();

	public Page<Goods> getGoodsByCate(String cateId, String sort);

	public Page<Goods> searchGoods(String keyword, String sort);

	public Goods getGoodsDetailById(String goodsId);

	public Goods getGoodsSizesById(String goodsId);

	public Goods getGoodsColorsById(String goodsId);

	public List<Goods> getGoodsListByCate(String cateId);

	public List<Goods> searchGoodsList(String keyword);

	public Page<Goods> findAllGoods();

	public List<Stock> getStocksByGoodsId(int goodsId);

	public boolean updateStock(int stockId, int stockNum);

	public boolean updateGoodsStock(int goodsId, int goodsStock);

	public boolean addGoods(Goods good);

}
