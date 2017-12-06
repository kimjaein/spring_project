package vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int memberNum;
	private String id;
	private String pw;
	private String name;
	private String birth;
	private int gender;
	private String address;
	private String photo;
	private MultipartFile photoFile;
	
	public MemberVO() {
		
	}

	public MemberVO(int memberNum, String id, String pw, String name, String birth, int gender, String address,
			String photo, MultipartFile photoFile) {
		this.memberNum = memberNum;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
		this.photo = photo;
		this.photoFile = photoFile;
	}

	public MemberVO(String id, String pw, String name, String birth, int gender, String address, String photo,
			MultipartFile photoFile) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.address = address;
		this.photo = photo;
		this.photoFile = photoFile;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public MultipartFile getPhotoFile() {
		return photoFile;
	}

	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}

	@Override
	public String toString() {
		return "MemberVO [memberNum=" + memberNum + ", id=" + id + ", pw=" + pw + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", address=" + address + ", photo=" + photo + ", photoFile=" + photoFile + "]";
	}
}
