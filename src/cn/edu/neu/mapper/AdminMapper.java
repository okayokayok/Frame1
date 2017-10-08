package cn.edu.neu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.Color;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Pic;
import cn.edu.neu.model.Size;
import cn.edu.neu.model.User;

public interface AdminMapper {

	User checkAdmin(User user);
	List<Category> findAll(Page<Category> page);
	Category findCateByid(int cateId);
	void handleCate(Category category);
	List<Size> getAdminSizes(Page<Size> page);
	boolean delSizeById(int sizeId);
	boolean addSize(Size size);
	boolean updateSize(Size size);
	Size findSizeById(int sizeId);
	List<Color> getAdminColors(Page<Color> page);
	boolean delColorById(int colorId);
	boolean updateColor(Color color);
	Color findColorById(int colorId);
	boolean addColor(Color color);
	
	
	List<Category> findAll();
	List<Goods> findAllGoods();
	List<Goods> SearchGoods(@Param("cateId")int cateId, @Param("goodsName")String goodsName, @Param("startPrice")String startPrice, @Param("endPrice")String endPrice);
	Goods findGoodsByid(int goodsId);
	void updateGood(Goods good);
	void delGoods(int goodsId);
	void delGoodSize(int goodsId);
	void delGoodColor(int goodsId);
	
	List<Pic> getGoodPicsBygoodsId(int goodsId);
	void delGoodsPics(int picId, int goodsId);
	void addGoodsPics(int goodsId, String string);
	
	List<Size> findGoodsSize(int goodsId);
	List<Color> findGoodsColors(int goodsId);
	void addGoodSizes(int i, int goodsId);
	void addGoodColors(int i, int goodsId);
	List<Size> findGoodsSizesById(int goodsId);
	void delGoodSizes(int goodsId);
	List<Color> findGoodsColorsById(int goodsId);
	void delGoodColors(int goodsId);


}
