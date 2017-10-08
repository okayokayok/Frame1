package cn.edu.neu.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.model.Category;
import cn.edu.neu.service.CateService;

@Controller
@RequestMapping("/appcate")
public class AppCateAction {
	
	@Autowired
	CateService cateService;
	
	@ResponseBody
	@RequestMapping("/getAllCatesList")
	public Map<String,List<Category>> getAllCatesList(){
		List<Category> cates=cateService.getAllCates();
		Map<String,List<Category>> m=new HashMap<String,List<Category>>();
		m.put("catesList", cates); 
		return m;
	}
}
