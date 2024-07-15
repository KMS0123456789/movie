package cProject.movie.vo;

public class UserVO {
	private String id;
	private String pw;
	private String email;
	private String nick;
	private int userType;
	private String createDate;
	private String updateDate;
	private String deleteDate;
	
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
