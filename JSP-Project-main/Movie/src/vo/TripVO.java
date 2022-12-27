package vo;

public class TripVO {
	private int tripNo;
	private String tripName;
	private int category;
	private int runtime;
	private String img;
	private String info;

	public TripVO(int tripNo, String tripName, int category, int runtime, String img, String info) {
		this.tripNo = tripNo;
		this.tripName = tripName;
		this.category = category;
		this.runtime = runtime;
		this.img = img;
		this.info = info;
	}
	
	public TripVO() {}

	public int getTripNo() {
		return tripNo;
	}

	public void setTripNo(int tripNo) {
		this.tripNo = tripNo;
	}

	public String getTripName() {
		return tripName;
	}

	public void setTripName(String tripName) {
		this.tripName = tripName;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

}
