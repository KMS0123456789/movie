package cProject.movie.vo;

public class CommentVO {
	private int cno;
    private String author;
    private int bno;
    private int pCno;
    private String cbody;
    private int deleteFlag;
    private int policeFlag;
    private String createDate;
    private String updateDate;
    private String deleteDate;
    
	public int getCno() {
		return cno;
	}
	public String getAuthor() {
		return author;
	}
	public int getBno() {
		return bno;
	}
	public Integer getpCno() {
		return pCno;
	}
	public String getCbody() {
		return cbody;
	}
	public int getDeleteFlag() {
		return deleteFlag;
	}
	public int getPoliceFlag() {
		return policeFlag;
	}
	public String getCreateDate() {
		return createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public void setpCno(Integer pCno) {
		this.pCno = pCno;
	}
	public void setCbody(String cbody) {
		this.cbody = cbody;
	}
	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public void setPoliceFlag(int policeFlag) {
		this.policeFlag = policeFlag;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
}
