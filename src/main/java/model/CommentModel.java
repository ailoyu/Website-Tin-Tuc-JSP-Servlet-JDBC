package model;


public class CommentModel extends AbstractModel<CommentModel>{
	
	private String content;
	private Long userId;
	private Long newId;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getUser_id() {
		return userId;
	}
	public void setUser_id(Long user_id) {
		this.userId = user_id;
	}
	public Long getNew_id() {
		return newId;
	}
	public void setNew_id(Long new_id) {
		this.newId = new_id;
	}
	
	
}
