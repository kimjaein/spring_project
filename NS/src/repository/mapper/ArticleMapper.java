package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.ArticlePhotoVO;
import vo.ArticleVO;
import vo.CommentVO;

public interface ArticleMapper {
	public int ArticleInsert(ArticleVO article);

	public int ArticlePhotoInsert(@Param("article_num") int articleNum, @Param("photo") String saveFile);

	public List<ArticleVO> selectArticleList(int memberNum);

	public List<ArticlePhotoVO> selectArticlePhotoList(int article_num);

	public List<ArticlePhotoVO> articlePhotoView(int article_num);

	public ArticleVO articleView(int article_num);

	public int commentAdd(CommentVO vo);

	public List<CommentVO> commentSelect(int article_num);

	public ArticleVO selectArticle(@Param("memberNum")int memberNum,@Param("count")int count);
}
