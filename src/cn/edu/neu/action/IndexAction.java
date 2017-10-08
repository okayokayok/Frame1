package cn.edu.neu.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.neu.model.Category;
import cn.edu.neu.service.CateService;



@Controller
public class IndexAction extends BaseAction{
	
	@Autowired
	private CateService cateService;
	
	
	@RequestMapping("/index")
	public String getIndexPage(Model model){//这里的m不是从前端传入的，在这里起到创建一个map
		//System.out.println("indexaction");
		List<Category> cates=cateService.getAllCates();//获取所有的商品分类
		System.out.println(cates);
		//返回数据到界面
		model.addAttribute("cates", cates);
		return "home";
	}
}
