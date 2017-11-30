package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.ArticlePhotoVO;
import vo.ArticleVO;

public interface ArticleMapper {
	public int ArticleInsert(ArticleVO article);

	public int ArticlePhotoInsert(@Param("article_num") int articleNum, @Param("photo") String saveFile);

	public List<ArticleVO> selectArticleList(int memberNum);

	public List<ArticlePhotoVO> selectArticlePhotoList(int article_num);

	public ArticlePhotoVO articlePhotoView(int article_num);

	public ArticleVO articleView(int article_num);
}
