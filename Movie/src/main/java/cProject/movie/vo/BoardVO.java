package cProject.movie.vo;

import java.util.List;

import cProject.movie.vo.FileVO;

public class BoardVO {
	private int bno;
	private String author;
	private int categoryNo;
	private int notice;
	private int hit;
	private String title;
	private String body;
	private int deleteFlag;
	private int policeFlag;
	private String createDate;
	private String updateDate;
	private String deleteDate;
	private List<FileVO> files;
	private List<CommentVO> comments;
	private List<LikeVO> likes;
	private List<StarVO> stars;
	private List<BpoliceVO> Bpolices;
	private String filePath;
	private String fileName;
	private int star;
	private int likeCount;
	private int likeFlag;
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getLikeFlag() {
		return likeFlag;
	}
	public void setLikeFlag(int likeFlag) {
		this.likeFlag = likeFlag;
	}
	public List<CommentVO> getComments() {
		return comments;
	}
	public void setComments(List<CommentVO> comments) {
		this.comments = comments;
	}
	public List<LikeVO> getLikes() {
		return likes;
	}
	public void setLikes(List<LikeVO> likes) {
		this.likes = likes;
	}
	public List<StarVO> getStars() {
		return stars;
	}
	public void setStars(List<StarVO> stars) {
		this.stars = stars;
	}
	public List<BpoliceVO> getBpolices() {
		return Bpolices;
	}
	public void setBpolices(List<BpoliceVO> bpolices) {
		Bpolices = bpolices;
	}
	public List<FileVO> getFiles() {
		return files;
	}
	public void setFiles(List<FileVO> files) {
		this.files = files;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public int getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public int getPoliceFlag() {
		return policeFlag;
	}
	public void setPoliceFlag(int policeFlag) {
		this.policeFlag = policeFlag;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", author=" + author + ", categoryNo=" + categoryNo + ", notice=" + notice
				+ ", hit=" + hit + ", title=" + title + ", body=" + body + ", deleteFlag=" + deleteFlag
				+ ", policeFlag=" + policeFlag + ", createDate=" + createDate + ", updateDate=" + updateDate
				+ ", deleteDate=" + deleteDate + ", files=" + files + ", comments=" + comments + ", likes=" + likes
				+ ", stars=" + stars + ", Bpolices=" + Bpolices + "]";
	}
}
