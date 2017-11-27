package vo;

import java.util.Date;

public class ArticleVO {
	private int article_num; //auto_increment
	private String contents; //내용 필
	private String writer; //작성자 필
	private int like_count; //좋아요 0 미필
	private Date write_time; //작성시간 미필
	private int member_num; //작성자번호 필
	//////////////////////////////////////////////////////////
	public ArticleVO(int article_num, String contents, String writer, int like_count, Date write_time, int member_num) {
		super();
		this.article_num = article_num;
		this.contents = contents;
		this.writer = writer;
		this.like_count = like_count;
		this.write_time = write_time;
		this.member_num = member_num;
	}
	public ArticleVO() {
	}
	//////////////////////////////////////////////////////////
	public int getArticle_num() {
		return article_num;
	}
	
	public void setArticle_num(int article_num) {
		this.article_num = article_num;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public Date getWrite_time() {
		return write_time;
	}
	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
//////////////////////////////////////////////////////////
	@Override
	public String toString() {
		return "ArticleVO [article_num=" + article_num + ", contents=" + contents + ", writer=" + writer
				+ ", like_count=" + like_count + ", write_time=" + write_time + ", member_num=" + member_num + "]";
	}
}
