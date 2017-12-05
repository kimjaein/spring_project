package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.ArticleMapper;
import vo.ArticlePhotoVO;
import vo.ArticleVO;
import vo.CommentVO;

@Component("ArticleDao")
public class ArticleDao {
	@Autowired
	private SqlSessionTemplate session;

	public void setSession(SqlSessionTemplate session) {
		this.session = session;
	}

	public int ArticleInsert(ArticleVO vo) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.ArticleInsert(vo);
	}

	public int ArticlePhotoInsert(int articleNum, String saveFile) {
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

	public List<ArticlePhotoVO> articlePhotoView(int article_num) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.articlePhotoView(article_num);
	}

	public ArticleVO articleView(int article_num) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.articleView(article_num);
	}

	public int commentAdd(CommentVO vo) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.commentAdd(vo);
	}

	public List<CommentVO> commentSelect(int article_num) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.commentSelect(article_num);
	}

	public ArticleVO selectArticle(int count,int memberNum) {
		System.out.println("dao in");
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.selectArticle(memberNum,count);
	}

	public int updateLikeCount(int article_num, int like_count) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.updateLikeCount(article_num,like_count); 
	}

	public int selectLikeCount(int article_num) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.selectLikeCount(article_num); 
	}

	public int insertLikeWho(int memberNum, int article_num) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.insertLikeWho(memberNum,article_num);
	}

	public int deleteLikeWho(int memberNum, int article_num) {
		ArticleMapper mapper = session.getMapper(ArticleMapper.class);
		return mapper.deleteLikeWho(memberNum,article_num);
	}
}
