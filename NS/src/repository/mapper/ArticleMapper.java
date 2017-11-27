package repository.mapper;

import org.apache.ibatis.annotations.Param;

import vo.ArticleVO;

public interface ArticleMapper {
	public int ArticleInsert(ArticleVO article);

	public int ArticlePhotoInsert(@Param("article_num")int articleNum, @Param("photo")String saveFile);
}
