package com.google.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criterib {

	private int pageNum; //현재페이지
	private int amount; //보여줄 페이지 수
	private int startPage; //시작페이지

	public Criterib() {
		super();
		this.pageNum = 1;
		this.amount = 10;
		
	}
	
	public Criterib(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int getSkip() {
		return (this.pageNum-1) * this.amount;
	}
	
	
	
}
