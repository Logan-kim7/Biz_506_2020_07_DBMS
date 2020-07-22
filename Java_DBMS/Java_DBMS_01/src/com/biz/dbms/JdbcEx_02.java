package com.biz.dbms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.biz.dbms.config.DBConnection;
import com.biz.dbms.config.DBcontract;
import com.biz.dbms.config.Lines;
import com.biz.dbms.domain.OrderVO;

public class JdbcEx_02 {

	public static void main(String[] args) {
		
		String order_select = DBcontract.ORDER_SELECT;
		Connection dbConn = DBConnection.getDbConn();
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		
		// 인터페이스를 이용해서 객체를 선언만 
		PreparedStatement pSt = null;
		
		//dbConn 겍체의  PreparedStatement method()에게 SQL 명령문 코드를 전달하면
		// PreparedStatement type의 객체를 생성하여 return
		try {
			pSt = dbConn.prepareStatement(order_select);
			ResultSet result = pSt.executeQuery();
			while(result.next()){
				 OrderVO orderVO = new OrderVO();
				String o_num = result.getNString(DBcontract.ORDER.COL_O_NUM_STR);
						orderVO.setO_num(o_num);
				String o_date = result.getNString(DBcontract.ORDER.COL_O_DATE_STR);
						orderVO.setO_date(o_date);
				String o_cnum = result.getNString(DBcontract.ORDER.COL_O_CNUM_STR);
						orderVO.setO_cnum(o_cnum);
				String o_pcode = result.getNString(DBcontract.ORDER.COL_O_PCODE_STR);		
						orderVO.setO_pcode(o_pcode);
				String o_pname = result.getNString(DBcontract.ORDER.COL_O_PNAME_STR);
						orderVO.setO_pname(o_pname);
				int o_qty = result.getInt((DBcontract.ORDER.COL_O_QTY_INT));
						orderVO.setO_qty(o_qty);
				int o_price = result.getInt((DBcontract.ORDER.COL_O_QTY_INT));
						orderVO.setO_qty(o_price);
				int o_total = result.getInt((DBcontract.ORDER.COL_O_QTY_INT));
						orderVO.setO_qty(o_total);
						orderList.add(orderVO);
			}
			
			pSt.close();
			dbConn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // try end
		
		System.out.println(Lines.dLine);
		System.out.println("주문내역서");
		System.out.println(Lines.dLine);
		System.out.println("주문번호\t주문일자\t고객 \t상품 \t수량\t가격\t 합계 ");
		System.out.println(Lines.sLine);
		for(OrderVO vo : orderList) {
			System.out.println(String.format("%s\t%s\t%s\t%s\t%d\t%d\t%d",vo.getO_num(),vo.getO_date(),vo.getO_cnum(),vo.getO_pcode(),
					vo.getO_pname(),vo.getO_qty(),vo.getO_price(),vo.getO_total()));
			
		}
	}
}
