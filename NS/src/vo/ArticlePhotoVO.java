package vo;

import org.springframework.web.multipart.MultipartFile;

public class ArticlePhotoVO {
	private int article_num;
	private MultipartFile photo;
	private String filePath;

	
	public ArticlePhotoVO() {
		// TODO Auto-generated constructor stub
	}
	////////////////////////////////////////////
	public int getArticle_num() {
		return article_num;
	}
	public void setArticle_num(int article_num) {
		this.article_num = article_num;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "ArticlePhotoVO [article_num=" + article_num + ", photo=" + photo + ", filePath=" + filePath + "]";
	}
	

}
