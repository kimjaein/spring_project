package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.ArticleMapper;
import vo.ArticlePhotoVO;
import vo.ArticleVO;

@Component("ArticleDao")
public class ArticleDao {
	@Autowired
	private SqlSessionTemplate session;

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	public int ArticleInsert(ArticleVO vo) {
		System.out.println("dao왔다1.");
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.ArticleInsert(vo);
	}

	public int ArticlePhotoInsert(int articleNum, String saveFile) {
		System.out.println("dao왔다2.");
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.ArticlePhotoInsert(articleNum, saveFile);
	}
//////////////////////////////////////////////////////////////////////////
	public List<ArticleVO> selectArticleList(int memberNum) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.selectArticleList(memberNum);
	}

	public List<ArticlePhotoVO> selectArticlePhoto(int article_num) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.selectArticlePhotoList(article_num);
	}
}
