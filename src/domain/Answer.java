package domain;

import java.util.Date;

public class Answer {
	private Integer Ans_id;
	private Integer Ques_id_A;
	private String Answer;
	private Date create_time;
	private Integer user_id_A;
	private Integer upvotes;
	private Integer downvotes;
	public Answer(Integer Ans_id, Integer Ques_id_A, String Answer, Date create_time, Integer user_id_A, Integer Upvotes, Integer Downvotes) {
		this.setAns_id(Ans_id);
		this.setAnswer(Answer);
		this.setCreate_time(create_time);
		this.setQues_id_A(Ques_id_A);
		this.setUser_id_A(user_id_A);
		this.setUpvotes(Upvotes);
		this.setDownvotes(Downvotes);
			}
	public Integer getDownvotes() {
		return downvotes;
	}
	public void setDownvotes(Integer downvotes) {
		this.downvotes = downvotes;
	}
	public Integer getUpvotes() {
		return upvotes;
	}
	public void setUpvotes(Integer upvotes) {
		this.upvotes = upvotes;
	}
	public Integer getUser_id_A() {
		return user_id_A;
	}
	public void setUser_id_A(Integer user_id_A) {
		this.user_id_A = user_id_A;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getAnswer() {
		return Answer;
	}
	public void setAnswer(String answer) {
		Answer = answer;
	}
	public Integer getQues_id_A() {
		return Ques_id_A;
	}
	public void setQues_id_A(Integer ques_id_A) {
		Ques_id_A = ques_id_A;
	}
	public Integer getAns_id() {
		return Ans_id;
	}
	public void setAns_id(Integer ans_id) {
		Ans_id = ans_id;
	}
	

}
