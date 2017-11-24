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
	// //Path���� ������ �������� ������
	// if(dir.exists()==false) {
	// //�ش���� ������ ���� ������
	// //make
	// dir.mkdir();
	// }
	// //�ش� ��ġ�� �̹��������� ������ ������
	// //�������� �����Ű��
	// //����� ���� ���
	// String savePath = uploadPath+new Random().nextInt(100000);
	// File saveFile = new File(savePath);
	// //���޹��� ���� ���ε� �۾�.
	// try {
	// member.getMemImg().transferTo(saveFile);
	//
	// //�� ������ ������,��ε���� ����۾��ϸ� ��!
	// System.out.println("----------------------------");
	// System.out.println("���ε� �Ϸ�");
	// System.out.println("���̵�:"+member.getId());
	// System.out.println("���:"+member.getPw());
	// System.out.println("�����̸�:"+member.getMemImg().getOriginalFilename());
	// System.out.println("����Ȱ��:"+saveFile.getAbsolutePath());
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
		// �̷��� �ؾ� �� �ڿ� Ȯ���ڸ�(.jpg)�� �ٴ´�.
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
//		System.out.println("�Ϲ� �Ķ���� ID : " + multi.getId());
//		System.out.println("�Ϲ� �Ķ���� PW : " + multi.getPw());
//		// Ŭ���̾�Ʈ�� ���ε��� ���� ����
//		if(multi.getFileList() != null && multi.getFileList().size()>0) {
//		for (MultipartFile f : multi.getFileList()) {
//			String savePath = new Random().nextInt(100) + f.getOriginalFilename();
//			File saveFile = new File(uploadPath + "/" + savePath);
//			// ���޹��� ���� ���ε� �۾�.
//			try {
//				f.transferTo(saveFile);
//
//				// �� ������ ������,��ε���� ����۾��ϸ� ��!
//				System.out.println("----------------------------");
//				System.out.println("���ε� �Ϸ�");
//				System.out.println("�����̸�:" + f.getOriginalFilename());
//				System.out.println("����Ȱ��:" + saveFile.getAbsolutePath());
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
