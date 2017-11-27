package controller;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.ArticleService;
import vo.ArticlePhotoVO;
import vo.ArticleVO;
import vo.MemberVO;

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
		ModelAndView mv = new ModelAndView("main.jsp");
		String uploadPath = request.getServletContext().getRealPath("img");
		System.out.println("주소" + uploadPath);
		File dir = new File(uploadPath);
		System.out.println("파라미터" + request.getParameter("text"));
		System.out.println("로그인한 이름" + request.getParameter("name"));
		System.out.println("멤넘" + request.getParameter("memberNum"));
		String stringNum = request.getParameter("memberNum");
		int memberNum = Integer.parseInt(stringNum);
		String name = request.getParameter("name");
		String text = request.getParameter("text");
		System.out.println("네임1:" + name);
		article.setWriter(name);
		System.out.println("네임2:" + article.getWriter());
		article.setContents(text);
		article.setWrite_time(new Date());
		article.setMember_num(memberNum);
		if (dir.exists() == false) {
			dir.mkdir();
		}
		String savedName = new Random().nextInt(100) + photo.getPhoto().getOriginalFilename();
		File saveFile = new File(uploadPath + "/" + savedName);
		mv.addObject("imgPath", "img/" + savedName);
		mv.addObject("url", uploadPath);
		System.out.println(saveFile);
		String FileURL = uploadPath + "/" + savedName;

		try {
			photo.getPhoto().transferTo(saveFile);
			System.out.println("여긴 디비작업영역");
			// article insert: 데이트는 다 new date하고 좋아요 = 0 writer,contents넣고
			// insert 후 article_num값을 빼와서 saveFile과 함께 articlePhoto에 insert
			// 종합 : insert -> insert
			int articleNum = service.ArticleInsert(article);
			System.out.println("아티클 넘값" + articleNum);
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
	public String singlePage() {
		return "single_post";
	}
}
