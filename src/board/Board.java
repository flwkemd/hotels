package board;

import java.util.Date;

public class Board {
	private int num;
	private String id;
	private Date date1;
	private String files;
	private String btype;
	private String subtype;
	private String content;
	private String subject;
	private int readcnt;
	private int ref;
	private int reflevel;
	private int refstep;

	public Board() {
	}

	public Board(int num, String id, Date date1, String files, String btype, String subtype, String content,
			String subject, int readcnt, int ref, int reflevel, int refstep) {
		this.num = num;
		this.id = id;
		this.date1 = date1;
		this.files = files;
		this.btype = btype;
		this.subtype = subtype;
		this.content = content;
		this.subject = subject;
		this.readcnt = readcnt;
		this.ref = ref;
		this.reflevel = reflevel;
		this.refstep = refstep;
	}

	public int getNum() {
		return num;
	}

	public String getId() {
		return id;
	}

	public Date getDate1() {
		return date1;
	}

	public String getFiles() {
		return files;
	}

	public String getBtype() {
		return btype;
	}

	public String getSubtype() {
		return subtype;
	}

	public String getContent() {
		return content;
	}

	public String getSubject() {
		return subject;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public int getRef() {
		return ref;
	}

	public int getReflevel() {
		return reflevel;
	}

	public int getRefstep() {
		return refstep;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public void setReflevel(int reflevel) {
		this.reflevel = reflevel;
	}

	public void setRefstep(int refstep) {
		this.refstep = refstep;
	}
	
}
