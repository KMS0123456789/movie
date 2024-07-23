package cProject.movie.vo;

public class CpoliceVO {
	private int policeNo;
    private String id;
    private int cno;

	private String policeDate;
    private String policeReason;
    private String policeResult;
    
	public int getPoliceNo() {
		return policeNo;
	}
	public String getId() {
		return id;
	}
	public int getCno() {
		return cno;
	}
	public String getPoliceDate() {
		return policeDate;
	}
	public String getPoliceReason() {
		return policeReason;
	}
	public String getPoliceResult() {
		return policeResult;
	}
	public void setPoliceNo(int policeNo) {
		this.policeNo = policeNo;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public void setPoliceDate(String policeDate) {
		this.policeDate = policeDate;
	}
	public void setPoliceReason(String policeReason) {
		this.policeReason = policeReason;
	}
	public void setPoliceResult(String policeResult) {
		this.policeResult = policeResult;
	}
 
    
}
