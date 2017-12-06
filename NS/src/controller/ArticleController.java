package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import service.ArticleService;
import vo.ArticlePhotoVO;
import vo.ArticleVO;
import vo.CommentVO;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService service;

	public void setService(ArticleService service) {
		this.service = service;
	}

	@RequestMapping("/upload.ns")
	public ModelAndView upload(HttpServletRequest request, ArticlePhotoVO photo, ArticleVO article) {
		// main.jsp로 변경
		ModelAndView mv = new ModelAndView("article");
		String uploadPath = request.getServletContext().getRealPath("img");
		File dir = new File(uploadPath);
		System.out.println(uploadPath);
		String stringNum = request.getParameter("memberNum");
		int memberNum = Integer.parseInt(stringNum);

		String name = request.getParameter("name");
		String text = request.getParameter("text");
		article.setWriter(name);
		article.setContents(text);
		article.setMember_num(memberNum);
		if (dir.exists() == false) {
			dir.mkdir();
		}
		// 사진이 1개라도 올라간 경우
		if (photo.getPhoto() != null && photo.getPhoto().size() > 0) {
			int articleNum = service.ArticleInsert(article);
			int count = 0;
			for (MultipartFile f : photo.getPhoto()) {
				if (f.getOriginalFilename().length() > 0) {
					count++;
					String savedName = new Random().nextInt(100) + f.getOriginalFilename();
					File saveFile = new File(uploadPath + "/" + savedName);
					mv.addObject("imgPath", "img/" + savedName);
					mv.addObject("url", uploadPath);
					String FileURL = "img/" + savedName;

					// 사진이 총 몇개 올라갔나 체크
					service.ArticlePhotoInsert(articleNum, FileURL);
					try {
						f.transferTo(saveFile);
						// article insert: 데이트는 다 new date하고 좋아요 = 0 writer,contents넣고
						// insert 후 article_num값을 빼와서 saveFile과 함께 articlePhoto에 insert
						// 종합 : insert -> insert
						// int articleNum = service.ArticleInsert(article);
						// if (articleNum > 0) {
						////
						// service.ArticlePhotoInsert(articleNum, FileURL);
						// }
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			// 사진이 하나도 안올라가고 글만 올라 간 경우
		} else {
			int articleNum = service.ArticleInsert(article);
			if (articleNum > 0) {
				service.ArticlePhotoInsert(articleNum, "noFile");
			}
		}
		return mv;
	}

	@RequestMapping("single.ns")
	public ModelAndView singlePage(HttpSession session) {
		int memberNum = (int) session.getAttribute("memberNum");
		List<ArticleVO> articleList = service.selectArticleList(memberNum);
		ModelAndView mv = new ModelAndView("single_post");
		mv.addObject("articleList", articleList);
		return mv;
	}

	@RequestMapping(value = "articleViewPhoto.ns", method = RequestMethod.GET)
	public void articleViewPhoto(int article_num, HttpServletResponse response) throws IOException {
		List<ArticlePhotoVO> photoURL = service.articlePhotoView(article_num);
		
		List<String> filePath = new ArrayList<>();
		for(ArticlePhotoVO url:photoURL) {
			filePath.add(url.getFilePath());
		}
		response.setContentType("text/json;charset=euc-kr");
		PrintWriter writer = response.getWriter();
		Gson gson = new Gson();
		writer.print(gson.toJson(filePath));

	}

	@RequestMapping(value = "articleViewContents.ns", method = RequestMethod.GET)
	public void articleViewContents(int article_num, HttpServletResponse response) throws IOException {
		ArticleVO contents = service.articleView(article_num);

		response.setContentType("text/json;charset=euc-kr");
		PrintWriter writer = response.getWriter();
		Gson gson = new Gson();
		writer.print(gson.toJson(contents));

	}
	@RequestMapping(value = "articleComment.ns", method = RequestMethod.GET)
	   public void articleCommentView(int article_num,HttpServletResponse response) throws IOException {
	      List<CommentVO> commentList = service.commentSelect(article_num);
	      System.out.println("----------댓글리스트-----------------");
	      System.out.println(commentList);
	      
	      response.setContentType("text/json;charset=euc-kr");
	      PrintWriter writer = response.getWriter();
	      Gson gson = new Gson();
	      writer.println(gson.toJson(commentList));
	   
	   }
	   @RequestMapping(value = "articleViewComment.ns", method = RequestMethod.POST)
	   public void articleCommentSelect(HttpServletResponse response,HttpServletRequest request) throws IOException {
	      String comment = request.getParameter("comment");
	      String article_number = request.getParameter("article_num");
	      String commentId = request.getParameter("commentId");
	      CommentVO commentVO = new CommentVO();
	      int article_num = Integer.parseInt(article_number);
	      commentVO.setArticle_num(article_num);
	      commentVO.setContent(comment);
	      commentVO.setWriter(commentId);
	      System.out.println(commentId);
	      if (comment != null && comment.length() > 0) {
	          service.commentAdd(commentVO);
	          System.out.println("댓글 작성 완료");
	          List<CommentVO> commentList = service.commentSelect(article_num);
	          response.setContentType("text/json;charset=euc-kr");
	          PrintWriter writer = response.getWriter();
	          Gson gson = new Gson();
	          writer.println(gson.toJson(commentList));
	      }else {
	         // 이 영역에는 댓글을 공백으로 입력했을 경우의 상황을 처리하면 됌!
	         System.out.println("댓글 값 없다!");
	      }
	   }
	
	@RequestMapping("moreArticle.ns")
	public void getMoreArticle(int count,HttpServletResponse response,HttpSession session) {
		int memberNum = (int) session.getAttribute("memberNum");
		System.out.println(memberNum+ " : "+count);
		ArticleVO article =service.selectArticle(count,memberNum);
		
		PrintWriter writer;
		try {
			writer = response.getWriter();
			Gson gson = new Gson();
			
			writer.println(gson.toJson(article));
			System.out.println(gson.toJson(article));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("updateLikeCount.ns")
	public void updateLikeCount(int article_num,String task,HttpServletResponse response,HttpSession session) {
		String str="";
		int memberNum = (int) session.getAttribute("memberNum");
		if(task.equals("increase")) {
			System.out.println("increse");
			str=service.updateLikeCount(article_num,1,memberNum);
		}else{
			str= service.updateLikeCount(article_num,-1,memberNum);
		}
		
		PrintWriter writer;
		try {
			writer = response.getWriter();
			Gson gson = new Gson();
			
			writer.println(gson.toJson(str));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
