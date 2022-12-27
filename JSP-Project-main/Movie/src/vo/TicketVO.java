package vo;

import java.sql.Timestamp;

public class TicketVO {
	private int ticketNo; 
	private String tripName;
	private Timestamp bookDate;
	private int schNo;
	private int roomNo;
	private int seatNo;
	private String id;
	
	public TicketVO() {
		
	}
	
	public TicketVO(int ticketNo, String tripName, Timestamp bookDate, int schNo, int roomNo, int seatNo, String id) {
		this.ticketNo = ticketNo;
		this.tripName = tripName;
		this.bookDate = bookDate;
		this.schNo = schNo;
		this.roomNo = roomNo;
		this.seatNo = seatNo;
		this.id = id;
	}

	public int getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}

	public String getTripName() {
		return tripName;
	}

	public void setTripName(String tripName) {
		this.tripName = tripName;
	}

	public Timestamp getBookDate() {
		return bookDate;
	}

	public void setBookDate(Timestamp bookDate) {
		this.bookDate = bookDate;
	}

	public int getSchNo() {
		return schNo;
	}

	public void setSchNo(int schNo) {
		this.schNo = schNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}
