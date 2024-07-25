package cProject.movie.vo;

import java.util.List;

public class LikeVO {
		private int likeNo;
		private String likeUser;
		private int bno;
		private String likeDate;
		private List<BoardVO> boards;
		
		public List<BoardVO> getBoards() {
			return boards;
		}
		public void setBoards(List<BoardVO> boards) {
			this.boards = boards;
		}
		public String getLikeDate() {
			return likeDate;
		}
		public void setLikeDate(String likeDate) {
			this.likeDate = likeDate;
		}
		public int getLikeNo() {
			return likeNo;
		}
		public void setLikeNo(int likeNo) {
			this.likeNo = likeNo;
		}
		public String getLikeUser() {
			return likeUser;
		}
		public void setLikeUser(String likeUser) {
			this.likeUser = likeUser;
		}
		public int getBno() {
			return bno;
		}
		public void setBno(int bno) {
			this.bno = bno;
		}
		
}
