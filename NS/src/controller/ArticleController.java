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
		// main.jsp�� ����
		ModelAndView mv = new ModelAndView("main.jsp");
		String uploadPath = request.getServletContext().getRealPath("img");
		System.out.println("�ּ�" + uploadPath);
		File dir = new File(uploadPath);
		System.out.println("�Ķ����" + request.getParameter("text"));
		System.out.println("�α����� �̸�" + request.getParameter("name"));
		System.out.println("���" + request.getParameter("memberNum"));
		String stringNum = request.getParameter("memberNum");
		int memberNum = Integer.parseInt(stringNum);
		String name = request.getParameter("name");
		String text = request.getParameter("text");
		System.out.println("����1:" + name);
		article.setWriter(name);
		System.out.println("����2:" + article.getWriter());
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
			System.out.println("���� ����۾�����");
			// article insert: ����Ʈ�� �� new date�ϰ� ���ƿ� = 0 writer,contents�ְ�
			// insert �� article_num���� ���ͼ� saveFile�� �Բ� articlePhoto�� insert
			// ���� : insert -> insert
			int articleNum = service.ArticleInsert(article);
			System.out.println("��ƼŬ �Ѱ�" + articleNum);
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
