package vo;

import java.sql.Date;

public class ReviewVO {
	int num;
	String id;
	String content;
	int tripNo;
	Date writedate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTripNo() {
		return tripNo;
	}
	public void setTripNo(int tripNo) {
		this.tripNo = tripNo;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public ReviewVO(int num, String id, String content, int tripNo, Date writedate) {
		super();
		this.num = num;
		this.id = id;
		this.content = content;
		this.tripNo = tripNo;
		this.writedate = writedate;
	}
	
	public ReviewVO() {}
	
}
