package com.finalproject.web;



import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.finalproject.model.Branch;
import com.finalproject.model.BranchEmp;
import com.finalproject.model.BranchInventory;
import com.finalproject.model.BranchOrder;
import com.finalproject.model.BranchOrderDetail;
import com.finalproject.model.Product;
import com.finalproject.service.BranchService;


@Controller
public class BranchController {
	
	@Autowired BranchService brService;
	
	// 지점 로그인
	@RequestMapping("/branch/branchlogin.do")
	public String login() {
		return "branch/login";
	}
	
	// 지점 로그아웃
	@RequestMapping(value="/branch/branchlogout.do", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/branch/branchlogin.do";
    }
	
	@RequestMapping("/branch/denied.do")
	public String deniy() {
		return "branch/denied";
	}

	// 지점 메인
	@RequestMapping("/branch/branchmain.do")
	public String main() {
		return "branch/main";
	}
	
	// 지점 - 판매
	@RequestMapping("/branch/branchsales.do")
	public String sales() {
		return "branch/sales";
	}
	
	// 지점 - 재고
	@RequestMapping("/branch/branchinven.do")
	public String inventory() {
		return "branch/inventory";
	}
	
	// 지점 - 발주
	@RequestMapping("/branch/branchorder.do")
	public String order() {
		return "branch/order";
	}
	
	// 발주 전송하기 : 발주 수정하기
	@RequestMapping("/branch/orderupdate.do")
	public String orderUpdate(@RequestParam(name="brno") int brno, @RequestParam(name="no") int no) {
		
		BranchOrder order = brService.getBranchOrderByNo(no);
		order.setIscart("Y");		
		brService.updateBranchOrder(order);
			
		return "branch/order";
	}
	
	
	// 발주 전송하기 : 재고에 저장
	@RequestMapping("/branch/invenupdate.do")
	public String invenUpdate(@RequestParam(name="no") int no) {
		
		List<BranchOrderDetail> detailList = brService.getOrderDetailsByOrderNo(no);
		BranchOrder order = brService.getBranchOrderByNo(no);
		System.out.println("detailList"+detailList.get(0));
		System.out.println("order"+ order.getBranchNo());
		for (BranchOrderDetail d : detailList){
			Map<String, Object> map2 = new HashMap<>();
			map2.put("branchNo", order.getBranchNo());
			map2.put("productNo", d.getProduct().getNo());
			
			BranchInventory inven = brService.getInventoryByProductNo(map2);
			
			if (inven == null) {
				inven = new BranchInventory();
				inven.setQty(d.getQty());
				inven.setBranchNo(order.getBranchNo());
				
				Product product = brService.getProductByNo(d.getProduct().getNo());
				inven.setProduct(product);
				brService.addInventory(inven);
			} else {
				if (inven.getProduct().getNo() == d.getProduct().getNo()) {
					inven.setQty(inven.getQty() + d.getQty());
					brService.updateInventory(inven);
				} else {
					inven = new BranchInventory();
					inven.setQty(d.getQty());
					inven.setBranchNo(order.getBranchNo());
					
					Product product = brService.getProductByNo(d.getProduct().getNo());
					inven.setProduct(product);
					brService.addInventory(inven);
				}
			} 
		}
		
		order.setIscomplete("Y");		
		brService.updateBranchOrder(order);
		
		return "branch/order";
	}

	// 지점 - 행사상품
	@RequestMapping("/branch/branchevent.do")
	public String event() {
		return "branch/event";
	}
	
	// 지점 - 사용자등록
	@RequestMapping("/branch/branchaddemp.do")
	public String addemp() {
		return "branch/addemp";
	}
	
	private static String UPLOAD_DIRECTORY = "C:/Users/JHTA/git/pro/spring-finalproject/src/main/webapp/resources/image/brempimg";
	
	@RequestMapping(value="/branch/upload.do", method=RequestMethod.POST)
	public String upload(@RequestParam("email") String email,
						@RequestParam("phone") String phone,
						@RequestParam("grade") String grade,
						@RequestParam("name") String name,
						@RequestParam("password") String password,
						@RequestParam("brno") int brno,
						@RequestParam("birth") Date birth,
						@RequestParam("address1") String address1,
						@RequestParam("address2") String address2,
						@RequestParam("images") MultipartFile images)
		throws Exception {
		
		BranchEmp brEmp = new BranchEmp();
		brEmp.setEmail(email);
		String addr = address1 + " " + address2;
		brEmp.setAddress(addr);
		brEmp.setPhone(phone);
		brEmp.setGrade(grade);
		brEmp.setName(name);
		brEmp.setPassword(password);
		brEmp.setBirth(birth);
		
		Branch branch = brService.getBranchByNo(brno);
		brEmp.setBranch(branch);
		
		if (!images.isEmpty()) {
			String filename = images.getOriginalFilename();
			
			// 업로드된 파일 데이타
			byte[] bytes = images.getBytes();
			// 업로드된 파일을 저장할 데릭토리와 파일명
			File file = new File(UPLOAD_DIRECTORY, filename);
			
			// 파일 데이타를 지정한 파일로 저장
			FileCopyUtils.copy(bytes, file);
			
			// 지점회원정보에 이미지 이름 저장
			brEmp.setImages(filename);
		}
		
		brService.addBranchEmp(brEmp);
		
		return "redirect:/branch/branchaddemp.do";
	}
	
	// 지점 - 결산
	@RequestMapping("/branch/branchaccount.do")
	public String account() {
		return "branch/account";
	}
	
	// 지점 - 보류
	@RequestMapping("/branch/branchwait.do")
	public String waitProduct() {
		return "branch/wait";
	}

}
