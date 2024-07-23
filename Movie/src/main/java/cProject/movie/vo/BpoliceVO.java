package cProject.movie.vo;

import java.util.List;

public class BpoliceVO {
	private int policeNo;
	private String id;
	private int bno;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public void setPoliceReason(String policeReason) {
		this.policeReason = policeReason;
	}
	public int getPoliceResult() {
		return policeResult;
	}
	public void setPoliceResult(int policeResult) {
		this.policeResult = policeResult;
	}
}
