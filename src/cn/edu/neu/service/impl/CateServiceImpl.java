package cn.edu.neu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.mapper.CateMapper;
import cn.edu.neu.model.Category;
import cn.edu.neu.service.CateService;
@Service
@Transactional
public class CateServiceImpl implements CateService{

	@Autowired
	private CateMapper mapper;
	
	@Override
	public List<Category> getAllCates() {
		// TODO Auto-generated method stub
		List<Category> cates=mapper.findAll();
		return cates;
	}

	@Override
	public void addType(String cateName, String cateDc) {
		mapper.addType(cateName,cateDc);
		
	}

	@Override
	public void deleteType(int cateId) {
		mapper.deleteType(cateId);
		
	}

	@Override
	public Category finId(int cateId) {
		// TODO Auto-generated method stub
		return mapper.finId(cateId);
	}

	@Override
	public void updateType(Category cateGory) {
		mapper.updateType(cateGory);
		
	}

	@Override
	public boolean addCate(Category category) {
		// TODO Auto-generated method stub
		return mapper.addCate(category);
	}

}
