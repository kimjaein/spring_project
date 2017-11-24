package controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vo.ArticlePhtoVO;
import vo.ArticleVO;

@Controller
public class ArticleController {

	// @RequestMapping("/upload.do")
	// public String upload(MemberVO member) {
	// String uploadPath = "C:\\Users\\student\\Desktop\\lhg\\test\\";
	//// C:/test/
	// //directory
	// File dir = new File(uploadPath);
	// //Path값의 마지막 폴더명이 없으면
	// if(dir.exists()==false) {
	// //해당명의 폴더로 직접 만들어라
	// //make
	// dir.mkdir();
	// }
	// //해당 위치에 이미지파일을 임의의 명으로
	// //서버측에 저장시키기
	// //저장된 파일 경로
	// String savePath = uploadPath+new Random().nextInt(100000);
	// File saveFile = new File(savePath);
	// //전달받은 파일 업로드 작업.
	// try {
	// member.getMemImg().transferTo(saveFile);
	//
	// //이 시점에 폴더명,경로등등을 디비작업하면 됨!
	// System.out.println("----------------------------");
	// System.out.println("업로드 완료");
	// System.out.println("아이디:"+member.getId());
	// System.out.println("비번:"+member.getPw());
	// System.out.println("원본이름:"+member.getMemImg().getOriginalFilename());
	// System.out.println("저장된경로:"+saveFile.getAbsolutePath());
	// System.out.println("----------------------------");
	// } catch (IllegalStateException e) {
	// e.printStackTrace();
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// return "upload_result";
	// }
	@RequestMapping("/upload.ns")
	public ModelAndView upload(ArticleVO articleNum, HttpServletRequest request,ArticlePhtoVO photo) {
		ModelAndView mv = new ModelAndView();
		String uploadPath = request.getServletContext().getRealPath("img");
		System.out.println(uploadPath);
		File dir = new File(uploadPath);

		if (dir.exists() == false) {
			dir.mkdir();
		}
		// 이렇게 해야 맨 뒤에 확장자명(.jpg)가 붙는다.
		String savedName = new Random().nextInt(100) + photo.getPhoto().getOriginalFilename();
		File saveFile = new File(uploadPath + "/" + savedName);
		mv.addObject("imgPath", "img/" + savedName);
		mv.addObject("url", uploadPath);
		try {
			photo.getPhoto().transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;
	}

//	@RequestMapping("/uploadForm2.do")
//	public String uploadForm2() {
//		return "upload_form2";
//	}
//
//	@RequestMapping("/uploadMulti.do")
//	public ModelAndView uploadMulti(MemberMultiVO multi) {
//		ModelAndView mv = new ModelAndView("upload_multi_result");
//		// c:/test
//		String uploadPath = "C:\\Users\\student\\Desktop\\lhg\\test\\";
//
//		File dir = new File(uploadPath);
//		if (dir.exists() == false) {
//			dir.mkdir();
//		}
//		System.out.println("일반 파라미터 ID : " + multi.getId());
//		System.out.println("일반 파라미터 PW : " + multi.getPw());
//		// 클라이언트가 업로드한 파일 전부
//		if(multi.getFileList() != null && multi.getFileList().size()>0) {
//		for (MultipartFile f : multi.getFileList()) {
//			String savePath = new Random().nextInt(100) + f.getOriginalFilename();
//			File saveFile = new File(uploadPath + "/" + savePath);
//			// 전달받은 파일 업로드 작업.
//			try {
//				f.transferTo(saveFile);
//
//				// 이 시점에 폴더명,경로등등을 디비작업하면 됨!
//				System.out.println("----------------------------");
//				System.out.println("업로드 완료");
//				System.out.println("원본이름:" + f.getOriginalFilename());
//				System.out.println("저장된경로:" + saveFile.getAbsolutePath());
//				System.out.println("----------------------------");
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//
//		}
//		}
//		mv.addObject("fileCount", multi.getFileList().size());
//		return mv;
//	}
	@RequestMapping("single.ns")
	public String singlePage() {
		return "single_post";
	}
	@RequestMapping("/testMain.ns")
	public String test() {
		return "testMain";
	}
}
