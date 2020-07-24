package com.biz.order.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * VO(DTO) 클래스 선언
 * DBMS(MyBatis)와 연동하는 프로젝트에서 VO클래스의 필드변수는
 * 연동하는 Table의 칼럼 이름과 같다.
 * 변수 패턴은 snack-case
 */

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class OrderVO {
	
	private long o_seq;  // o_seq => OSEQ 이런식의로 변환이 되어버리기때문에 카멜케이스로 쓴다. => O_SEQ
	private String o_num;
	private String o_cnum;
	private String o_pcode;
	private String o_pname;
	private String o_date;
	private int o_price;
	private int o_qty;
	private int o_total;

}
