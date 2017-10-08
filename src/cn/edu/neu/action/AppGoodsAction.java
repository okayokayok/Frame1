package cn.edu.neu.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.neu.model.Goods;
import cn.edu.neu.service.GoodsService;

@RequestMapping("/appgoods")
@Controller
public class AppGoodsAction extends BaseAction{
	
	@Autowired
	GoodsService goodsService;
	
	@ResponseBody
	@RequestMapping("/getNewGoods")
	public Map<String,List<Goods>> getNewGoods(){
		List<Goods> newGoods=goodsService.getNewGoods();
		Map<String,List<Goods>> m=new HashMap<String,List<Goods>>();
		m.put("newGoods", newGoods);
		return m;
	}
	
	@ResponseBody
	@RequestMapping("/getSalesGoods")
	public  Map<String,List<Goods>> getSalesGoods(){
		List<Goods> salesGoods=goodsService.getSalesGoods();
		Map<String,List<Goods>> m=new HashMap<String,List<Goods>>();
		m.put("salesGoods", salesGoods);
		return m;
	}
		
	
	@ResponseBody
	@RequestMapping("/getGoodsByCate")
	public Map<String,List<Goods>> getGoodsByCate(@RequestParam String cateId){
		List<Goods> goodsList=goodsService.getGoodsListByCate(cateId);
		Map<String,List<Goods>> m=new HashMap<String,List<Goods>>();
		m.put("goodsList",goodsList);
		System.out.println("goodsList:"+goodsList);
		return m;
	}

	@ResponseBody
	@RequestMapping("/searchGoods")
	public Map<String,List<Goods>> searchGoods(@RequestParam String keyword) {
		System.out.println(keyword);
		List<Goods> searchGoods=goodsService.searchGoodsList(keyword);
		Map<String,List<Goods>> m=new HashMap<String,List<Goods>>();
		m.put("goodsList", searchGoods);	
		return m;
	}
	
	@ResponseBody
	@RequestMapping("/getGoodsDetailById")
	public Map<String,Goods> getGoodsDetailById(@RequestParam String goodsId){
		Goods goodsDetail=goodsService.getGoodsDetailById(goodsId);
		Goods goodsSizes=goodsService.getGoodsSizesById(goodsId);
		Goods goodsColors=goodsService.getGoodsColorsById(goodsId);
		Map<String,Goods> m=new HashMap<String,Goods>();
		m.put("goodsDetail", goodsDetail);
		m.put("goodsSizes", goodsSizes);
		m.put("goodsColors",goodsColors);
		System.out.println(goodsDetail);
		System.out.println(goodsSizes);
		System.out.println(goodsColors);
		return m;
	}
}