package cProject.movie.vo;

import java.util.List;

public class UserVO {
	private String id;
	private String pw;
	private String email;
	private String nick;
	private int userType;
	private String createDate;
	private String updateDate;
	private String deleteDate;
	private List<BpoliceVO> Bpolices;
	private List<CpoliceVO> Cpolices;
	private int countTotal;
	
	public int getCountTotal() {
		return countTotal;
	}
	public void setCountTotal(int countTotal) {
		this.countTotal = countTotal;
	}
	public List<BpoliceVO> getBpolices() {
		return Bpolices;
	}
	public void setBpolices(List<BpoliceVO> bpolices) {
		Bpolices = bpolices;
	}
	public List<CpoliceVO> getCpolices() {
		return Cpolices;
	}
	public void setCpolices(List<CpoliceVO> cpolices) {
		Cpolices = cpolices;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getEmail() {
		return email;
	}
	public String getNick() {
		return nick;
	}
	public int getUserType() {
		return userType;
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
	public void setId(String id) {
		this.id = id;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setUserType(int userType) {
		this.userType = userType;
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
