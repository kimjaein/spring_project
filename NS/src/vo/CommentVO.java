package vo;

import java.util.Date;

public class CommentVO {
	private int article_num;
	private int comment_num;
	private String content;
	private String writer;
	private Date write_date;
	/////////////////////////////////////////////
	public CommentVO(int article_num, int comment_num, String content, String writer, Date write_date) {
		super();
		this.article_num = article_num;
		this.comment_num = comment_num;
		this.content = content;
		this.writer = writer;
		this.write_date = write_date;
	}
	public CommentVO() {
	}
	/////////////////////////////////////////////
	public int getArticle_num() {
		return article_num;
	}
	public void setArticle_num(int article_num) {
		this.article_num = article_num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	/////////////////////////////////////////////
	@Override
	public String toString() {
		return "CommentVO [article_num=" + article_num + ", comment_num=" + comment_num + ", content=" + content
				+ ", writer=" + writer + ", write_date=" + write_date + "]";
	}
}
