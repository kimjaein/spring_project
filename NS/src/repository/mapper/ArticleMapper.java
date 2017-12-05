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

	public int updateLikeCount(@Param("article_num")int article_num,@Param("like_count")int like_count);

	public int selectLikeCount(int article_num);

	public int insertLikeWho(@Param("memberNum")int memberNum,@Param("article_num")int article_num);

	public int deleteLikeWho(int memberNum, int article_num);
}
