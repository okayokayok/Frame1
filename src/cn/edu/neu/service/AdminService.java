package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.Color;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Pic;
import cn.edu.neu.model.Size;
import cn.edu.neu.model.User;

public interface AdminService {

	User checkAdmin(User user);
	Page<Category> getAllCates();
	Category findCateByid(int cateId);
	void handleCate(Category category);
	Page<Size> getAdminSizes();
	boolean delSizeById(int sizeId);
	boolean addSize(Size size);
	boolean updateSize(Size size);
	Size findSizeById(int sizeId);
	Page<Color> getAdminColors();
	boolean delColorById(int colorId);
	boolean updateColor(Color color);
	Color findColorById(int colorId);
	boolean addColor(Color color);
	
	List<Category> findAll();
	List<Goods> findAllGoods();
	List<Goods> SearchGoods(int cateId, String goodsName, String startPrice, String endPrice);
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
