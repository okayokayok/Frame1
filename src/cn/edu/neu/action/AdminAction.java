package cn.edu.neu.action;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.NodeList;

import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

import cn.edu.neu.core.Constants;
import cn.edu.neu.core.common.Page;
import cn.edu.neu.core.common.UUIDUtil;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.Color;
import cn.edu.neu.model.Goods;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;
import cn.edu.neu.model.Pic;
import cn.edu.neu.model.Size;
import cn.edu.neu.model.Stock;
import cn.edu.neu.model.User;
import cn.edu.neu.service.AdminService;
import cn.edu.neu.service.CateService;
import cn.edu.neu.service.GoodsService;
import cn.edu.neu.service.OrderService;
import cn.edu.neu.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminAction extends BaseAction{
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CateService cateService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private GoodsService goodsService;
	
	/**
	 * 用户登出
	 */
	@ResponseBody
	@RequestMapping("/logout")
	public Map<String,String> logout() throws Exception {
		getSession().invalidate();
		Map<String,String> m=new HashMap<String,String>();
		m.put("logout", "yes");
		return m;
	}
	
	@RequestMapping("getAdminCates")
	public String getAdminCates(Model model){
		Page<Category> cates=adminService.getAllCates();
		model.addAttribute("cates", cates);
		System.out.println("---"+cates.toString());
		return "admin/cateList";
	}
	
	@RequestMapping("handleCate")
	public String handleCate(int cateId,Model model){
		 Category category=adminService.findCateByid(cateId);
		 System.out.println(category.toString());
		model.addAttribute("cate", category);
		
		return "admin/cateDetail";
	}
	
	
	@RequestMapping("doHandleCate")
	public String doHandleCate(Category category,MultipartFile catePicFile,HttpSession session){
		System.out.println("-=-=-=-=-"+category.toString());
		
		String path = session.getServletContext().getRealPath("/images/cate");
		if(catePicFile.getOriginalFilename() != null && catePicFile.getOriginalFilename().equals("")) {
			
			System.out.println("图片名："+catePicFile.getOriginalFilename());
			
			String file=UUIDUtil.getRandom32PK();
			String prefix=catePicFile.getOriginalFilename().substring(catePicFile.getOriginalFilename().lastIndexOf(".")+1);
			String file_name=file+"."+prefix;
			
			System.out.println("存的图片路径:"+path);
					
			File targetFile = new File(path , file_name);
			try {
				 if(!targetFile.exists()){  
			            targetFile.mkdirs();  
			        } 
				 catePicFile.transferTo(targetFile);
				System.out.println("成功");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("失败");
			} 
			category.setCatePic("/images/cate/"+file_name);
		}
		
		adminService.handleCate(category);
		
		return "redirect:/admin/handleCate?cateId="+category.getCateId();
	}
	
	@RequestMapping("doAddCate")
	public String addCate(Category category,MultipartFile catePicFile,HttpSession session){
		
		System.out.println("-=-=-=-=-"+category.toString());
		
		String path = session.getServletContext().getRealPath("/images/cate");
		if(!(catePicFile.getOriginalFilename() ==null || "".equals(catePicFile.getOriginalFilename()))) {
			
			System.out.println("图片名："+catePicFile.getOriginalFilename());
			
			String file=UUIDUtil.getRandom32PK();
			String prefix=catePicFile.getOriginalFilename().substring(catePicFile.getOriginalFilename().lastIndexOf(".")+1);
			String file_name=file+"."+prefix;
			
			System.out.println("存的图片路径:"+path);
					
			File targetFile = new File(path , file_name);
			try {
				 if(!targetFile.exists()){  
			            targetFile.mkdirs();  
			        } 
				 catePicFile.transferTo(targetFile);
				System.out.println("成功");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("失败");
			} 
			category.setCatePic("/images/cate/"+file_name);
		}
		
		boolean result = cateService.addCate(category);
		
		return "redirect:/admin/handleCate?cateId="+category.getCateId();
		
	}
	
	@RequestMapping("delCate")
	public String delCate(int cateId) {
		cateService.deleteType(cateId);
		
		return "redirect:/admin/getAdminCates";
		
	}
	
	
	@RequestMapping("size/getAdminSizes")
	public String getAdminSizes(Model model) {
		
		Page<Size> sizes=adminService.getAdminSizes();
		System.out.println(sizes.toString());
		model.addAttribute("sizes", sizes);	
		return "admin/sizeManage";
		
	}
	
	@RequestMapping("color/getAdminColors")
	public String getAdminColors(Model model) {
		
		Page<Color> colors=adminService.getAdminColors();
		System.out.println(colors.toString());
		model.addAttribute("colors", colors);	
		return "admin/colorManage";
		
	}
	
	@RequestMapping("size/delSize")
	public String delSize(int sizeId) {
		
		boolean result = adminService.delSizeById(sizeId);
		
		return "redirect:/admin/size/getAdminSizes";
		
	}
	
	@RequestMapping("color/delColor")
	public String delColor(int colorId) {
		
		boolean result = adminService.delColorById(colorId);
		
		return "redirect:/admin/color/getAdminColors";
		
	}
	
	@RequestMapping("doAddSize")
	public String doAddSize(Size size) {
		
		boolean result = adminService.addSize(size);
		if (result) {
			return "redirect:/admin/size/getAdminSizes";
		}else {
			return "admin/addSize";
		}
		
	}
	
	@RequestMapping("doAddColor")
	public String doAddColor(Color color) {
		
		boolean result = adminService.addColor(color);
		if (result) {
			return "redirect:/admin/color/getAdminColors";
		}else {
			return "admin/addColor";
		}
		
	}
	
	@RequestMapping("sizeDetail")
	public String findSizeById(int sizeId,Model model) {
		
		Size size = adminService.findSizeById(sizeId);
		
		model.addAttribute("size", size);
		
		return "admin/sizeDetail";
		
		
	}
	
	@RequestMapping("colorDetail")
	public String findColorById(int colorId,Model model) {
		
		Color color = adminService.findColorById(colorId);
		
		model.addAttribute("color", color);
		
		return "admin/colorDetail";
		
		
	}
	
	@RequestMapping("updateSize")
	public String updateSize(Size size) {
		
		boolean result = adminService.updateSize(size);
		
		return "redirect:/admin/size/getAdminSizes";
		
		
	}
	
	@RequestMapping("updateColor")
	public String updateColor(Color color) {
		
		boolean result = adminService.updateColor(color);
		
		return "redirect:/admin/color/getAdminColors";
		
		
	}
	
	
	@RequestMapping("order/getAdminOrders")
	public String adminOrderList(@RequestParam(required=false) String orderStatus,@RequestParam(required=false) String orderCode,
			@RequestParam(required=false) String userName,@RequestParam(required=false) String startDate,@RequestParam(required=false) String endDate,Model model) {
		Page<Order> orders = orderService.findAllOrders(orderStatus,orderCode,userName,startDate,endDate);
		model.addAttribute("orders",orders);
		
		return "admin/orderList";
		
	}
	
	@RequestMapping("order/getOrderDetailById")
	public String getOrderDetailById(Model model,int orderId) {
		float sum = 0;
		Order order = orderService.findOrderById(orderId);
		model.addAttribute("order",order);
		List<OrderDetail> orderDetails = orderService.findOrderDetailByid(orderId);
		model.addAttribute("oDetail",orderDetails);
		for (OrderDetail orderDetail : orderDetails) {
			sum+=orderDetail.getOdetailNum()*orderDetail.getOdetailPrice();
		}
		model.addAttribute("sum", sum);
		return "admin/orderDetail";
		
	}
	
	@RequestMapping("order/sendGoods")
	@ResponseBody
	public Map<String,String> sendGoods(Order order){
		Map<String, String> m = new HashMap<String,String>();
		try{
			boolean result = orderService.sendGoods(order);
			if (result) {
				m.put("handle", "success");
			}else {
				m.put("handle", "failure");
			}
		
		}
		catch(Exception e){
			e.printStackTrace();		
			m.put("handle", "exception");
		}
			return m;
			
		}
	
	@ResponseBody
	@RequestMapping("order/handleOrderStatus")
	public Map<String,String> handleOrderStatus(String orderId,int status){
		Map<String,String> m=new HashMap<String,String>();
		System.out.println(status);
		try{
			boolean flag=false;
			int curStatus=orderService.getOrderStatusById(orderId);
			switch(status){
			case 3://申请退款
				if(curStatus==Constants.ORDER_ASKREFUND)		flag=true;
				break;
			case 7://同意收货
				if(curStatus==Constants.ORDER_ASKRETURN)	flag=true;
				break;
			case 8://确认收到退货
				if(curStatus==Constants.ORDER_RETURNING)	flag=true;
				break;
			default:
				flag=false;
			}		
			if(flag){
				orderService.changeOrderStatus(orderId,status);
				m.put("handle", "success");
			}else{
				m.put("handle", "failure");
			}
		}
		catch(Exception e){
			e.printStackTrace();		
			m.put("handle", "exception");
		}
		return m;
	}
	
	@RequestMapping("order/delOrder")
	public String delOrder(int orderId) {
		
		boolean delDetail = orderService.delOrderDetail(orderId);
		
		if (delDetail) {
			boolean delOrder = orderService.delOrderByOrderId(orderId);
			
		}
		return "redirect:/admin/order/getAdminOrders";

		
	}
	
	@RequestMapping("goods/getGoodsStocks")
	public String getGoodsStocks(Model model){
		
		Page<Goods> goods = goodsService.findAllGoods();
		model.addAttribute("goods",goods);
		return "admin/stockManage";
	}
	
	
	
	
	
	@RequestMapping("goods/handleGoods")
	public String handleGoods(Model model){
		List<Category> categories=adminService.findAll();
		model.addAttribute("cates", categories);
		return "admin/addGood";
	}
	
	@RequestMapping(value ="goods/doHandleGoods",method =RequestMethod.POST)
	public String doHandleGoods(Goods good,MultipartFile goodsPicFile,HttpSession session){
		Map<String, Object> map = new HashMap<>();
		System.out.println(good.toString());
		
		String path = session.getServletContext().getRealPath("/images/cate");
		if(!(goodsPicFile.getOriginalFilename() ==null || "".equals(goodsPicFile.getOriginalFilename()))) {
			
			System.out.println("图片名："+goodsPicFile.getOriginalFilename());
			
			String file=UUIDUtil.getRandom32PK();
			String prefix=goodsPicFile.getOriginalFilename().substring(goodsPicFile.getOriginalFilename().lastIndexOf(".")+1);
			String file_name=file+"."+prefix;
			
			System.out.println("存的图片路径:"+path);
					
			File targetFile = new File(path , file_name);
			try {
				 if(!targetFile.exists()){  
			            targetFile.mkdirs();  
			        } 
				 goodsPicFile.transferTo(targetFile);
				System.out.println("成功");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("失败");
			} 
			good.setGoodsPic("/images/cate/"+file_name);
		}
		System.out.println(good.toString());
		boolean result = goodsService.addGoods(good);
		
		return "redirect:/admin/goods/getAdminGoods";
	}
	
	@RequestMapping("goods/getAdminGoods")
	public String getAdminGoods(Model model){
		List<Category> categories=adminService.findAll();
		List<Goods> goods=adminService.findAllGoods();
		
		model.addAttribute("goods", goods);
		model.addAttribute("cates", categories);
		return "admin/goodsList";
	}
	
	@RequestMapping("goods/getSearchGoods")
	public String getSearchGoods(@RequestParam(value="cateId",required=false)int cateId,@RequestParam(value="goodsName",required=false)String goodsName,@RequestParam(value="startPrice",required=false)String startPrice,@RequestParam(value="endPrice",required=false)String endPrice,Model model){
		System.out.println("ssssss"+cateId+"sssss"+goodsName+"ssss"+startPrice+"sssss"+endPrice);
		if (startPrice.equals(null) || startPrice.equals("")) {
			startPrice="0";
		}
		if (endPrice.equals(null) || endPrice.equals("")) {
			endPrice="1000";
		}	
		List<Category> categories=adminService.findAll();
		List<Goods> goods=adminService.SearchGoods(cateId,goodsName,startPrice,endPrice);
		
		model.addAttribute("goods", goods);
		model.addAttribute("cates", categories);
		
		
		return "admin/goodsList";
	}
	
	
	@RequestMapping("goods/updateGoods")
	public String updateGoods(int goodsId,Model model){
		Goods good=adminService.findGoodsByid(goodsId);
		System.out.println(good.toString());
		List<Category> categories=adminService.findAll();
		model.addAttribute("cates", categories);
		model.addAttribute("good", good);
		return "admin/handleGood";
	}
	
	
	@RequestMapping("goods/doUpdateGood")
	public String doAddGoods(Goods good,MultipartFile goodsPicFile,Model model,HttpSession session){
		System.out.println("图片名："+goodsPicFile.getOriginalFilename());
		System.out.println(good.toString());
		
		if(!(goodsPicFile.getOriginalFilename() ==null || "".equals(goodsPicFile.getOriginalFilename()))) {
		String path = session.getServletContext().getRealPath("/images/goods");
		String file=UUIDUtil.getRandom32PK();
		String prefix=goodsPicFile.getOriginalFilename().substring(goodsPicFile.getOriginalFilename().lastIndexOf(".")+1);
		String file_name=file+"."+prefix;
		File targetFile = new File(path , file_name);
		try {
			 if(!targetFile.exists()){  
		            targetFile.mkdirs();  
		        } 
			 goodsPicFile.transferTo(targetFile);
			System.out.println("成功");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("失败");
		} 
		
		good.setGoodsPic("/images/goods/"+file_name);
		}
		
		adminService.updateGood(good);
		
		return "redirect:/admin/goods/getAdminGoods";
	}
	
	@RequestMapping("goods/delGoods")
	public String delGoods(int goodsId){
		adminService.delGoodSize(goodsId);
		adminService.delGoodColor(goodsId);
		adminService.delGoods(goodsId);
		return "redirect:/admin/goods/getAdminGoods";
	}
	
	@RequestMapping("goods/getStocks")
	public String getStocksByGoodsId(int goodsId,Model model){
		List<Stock> stocks  = goodsService.getStocksByGoodsId(goodsId);
		System.out.println(stocks.toString());
		model.addAttribute("stocks",stocks);
		return "admin/updateStock";
	}
	
	@RequestMapping("goods/updateStock")
	@ResponseBody
	public Map<String, String> updateStock(int stockId,int stockNum,int goodsId){
		Map<String, String> m = new HashMap<String,String>();
		try{
			boolean result = goodsService.updateStock(stockId,stockNum);
			if (result) {
				int goodsStock =0;
				List<Stock> stocks  = goodsService.getStocksByGoodsId(goodsId);
				for (Stock stock : stocks) {
					goodsStock+=(stock.getStockNum()-stock.getSalesNum());
				}
				
				boolean res = goodsService.updateGoodsStock(goodsId,goodsStock);
				m.put("handle", "success");
			}else {
				m.put("handle", "failure");
			}
		
		}
		catch(Exception e){
			e.printStackTrace();		
			m.put("handle", "exception");
		}
			return m;
			
	}

	
	@RequestMapping("goods/SearchGoods")
	public String SearchGoods(@RequestParam(value="cateId",required=false)int cateId,@RequestParam(value="goodsName",required=false)String goodsName,@RequestParam(value="startPrice",required=false)String startPrice,@RequestParam(value="endPrice",required=false)String endPrice,Model model){
		System.out.println("ssssss"+cateId+"sssss"+goodsName+"ssss"+startPrice+"sssss"+endPrice);
		if (startPrice.equals(null) || startPrice.equals("")) {
			startPrice="0";
		}
		if (endPrice.equals(null) || endPrice.equals("")) {
			endPrice="1000";
		}	
		List<Category> categories=adminService.findAll();
		List<Goods> goods=adminService.SearchGoods(cateId,goodsName,startPrice,endPrice);
		
		model.addAttribute("goods", goods);
		model.addAttribute("cates", categories);
		
		
		return "admin/goodsPics";
	}
	
	
	@RequestMapping("goods/getGoodsPics")
	public String getGoodsPics(Model model){
		List<Category> categories=adminService.findAll();
		List<Goods> goods=adminService.findAllGoods();
		
		model.addAttribute("goods", goods);
		model.addAttribute("cates", categories);
		return "admin/goodsPics";
	}
	
	@RequestMapping("goods/handleGoodsPics")
	public String handleGoodsPics(int goodsId,Model model){
		List<Pic> pics=adminService.getGoodPicsBygoodsId(goodsId);
		model.addAttribute("pics", pics);
		model.addAttribute("goodsId", goodsId);
		return "admin/picsDetail";
	}
	
	@RequestMapping("goods/delGoodsPics")
	public String delGoodsPics(int picId,int goodsId){
		System.out.println(picId+"_____"+goodsId);
		adminService.delGoodsPics(picId,goodsId);
		
		return "redirect:handleGoodsPics?goodsId="+goodsId;
	}
	
	@RequestMapping("goods/addGoodsPics")
	public String addGoodsPics(int goodsId,@RequestParam(required=false)MultipartFile[] goodsPicFile,HttpSession session){
		String path = session.getServletContext().getRealPath("/images/goods");
		List<String> listImagePath=new ArrayList<String>();  
		for (MultipartFile mf : goodsPicFile) { 
			if(!(mf.getOriginalFilename() ==null || "".equals(mf.getOriginalFilename()))) {
				String file=UUIDUtil.getRandom32PK();
				String prefix=mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf(".")+1);
				String file_name=file+"."+prefix;
				File targetFile = new File(path , file_name);
				 try {
					 if(!targetFile.exists()){  
				            targetFile.mkdirs();  
				        } 
					mf.transferTo(targetFile);
					System.out.println("成功");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("失败");
				} 
				 
				 listImagePath.add("/images/goods/"+file_name);
			}
			
		}
		for(int i=0;i<listImagePath.size();i++){
			adminService.addGoodsPics(goodsId,listImagePath.get(i));
		}
		
		
		
		return "redirect:handleGoodsPics?goodsId="+goodsId;
	}

	@RequestMapping("goods/getGoodsSizesAndColors")
	public String getGoodsSizesAndColors(Model model){
		List<Goods> goods=adminService.findAllGoods();		
		model.addAttribute("goods", goods);
		return "admin/goodsSizesAndColorsList";
	}
	
	@RequestMapping("goods/handleGoodsSizes")
	public String handleGoodsSizes(int goodsId,Model model){
		List<Size> sizes=adminService.findGoodsSize(goodsId);	
		List<Size> goodSizes=adminService.findGoodsSizesById(goodsId);
		model.addAttribute("sizes", sizes);
		model.addAttribute("goodsId", goodsId);
		model.addAttribute("goodSizes", goodSizes);
		return "admin/goodsSizes";
	}
	
	@RequestMapping("goods/doHandleGoodsSizes")
	public String doHandleGoodsSizes(int goodsId,int[] sizeIds){
		adminService.delGoodSizes(goodsId);
		System.out.println(goodsId);
		for (int i=0 ;i< sizeIds.length;i++) {
			System.out.println(sizeIds[i]);
			adminService.addGoodSizes(sizeIds[i],goodsId);
			
		}
		return "redirect:handleGoodsColors?goodsId="+goodsId;
	}
	
	
	
	@RequestMapping("goods/handleGoodsColors")
	public String handleGoodsColors(int goodsId,Model model){
		List<Color> goodColors=adminService.findGoodsColorsById(goodsId);
		List<Color> colors=adminService.findGoodsColors(goodsId);		
		model.addAttribute("colors", colors);
		model.addAttribute("goodColors", goodColors);
		model.addAttribute("goodsId", goodsId);
		return "admin/goodsColors";
	}
	
	@RequestMapping("goods/doHandleGoodsColors")
	public String doHandleGoodsColors(int goodsId,int[] colorIds){
		adminService.delGoodColors(goodsId);
		System.out.println(goodsId);
		for (int i=0 ;i< colorIds.length;i++) {
			System.out.println(colorIds[i]);
			adminService.addGoodColors(colorIds[i],goodsId);
			
		}
		return "redirect:handleGoodsSizes?goodsId="+goodsId;
	}





}
