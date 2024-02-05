package com.c23c_601_2.daoGR;

public class CommentDTO {
	private int cno, clike, mno, del, Pdsno;
	private String comment, mid, mname, cdate,  Regdate ;

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}


	public int getClike() {
		return clike;
	}

	public void setClike(int clike) {
		this.clike = clike;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}


	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getRegdate() {
		return Regdate;
	}

	public void setRegdate(String regdate) {
		Regdate = regdate;
	}


	public int getPdsno() {
		return Pdsno;
	}

	public void setPdsno(int pdsno) {
		Pdsno = pdsno;
	}



}
