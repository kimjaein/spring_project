package service;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.ArticleDao;
import vo.ArticlePhotoVO;
import vo.ArticleVO;
import vo.CommentVO;

@Component
public class ArticleService {

	@Autowired
	private ArticleDao dao;

	public void setDao(ArticleDao dao) {
		this.dao = dao;
	}

	public int ArticleInsert(ArticleVO vo) {
		if(dao.ArticleInsert(vo)>0) {
			return vo.getArticle_num();
		}else {
			return -1;
		}
	}

	public int ArticlePhotoInsert(int articleNum, String FileURL) {
		return dao.ArticlePhotoInsert(articleNum, FileURL);
	}
	
	////////////////////////////////////////////////////////////////////////////
	public List<ArticleVO> selectArticleList(int memberNum){
		List<ArticleVO> articleList =new ArrayList<ArticleVO>();
		articleList = dao.selectArticleList(memberNum);
		for(int i=0;i<articleList.size();i++) {
			ArticleVO article = articleList.get(i);
			article.setPhotoList(dao.selectArticlePhoto(article.getArticle_num()));
			if(dao.selectLoginIdisLike(article.getArticle_num(), memberNum)==1) {
				article.setLike(true);
			}else {
				article.setLike(false);
			}
			articleList.set(i, article);
		}
		return articleList;
	}

	public List<ArticlePhotoVO> articlePhotoView(int article_num) {
		return dao.articlePhotoView(article_num);
	}

	public ArticleVO articleView(int article_num) {
		return dao.articleView(article_num);
	}

	public int commentAdd(CommentVO vo) {
		return dao.commentAdd(vo);
	}

	public List<CommentVO> commentSelect(int article_num) {
		return dao.commentSelect(article_num);
	}

	public ArticleVO selectArticle(int count,int memberNum) {
		System.out.println("service in");
		ArticleVO article = dao.selectArticle(count, memberNum);
		
		article.setPhotoList(dao.selectArticlePhoto(article.getArticle_num()));
		if(dao.selectLoginIdisLike(article.getArticle_num(), memberNum)==1) {
			article.setLike(true);
		}else {
			article.setLike(false);
		}
		return article;
	}

	public String updateLikeCount(int article_num,int changeCount,int memberNum) {
		System.out.println("service");
		int like_count = dao.selectLikeCount(article_num);
		like_count = like_count + changeCount;
			System.out.println(like_count);
		if(dao.updateLikeCount(article_num,like_count) == 1) {
			if(changeCount > 0) {
				dao.insertLikeWho(memberNum,article_num);
			}else {
				dao.deleteLikeWho(memberNum,article_num);
			}
			return like_count+"";
		}else {
			return (like_count-changeCount)+"";
		}
		
	}
}
