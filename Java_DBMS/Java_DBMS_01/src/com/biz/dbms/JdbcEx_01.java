package com.biz.dbms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.biz.dbms.config.DBcontract;
import com.biz.dbms.config.Lines;
import com.biz.dbms.domain.OrderVO;
import com.mysql.cj.xdevapi.PreparableStatement;

public class JdbcEx_01 {

	public static void main(String[] args) {
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		try {
			/*
			 * Java에서 JDBC를 통하여 드라이버 클래스와 연결하고 Java 코드에서 보내는 SQL Queuy를 Oracle DBMS에게 전달을
			 * 할텐데
			 * 
			 * 그때 JDBC에서 연결할 오라클 연결도우미 미들웨어(OracleDriver.class)를 사용가능한 상태로 만들어 주는 Java 한 기능을
			 * 수행하는데 그때 사용하는 JDK가 Class.forName() method 이다 Class.forName()
			 * 
			 * 
			 * OracleDriver.class를 사용할 준비를 한다. 클래스 객체 = new 클래스() 라고 만들텐데,
			 * OracleDriver.class는 태생이 Java 전용 클래스와 달라서 사용하기 위해서 초기화를 하는 방법이 일반 클래스와 다르다.
			 * 
			 * Class.forName() method의 도움을 받아서 사용할 준비를 수행하는 것
			 * 
			 */
			Class.forName(DBcontract.DB_DRIVER);
			// 오라클에 연결하기
			// 1. Connection 설치
			Connection dbConn = null;
			
			// 2. Connection에게 오라클에 접속하라 라고 지시
			// 3. 접속이 완료되면 접속관련된 정보를 dbConn객체에 저장하라 
			dbConn = DriverManager.getConnection(DBcontract.DB_URL,DBcontract.DB_USER,DBcontract.DB_PASSWORD);
			System.out.println("DB Connection OK!!!!");
			
			//4. DB에게 SQL 보내기
			PreparedStatement pSt = null;
			String strSql = DBcontract.ORDER_SELECT;
			// DB에게 SQL을 보내고
			// 그 결과를 pSt(PreparedStatement)에 받아라
			// OracleDriver을 통해서 SQL을 보낼수 있도록 자신만의 방식으로 변경을하고
			// 그 정보를 pSt에 담아놓는다.
			pSt = dbConn.prepareStatement(strSql);
			
			// 방금 pSt에 담은 정보를 사용하여
			// SQL문을 실행하도록 DB에게 전달하여 결과를 ResultSet에 받아라
			ResultSet result = pSt.executeQuery();
			// DB Cursor
			// Table이 담겨잇는 유사 List 자료형
			// 값을 추출할때 처음부터 순서대로 전진방향으로만 추출할 수 있다.
			// ResultSet의 next() method를 호출하면
			// SELECT 결과물이 없으면 false return을 하고
			// 결과물(Table Record)이 있으면 Recode로 부터 데이터를 칼럼별로 추출할 수 있도록
			// 대기상태가 된다.
			
			//ResultSet에는 SELECT 문을 실행한 결과인 Table이 담겨 있게 된다.
			while(result.next()) {
				OrderVO orderVO = new OrderVO();
				String o_num = result.getNString(DBcontract.ORDER.POS_O_NUM_STR); // 과거에는 위치값으로 
				orderVO.setO_num(o_num);
				
				String o_cnum = result.getNString(DBcontract.ORDER.POS_O_CNUM_STR);
				orderVO.setO_cnum(o_cnum);
				
				String o_pcode = result.getNString(DBcontract.ORDER.POS_O_PCODE_STR);
				orderVO.setO_pcode(o_pcode);
				
				int o_price = result.getInt(DBcontract.ORDER.POS_O_PRICE_INT);
				orderVO.setO_price(o_price);
				
				orderList.add(orderVO);
				System.out.println(result.getNString(1));
			}
			result.close();
			dbConn.close();
			System.out.println(Lines.dLine);
			System.out.println("주문내역");
			System.out.println(Lines.dLine);
			System.out.println("주문번호 \t 고객번호\t 상품번호\t");
			System.out.println(Lines.sLine);
			for(OrderVO vo : orderList) {
				System.out.println(String.format("%s\t%s\t%s",
					vo.getO_num(),vo.getO_cnum(),vo.getO_pcode()));
			}
			System.out.println(Lines.dLine);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//System.out.println("프로젝트에 오라클 드라이버가 설치되지 않았습니다.");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("오라클에 접속하는 과정에서 문제가 발생했습니다.");
		}
	}

}
