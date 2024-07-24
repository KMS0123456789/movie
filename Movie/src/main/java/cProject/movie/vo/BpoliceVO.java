package cProject.movie.vo;

import java.util.List;

public class BpoliceVO {
	private int policeNo;
	private String policeMan;
	private int bno;
	private String villain;
	private String policeDate;
	private String policeReason;
	private int policeResult;
	private List<BoardVO> boards;
	public List<BoardVO> getBoards() {
		return boards;
	}
	public void setBoards(List<BoardVO> boards) {
		this.boards = boards;
	}
	public int getPoliceNo() {
		return policeNo;
	}
	public void setPoliceNo(int policeNo) {
		this.policeNo = policeNo;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getPoliceDate() {
		return policeDate;
	}
	public void setPoliceDate(String policeDate) {
		this.policeDate = policeDate;
	}
	public String getPoliceReason() {
		return policeReason;
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
	public void setPoliceReason(String policeReason) {
		this.policeReason = policeReason;
	}
	public int getPoliceResult() {
		return policeResult;
	}
	public void setPoliceResult(int policeResult) {
		this.policeResult = policeResult;
	}
	@Override
	public String toString() {
		return "BpoliceVO [policeNo=" + policeNo + ", policeMan=" + policeMan + ", bno=" + bno + ", villain=" + villain
				+ ", policeDate=" + policeDate + ", policeReason=" + policeReason + ", policeResult=" + policeResult
				+ ", boards=" + boards + "]";
	}
	
	
}
