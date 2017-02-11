package domain;

import java.util.Date;

public class Question {
	
	private Integer Quesid;
	private String Question;
	private Date create_time;
	private Integer user_id;
	private Integer count;
	
	public Question(Integer Quesid,String Question,Date create_time, Integer user_id)
	{
		this.Quesid=Quesid;
		this.Question=Question;
		this.create_time=create_time;
		this.user_id=user_id;
	}
	public Integer getQuesid()
	{
		return Quesid;

	}
	public String getQuestion(){
		return Question;
	}
	public Date getcreate_time(){
		return create_time;
	}
	public Integer getuser_id(){
		return user_id;
	}
	public void setQuesid(Integer Quesid)
	{
		this.Quesid=Quesid;
	}
	public void setQuestion(String Question){
		this.Question=Question;
	}
	public void setcreate_time(Date create_time){
		this.create_time=create_time;
	}
	public void setuser_id(Integer user_id){
		this.user_id=user_id;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	}

