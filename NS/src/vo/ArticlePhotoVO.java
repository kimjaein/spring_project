package vo;

import org.springframework.web.multipart.MultipartFile;

public class ArticlePhotoVO {
	private int articlt_num;
	private MultipartFile photo;
	////////////////////////////////////////////
	public int getArticlt_num() {
		return articlt_num;
	}
	public void setArticlt_num(int articlt_num) {
		this.articlt_num = articlt_num;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	
	
}
