package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import service.ArticleService;
import vo.ArticlePhotoVO;
import vo.ArticleVO;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService service;

	public void setService(ArticleService service) {
		this.service = service;
	}

	@RequestMapping("/upload.ns")
	public ModelAndView upload(HttpServletRequest request, ArticlePhotoVO photo, ArticleVO article) {
		// main.jsp�� ����
		
		ModelAndView mv = new ModelAndView("article");
		String uploadPath = request.getServletContext().getRealPath("img");
		File dir = new File(uploadPath);
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
		String savedName = new Random().nextInt(100) + photo.getPhoto().getOriginalFilename();
		File saveFile = new File(uploadPath + "/" + savedName);
		mv.addObject("imgPath", "img/" + savedName);
		mv.addObject("url", uploadPath);
		
		String FileURL = "img/" + savedName;
		System.out.println("url"+FileURL);
		try {
			photo.getPhoto().transferTo(saveFile);
			// article insert: ����Ʈ�� �� new date�ϰ� ���ƿ� = 0 writer,contents�ְ�
			// insert �� article_num���� ���ͼ� saveFile�� �Բ� articlePhoto�� insert
			// ���� : insert -> insert
			int articleNum = service.ArticleInsert(article);
			if (articleNum > 0) {
				
				service.ArticlePhotoInsert(articleNum, FileURL);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping("single.ns")
	public ModelAndView singlePage(HttpSession session) {
		int memberNum= (int) session.getAttribute("memberNum");
		List<ArticleVO> articleList=service.selectArticleList(memberNum);
		ModelAndView mv = new ModelAndView("single_post");
		mv.addObject("articleList",articleList);
		return mv;
	}
	
	@RequestMapping(value="articleViewPhoto.ns",method=RequestMethod.GET)
	public void articleViewPhoto(int article_num,HttpServletResponse response) throws IOException {
		//photo.article_num���� �����ȸ�� �ϴµ� ��ȸ�� �ι��ؼ� �ϳ��� ����url �ϳ��� article����ĳ�´�
		ArticlePhotoVO photoURL = service.articlePhotoView(article_num);
		System.out.println("url��"+photoURL.getFilePath());
		ModelAndView mv = new ModelAndView("single_post");
	
		
		response.setContentType("text/json;charset=euc-kr");
		PrintWriter writer = response.getWriter();
		Gson gson = new Gson();
		writer.print(gson.toJson(photoURL));
		
	}
	@RequestMapping(value="articleViewContents.ns",method=RequestMethod.GET)
	public void articleViewContents(int article_num,HttpServletResponse response) throws IOException {
		//photo.article_num���� �����ȸ�� �ϴµ� ��ȸ�� �ι��ؼ� �ϳ��� ����url �ϳ��� article����ĳ�´�
		ArticleVO contents = service.articleView(article_num);
		System.out.println("����"+contents.getContents());
		System.out.println("�ۼ���"+contents.getWriter());
		System.out.println("���ƿ�"+contents.getLike_count());
		ModelAndView mv = new ModelAndView("single_post");
	
		
		response.setContentType("text/json;charset=euc-kr");
		PrintWriter writer = response.getWriter();
		Gson gson = new Gson();
		writer.print(gson.toJson(contents));
		
	}
	
}
