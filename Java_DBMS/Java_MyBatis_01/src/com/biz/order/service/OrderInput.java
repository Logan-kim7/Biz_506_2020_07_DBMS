package com.biz.order.service;

import java.util.Scanner;

import com.biz.order.mapper.OrderService;
import com.biz.order.mapper.OrderServiceImplV1;
import com.biz.order.model.OrderVO;

public class OrderInput {
	OrderService oService;
	Scanner scan;

	public OrderInput() {
		oService = new OrderServiceImplV1();
		scan = new Scanner(System.in);
	}

	
	
	public OrderVO add(OrderVO orderVO) {
		
		orderVO.setO_num("알수없음");
		return or;
		
		//  add 에서 orderVO 를 활용하는거잖아?
생성된 객체는 메모리에 남아있는데
그 객체를 전달받아서 값을 수정했으니까
당연히 바뀌는거에요

	}
	public boolean orderUpdate() {
		//만약 orderUpdate()에서 method에서 orderInput()을 호출헀으면
		// orderVO의 각필드변수들은 값을 가지고 있을 것이다.
		// orderInsert() method에서 호출했으면
		// orderVO의 각 필드변수 값은 초기값 ""(String) 이거나 0(int, long)
		
		
			System.out.println("수정할 SEQ(OUIT:중단)>> ");
			String strSeq = scan.nextLine();
			if (strSeq.equals("QUIT")) {
				System.out.println("종료");
				return false;
			}
			

			long longSeq = 0;
			while (true) {
			try {
				longSeq = Long.valueOf(strSeq);
				break;
			} catch (Exception e) {
				System.out.println("상품가격은 숫자로만 입력하세요");
			}		return true;
			
			OrderVO orderVO = oService.findBySeq(longseq);
			if(orderVO == null) {
				System.out.println("SEQ 값을 데이터에서 찾을수 없습니다.");
				return true;
			}
		}
	}
	
	public boolean orderInsert() {
		
		OrderVO orderVO = new OrderVO();
		boolean ret = this.orderInput(orderVO);
		return ret;
		if(orderVO.getO_seq > 0) {
			System.out.println("==============================================");
			System.out.println("주문서 수정");
			System.out.println("주문서 수정 요령");
			System.out.println("Prompt에 나타난 값을 확인하고");
			System.out.println("새로 입력하면 값 수정");
			System.out.println("그냥 Enter를 누르면 통과");
		}
		
		
		
	}
	public boolean orderInput(OrderVO orderVO) {

		System.out.printf("주문번호(QUIT:종료) >> ");
		String str_Num = scan.nextLine();
		if (str_Num.equals("QUIT")) {
			return false;
		}
		orderVO.setO_num(str_Num);
		
		/*
		 * 만약 insert 상태일경우
		 * 사용자가 주문번호를 입력하지 않으면 setO_num() method를 통과하고
		 * 아래쪽 isEmpty()의 유효성 검사에서 통과하지 못할 것이다.
		 * 
		 * update 상태일경우
		 * 입력받은 strNum는 isEmpty일 것이고
		 * 당연히 set()_num() method는 통과 해 버릴 것이다.
		 * 하지만
		 * 이미 DB에서 읽어온 값이 담겨 있으므로
		 * 아래쪽 orderVO.get().getO_num.isEmty()
		 * 
		 */
		if(!orderVO.getO_num().isEmpty()) {
			orderVO.setO_num(strNum);
		}
		if(orderVO.getO_num().isEmpty()) {
			System.out.println(" 주문번호는 반드시 입력 해야 됩니다.");
			System.out.println("주문번호는 반드시 입력해야 합니다.");
			return true;
		}
		
		
		while(true) {
			
		}
		System.out.printf("고객번호(QUIT:종료) >> ");
		String str_Cnum = scan.nextLine();
		if (str_Cnum.equals("QUIT")) {
			return false;
		}
		if(!strCnum.isEmpty()) {
			return false;
		}
		orderVO.setO_cnum(str_Cnum);
		
		if(orderVO.getO_cnum().isEmpty()) {
			System.out.println("주문번호는 반드시 입력해야 합니다.");
			return true;
		}
		
		
		while(true) {
			
		}
		System.out.printf("상품코드(QUIT:종료) >> ");
		String str_Pcode = scan.nextLine();
		if (str_Pcode.equals("QUIT")) {
			return false;
			
			
		}
		orderVO.setO_pcode(str_Pcode);
		if(orderVO.getO_pcode().isEmpty()) {
			
		}
	
		while (true) {
			System.out.println("상품가격(OUIT:중단)>> ");
			String strPrice = scan.nextLine();
			if (strPrice.equals("QUIT")) {
				return false;
			}

			int intPrice = 0;
			try {
				intPrice = Integer.valueOf(intPrice);
			} catch (Exception e) {
				System.out.println("상품가격은 숫자로만 입력하세요");
			}
			orderVO.setO_price(intPrice);
			
			if(orderVO.getO_price()<1) {
				System.out.println("상품가격은 1보다 많아야합니다.");
				continue;
			}
			break;

		}

		while (true) {
			System.out.println("주문수량(OUIT:중단)>> ");
			String strQty = scan.nextLine();
			if (strQty.equals("QUIT")) {
				return false;
			}

			int intQty = 0;
			try {
				intQty = Integer.valueOf(intQty);
			} catch (Exception e) {
				System.out.println("상품가격은 숫자로만 입력하세요");
			}
			orderVO.setO_price(intQty);
			break;

		}
		int ret = 0;
		String msg ="추가";
		if(orderVO.getO_seq() >0) {
			ret = oService.update(orderVO);
			msg ="수정"
		}else {
			ret = oService.insert(orderVO);
		}

		int (ret> )= oService.insert(orderVO);
		
		if (ret > 0) {
			System.out.println("데이터 추가 성공!!!!");
		} else {
			System.out.println("주문서를 추가하지 못했습니다.");
			System.out.println("다시 입력해 주세요");

		}
		return true;
	}

}
