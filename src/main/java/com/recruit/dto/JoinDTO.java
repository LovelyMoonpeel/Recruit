package com.recruit.dto;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Entity;
import org.hibernate.validator.constraints.Email;

@Entity
public class JoinDTO {

	@Id
	@Size(min=4, max=10, message="아이디는 4~10자리이어야 합니다.")
	private String id;

	@Size(min=6, max=12, message="비밀번호는 6~12자리이어야 합니다.")
	private String pw;
	
	@Column
	@NotNull
	@Pattern(regexp="\\s{2,6}", message="이름은 2~6자로 입력해주세요.")
	private String cname;
	
	@Size(min=2, message="회사명은 2글자 이상이어야 합니다.")
	private String pname;
	
	@Size(min=5, message="이메일 형식이 아닙니다.")
	@Email(message="이메일 형식이 아닙니다.")
	private String email;
	
	@Size(min=5, max=10, message="사업자 등록번호는 9~10자로 입력해주세요")
	private String registnum;
	
	private String birth;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegistnum() {
		return registnum;
	}

	public void setRegistnum(String registnum) {
		this.registnum = registnum;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "JoinDTO [id=" + id + ", pw=" + pw + ", cname=" + cname + ", pname=" + pname + ", email=" + email
				+ ", registnum=" + registnum + ", birth=" + birth + "]";
	}
	
	
}
