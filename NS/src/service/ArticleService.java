package service;

import java.util.*;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.ArticleDao;
import vo.ArticleVO;

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
		System.out.println("서비스왔다2.");
		return dao.ArticlePhotoInsert(articleNum, FileURL);
	}
	
	////////////////////////////////////////////////////////////////////////////
	public List<ArticleVO> selectArticleList(int memberNum){
		List<ArticleVO> articleList =new ArrayList<ArticleVO>();
		articleList = dao.selectArticleList(memberNum);
		for(int i=0;i<articleList.size();i++) {
			ArticleVO article = articleList.get(i);
			article.setPhotoList(dao.selectArticlePhoto(article.getArticle_num()));
			articleList.set(i, article);
			System.out.println(articleList.get(i).toString());
		}
		return articleList;
	}
}
