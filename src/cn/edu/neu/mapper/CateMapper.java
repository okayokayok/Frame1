package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.model.Category;

public interface CateMapper {

	List<Category> findAll();
	
	public void addType(String cateName,String cateDc);
	
	public void updateType(Category cateGory);
	
	public void deleteType(int cateId);
	
	public Category finId(int cateId);

	boolean addCate(Category category);
}

