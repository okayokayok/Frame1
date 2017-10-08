package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Stock;

public interface GoodsMapper {

	List<Goods> findGoodsByCate(Page page);

	List<Goods> findGoodsByKeyword(Page<Goods> page);

	Goods findGoodsDetailById(String goodsId);

	Goods findGoodsSizesById(String goodsId);

	Goods findGoodsColorsById(String goodsId);

	List<Goods> findGoodsListByCate(String cateId);

	List<Goods> findGoodsListByKeyword(String keyword);

	List<Goods> findNewGoods();

	List<Goods> findSalesGoods();

	List<Goods> findAllGoods(Page<Goods> page);

	List<Stock> getStocksByGoodsId(int goodsId);

	boolean updateStock(int stockId, int stockNum);

	boolean updateGoodsStock(int goodsId, int goodsStock);

	boolean addGoods(Goods good);

}
