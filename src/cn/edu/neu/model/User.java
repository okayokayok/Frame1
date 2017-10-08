package cn.edu.neu.model;

public class User { 

	private int userId;
	
	private String userName;
	private String userPass;
	private String userAge;
	private byte userSex;
	private String userEmail;
	private byte rank;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserAge() {
		return userAge;
	}
	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}
	public byte getUserSex() {
		return userSex;
	}
	public void setUserSex(byte userSex) {
		this.userSex = userSex;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public byte getRank() {
		return rank;
	}
	public void setRank(byte rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPass=" + userPass + ", userAge=" + userAge
				+ ", userSex=" + userSex + ", userEmail=" + userEmail + ", rank=" + rank + "]";
	}
	
	
}
