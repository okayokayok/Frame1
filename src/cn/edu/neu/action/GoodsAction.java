package cn.edu.neu.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Goods;
import cn.edu.neu.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsAction {
	@Autowired
	GoodsService goodsService;
	
	/**
	 * @Content：根据类别id来获取该类别商品
	 *           请求方式为GET
	 * @param cateId
	 * @param m
	 * @param sort
	 * @return
	 */
	@RequestMapping("/getGoodsByCate")
	public String getGoodsByCate(String cateId,Model model,
			@RequestParam(required=false) String sort){
		Page<Goods> goodsList=goodsService.getGoodsByCate(cateId,sort);
		model.addAttribute("goodsList",goodsList);
		System.out.println("goodsList:"+goodsList);
		return "/goods/goodsList";
	}
	
	@RequestMapping("/searchGoods")
	public String searchGoods(String keyword,@RequestParam(required=false) String sort,
			Model model) throws UnsupportedEncodingException{
		System.out.println(keyword);
		Page<Goods> searchGoods=goodsService.searchGoods(keyword,sort);
		model.addAttribute("goodsList", searchGoods);	
		return "/goods/goodsList";
	}
	
	@RequestMapping("/getGoodsDetailById")
	public String getGoodsDetailById(String goodsId,Model model){
		Goods goodsDetail=goodsService.getGoodsDetailById(goodsId);
		Goods goodsSizes=goodsService.getGoodsSizesById(goodsId);
		Goods goodsColors=goodsService.getGoodsColorsById(goodsId);
		model.addAttribute("goodsDetail", goodsDetail);
		model.addAttribute("goodsSizes", goodsSizes);
		model.addAttribute("goodsColors",goodsColors);
		System.out.println(goodsDetail);
		System.out.println(goodsSizes);
		System.out.println(goodsColors);
		return "/goods/goodsDetail";
	}
	
	
	@RequestMapping("/getNewGoods")
	public String getNewGoods(Model model){
		System.out.println("进入接口");
		List<Goods> goodsList =goodsService.getNewGoods();
		System.out.println("新到"+goodsList.toString());
		model.addAttribute("goodsList",goodsList);
		System.out.println("goodsList:"+goodsList);
		return "/goods/list";
	}
	
	
	@RequestMapping("/getSalesGoods")
	public String getSalesGoods(Model model){
		System.out.println("进入接口");
		List<Goods> goodsList =goodsService.getSalesGoods();
		System.out.println("热销"+goodsList.toString());
		model.addAttribute("goodsList",goodsList);
		System.out.println("goodsList:"+goodsList);
		return "/goods/list";
	}
}
