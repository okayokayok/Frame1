package cn.edu.neu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.AdminMapper;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.Color;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Pic;
import cn.edu.neu.model.Size;
import cn.edu.neu.model.User;
import cn.edu.neu.service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{

	@Resource
	private AdminMapper mapper;
	
	@Override
	public User checkAdmin(User user) {
		// TODO Auto-generated method stub
		return mapper.checkAdmin(user);
	}
	
	@Override
	public Page<Category> getAllCates() {
		// TODO Auto-generated method stub
		Page<Category> page = new Page<Category>();
		List<Category> cates=mapper.findAll(page);
		page.setList(cates);
		return page;
	}

	@Override
	public Category findCateByid(int cateId) {
		// TODO Auto-generated method stub
		return mapper.findCateByid(cateId);
	}

	@Override
	public void handleCate(Category category) {
		// TODO Auto-generated method stub
		mapper.handleCate(category);
	}

	@Override
	public Page<Size> getAdminSizes() {
		// TODO Auto-generated method stub
		Page<Size> page = new Page<Size>(15);
		List<Size> sizes=mapper.getAdminSizes(page);
		page.setList(sizes);
		return page;
	}

	@Override
	public boolean delSizeById(int sizeId) {
		// TODO Auto-generated method stub
		return mapper.delSizeById(sizeId);
	}

	@Override
	public boolean addSize(Size size) {
		// TODO Auto-generated method stub
		return mapper.addSize(size);
	}

	@Override
	public boolean updateSize(Size size) {
		// TODO Auto-generated method stub
		return mapper.updateSize(size);
	}

	@Override
	public Size findSizeById(int sizeId) {
		// TODO Auto-generated method stub
		return mapper.findSizeById(sizeId);
	}

	@Override
	public Page<Color> getAdminColors() {
		// TODO Auto-generated method stub
		Page<Color> page = new Page<Color>(15);
		List<Color> colors=mapper.getAdminColors(page);
		page.setList(colors);
		return page;
	}

	@Override
	public boolean delColorById(int colorId) {
		// TODO Auto-generated method stub
		return mapper.delColorById(colorId);
	}

	@Override
	public boolean updateColor(Color color) {
		// TODO Auto-generated method stub
		return mapper.updateColor(color);
	}

	@Override
	public Color findColorById(int colorId) {
		// TODO Auto-generated method stub
		return mapper.findColorById(colorId);
	}

	@Override
	public boolean addColor(Color color) {
		// TODO Auto-generated method stub
		return mapper.addColor(color);
	}
	
	
	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return mapper.findAll();
	}

	@Override
	public List<Goods> findAllGoods() {
		// TODO Auto-generated method stub
		return mapper.findAllGoods();
	}

	@Override
	public List<Goods> SearchGoods(int cateId, String goodsName, String startPrice, String endPrice) {
		// TODO Auto-generated method stub
		return mapper.SearchGoods(cateId,goodsName,startPrice,endPrice);
	}

	@Override
	public Goods findGoodsByid(int goodsId) {
		// TODO Auto-generated method stub
		return mapper.findGoodsByid(goodsId);
	}

	@Override
	public void updateGood(Goods good) {
		// TODO Auto-generated method stub
		mapper.updateGood(good);
	}

	@Override
	public void delGoods(int goodsId) {
		// TODO Auto-generated method stub
		mapper.delGoods(goodsId);
	}

	@Override
	public void delGoodSize(int goodsId) {
		// TODO Auto-generated method stub
		mapper.delGoodSize(goodsId);
	}

	@Override
	public void delGoodColor(int goodsId) {
		// TODO Auto-generated method stub
		mapper.delGoodColor(goodsId);
	}

	
	@Override
	public List<Pic> getGoodPicsBygoodsId(int goodsId) {
		// TODO Auto-generated method stub
		return mapper.getGoodPicsBygoodsId(goodsId);
	}

	@Override
	public void delGoodsPics(int picId, int goodsId) {
		// TODO Auto-generated method stub
		mapper.delGoodsPics(picId,goodsId);
	}

	@Override
	public void addGoodsPics(int goodsId, String string) {
		// TODO Auto-generated method stub
		mapper.addGoodsPics(goodsId,string);
	}

	@Override
	public List<Size> findGoodsSize(int goodsId) {
		// TODO Auto-generated method stub
		return mapper.findGoodsSize(goodsId);
	}

	@Override
	public List<Color> findGoodsColors(int goodsId) {
		// TODO Auto-generated method stub
		return mapper.findGoodsColors(goodsId);
	}

	@Override
	public void addGoodSizes(int i, int goodsId) {
		// TODO Auto-generated method stub
		mapper.addGoodSizes(i,goodsId);
	}

	@Override
	public void addGoodColors(int i, int goodsId) {
		// TODO Auto-generated method stub
		mapper.addGoodColors(i,goodsId);
	}

	@Override
	public List<Size> findGoodsSizesById(int goodsId) {
		// TODO Auto-generated method stub
		return mapper.findGoodsSizesById(goodsId);
	}

	@Override
	public void delGoodSizes(int goodsId) {
		// TODO Auto-generated method stub
		mapper.delGoodSizes(goodsId);
	}

	@Override
	public List<Color> findGoodsColorsById(int goodsId) {
		// TODO Auto-generated method stub
		return mapper.findGoodsColorsById(goodsId);
	}

	@Override
	public void delGoodColors(int goodsId) {
		// TODO Auto-generated method stub
		mapper.delGoodColors(goodsId);
	}







}
