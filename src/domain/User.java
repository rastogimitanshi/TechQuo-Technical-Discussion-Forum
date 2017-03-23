package domain;
import java.util.Date;
public class User {
	private Integer UserId;
	private String FirstName;
	private String LastName;
	private Integer q1;
	private Integer q2;
	private String ans1;
	private String ans2;
	private String url;
	private String Country;
	private String EmailId;
	private String City;
	private String JobPosition;
	private String Role;
	private Boolean Activity;
	private Integer ProfileViews ;
	private String Password;
	private Date create_time;
	private Date expiry_date;
	private Date DOB;
	private Integer QuestionsPosted;
	private Integer AnswersAnswered;
	public User()
	{
	}
	
	public User(Integer UserId,String FirstName,String LastName,String Country,String EmailId,String City,String JobPosition,Date DOB,String Password)
	{	
	this.UserId = UserId;
	this.FirstName = FirstName;
	this.LastName = LastName;
	//this.q1 = q1;
	//this.q2 = q2;
	//this.ans1 = ans1;
	//this.ans2 = ans2;
	//this.url = url;
	this.Country = Country;
	this.EmailId = EmailId;
	this.City = City;
	this.JobPosition = JobPosition;
	//this.Role = Role;
	//this.Activity = Activity;
	
	this.Password = Password;
	//this.create_time = create_time;
	//this.expiry_date = expiry_date;
	this.DOB = DOB;
	}
	
	public Integer getUserId() {
		return UserId;
	}
	public String getFirstName() {
		return FirstName;
	}
	public String getLastName() {
		
		return LastName;
	}
	public Integer getq1() {
		return q1;
	}
	public Integer getq2() {
		return q2;
	}
	public String getans1() {
		return ans1;
	}
	public String getans2() {
		return ans2;
	}
	public String geturl() {
		return url;
	}
	public String getCountry() {
		return Country;
	}
	public String getEmailId() {
		return EmailId;
	}
	public String getCity() {
		return City;
	}
	public String getJobPosition() {
		return JobPosition;
	}
	public String getRole() {
		return Role;
	}
	public Boolean getActivity() {
		return Activity;
	}
	public Integer getProfileViews() {
		return ProfileViews;
	}
	public String getPassword() {
		return Password;
	}
	public Date getcreate_time() {
		return create_time;
	}
	public Date getexpiry_date() {
		return expiry_date;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setEmailId(String Email)
	{
		this.EmailId=Email;
	}
	public void setPassword(String Password)
	{
		this.Password=Password;
	}

	public Integer getQuestionsPosted() {
		return QuestionsPosted;
	}

	public void setQuestionsPosted(Integer questionsPosted) {
		QuestionsPosted = questionsPosted;
	}

	public Integer getAnswersAnswered() {
		return AnswersAnswered;
	}

	public void setAnswersAnswered(Integer answersAnswered) {
		AnswersAnswered = answersAnswered;
	}
	
}