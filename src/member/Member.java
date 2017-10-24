package member;

public class Member {
private String id;
private String name;
private String nickname;
private String password;
private String place;
private String regnumber;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getPlace() {
	return place;
}
public void setPlace(String place) {
	this.place = place;
}
public String getRegnumber() {
	return regnumber;
}
public void setRegnumber(String regnumber) {
	this.regnumber = regnumber;
}
@Override
public String toString() {
	return "Member [id=" + id + ", name=" + name + ", nickname=" + nickname + ", password=" + password + ", place="
			+ place + ", regnumber=" + regnumber + "]";
}

}