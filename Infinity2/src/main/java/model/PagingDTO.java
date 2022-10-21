package model;

public class PagingDTO {
	
	private int p = 1;	//현재 페이지
	private final int pageRow = 20;	//보여줄 줄(행) 수
	
	private int total;	//전체 글수
	private int totalPage;	//전체 페이지수
	
	public int getP() {
		return p;
	}
	public void setP(int p) {
		this.p = p;
	}
	public int getPageRow() {
		return pageRow;
	}
	
	public int startPage() {
		return ((this.p-1)*this.pageRow);
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getTotalPage() {
		if(this.total%this.pageRow == 0){
			this.totalPage = (this.total/this.pageRow);
		} else{
			this.totalPage = (this.total/this.pageRow)+1;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	@Override
	public String toString() {
		return "PagingDTO [p=" + p + ", pageRow=" + pageRow + "]";
	}
	
	
}
