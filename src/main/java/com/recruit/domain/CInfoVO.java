package com.recruit.domain;

public class CInfoVO { // 회사 정보 VO

	private String id;
	private String cname;
	private int img;
	private String homepage;
	private String intro;
	private String ceo;
	private String ctype;
	private String form;
	private String establish;
	private String numemp;
	private String sales;
	private String tel;
	private String fax;
	private String sns;
	private String location;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public int getImg() {
		return img;
	}

	public void setImg(int img) {
		this.img = img;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getForm() {
		return form;
	}

	public void setForm(String form) {
		this.form = form;
	}

	public String getEstablish() {
		return establish;
	}

	public void setEstablish(String establish) {
		this.establish = establish;
	}

	public String getNumemp() {
		return numemp;
	}

	public void setNumemp(String numemp) {
		this.numemp = numemp;
	}

	public String getSales() {
		return sales;
	}

	public void setSales(String sales) {
		this.sales = sales;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getSns() {
		return sns;
	}

	public void setSns(String sns) {
		this.sns = sns;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "CinfoVO [id=" + id + ", cname=" + cname + ", img=" + img + ", homepage=" + homepage + ", intro=" + intro
				+ ", ceo=" + ceo + ", ctype=" + ctype + ", form=" + form + ", establish=" + establish + ", numemp="
				+ numemp + ", sales=" + sales + ", tel=" + tel + ", fax=" + fax + ", sns=" + sns + ", location="
				+ location + "]";
	}
}
