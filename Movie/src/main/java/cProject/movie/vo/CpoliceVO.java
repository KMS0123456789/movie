package cProject.movie.vo;

import java.util.List;

public class CpoliceVO {
	private int policeNo;
    private String policeMan;
    private int cno;
    private String villain;
	private String policeDate;
    private String policeReason;
    private String policeResult;
    private List<CommentVO> comments;
    
	public List<CommentVO> getComments() {
		return comments;
	}
	public void setComments(List<CommentVO> comments) {
		this.comments = comments;
	}
	public int getPoliceNo() {
		return policeNo;
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
	
	public String getPoliceMan() {
		return policeMan;
	}
	public void setPoliceMan(String policeMan) {
		this.policeMan = policeMan;
	}
	public String getVillain() {
		return villain;
	}
	public void setVillain(String villain) {
		this.villain = villain;
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
