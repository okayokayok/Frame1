package cn.edu.neu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.model.Category;
import cn.edu.neu.service.CateService;

@Controller
@RequestMapping("/cate")
public class CateAction {
	
	@Autowired
	CateService cateService;
	
	/**
	 * @Content:商品分类>查看更多
	 * @param m
	 * @return
	 */
	@RequestMapping("/getAllCatesList")
	public String getAllCatesList(Model model){
		List<Category> cates=cateService.getAllCates();
		model.addAttribute("cates", cates);
		return "/cate/cateList";
	}
	
	@ResponseBody
	@RequestMapping("/getAllCates")
	public Map<String,List<Category>> getAllCates(){
		List<Category> cates=cateService.getAllCates();
		Map<String,List<Category>> m=new HashMap<String,List<Category>>();
		m.put("cates", cates);
		return m;
	}
	
	@RequestMapping("/addView")
	public String addView(Model model){
		//获取商品分类,初识化添加类别界面中的编辑类别
		List<Category> cates=cateService.getAllCates();//获取所有商品分类
		model.addAttribute("cates", cates);
		return "/cate/addView";
	}
	
	/**
	 * 添加类别 由于cate_id是自增的,所以这里不需要传cate_id 
	 * @param cateName
	 * @param cateDc
	 * @return
	 */
	@RequestMapping("/addType")
	public String addType(String cateName,String cateDc){
		cateService.addType(cateName,cateDc);
		//重定向
		return "redirect:/cate/addView";
	}
	
	/**
	 * 根据类别删除类别
	 * @param cateId
	 * @return
	 */
	@RequestMapping("/delete")
	public String Delete(String cateId){
		//Integer.parseInt(cateId)：类型转换
		System.out.println(cateId);
		cateService.deleteType(Integer.parseInt(cateId));
		return "redirect:/cate/addView";
	}
	/**
	 * 根据id查找类别
	 * @param cateId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/finId")
	public Category finId(String cateId){
		Category cateGory=cateService.finId(Integer.parseInt(cateId));
		return cateGory;
	}
	/**
	 * 修改商品
	 * @param cateId
	 * @param cateName
	 * @param cateDc
	 * @return
	 */
	@RequestMapping("/updateType")
	public String updateType(String cateId,String cateName,String cateDc){
		Category cateGory=new Category();
		cateGory.setCateId(Integer.parseInt(cateId));
		cateGory.setCateName(cateName);
		cateGory.setCateDc(cateDc);
		cateService.updateType(cateGory);
		return "redirect:/cate/addView";
	}
	
	
	
	
}
