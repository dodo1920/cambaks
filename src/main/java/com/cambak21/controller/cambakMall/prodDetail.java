package com.cambak21.controller.cambakMall;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cambak21.domain.ProdQAVO;
import com.cambak21.domain.ProdQAsLikeVO;
import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.ProdQAInsertDTO;
import com.cambak21.dto.ProdQAUpdateDTO;
import com.cambak21.service.boardProdQA.BoardProdQAService;
import com.cambak21.service.cambakMall.prodDetailService;
import com.cambak21.util.FileUploadProdcess;
import com.cambak21.util.MediaConfirm;
import com.cambak21.util.PagingCriteria;
import com.cambak21.util.PagingParam;

@Controller
@RequestMapping("/mall/prodDetail/*")
public class prodDetail {
	
	private static final Logger logger = LoggerFactory.getLogger(prodDetail.class);
	
	@Inject
	private BoardProdQAService QAService;
	
	@Inject
	private prodDetailService prodService;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String prodDetailPage(@RequestParam("prodId") int prodId, @RequestParam("page") int page, @RequestParam("cate") String cate, Model model) throws Exception {
		logger.info("상품 상세 페이지");
		
		ProductsVO prodDetail = prodService.getProdDetail(prodId);
		System.out.println(prodDetail);
		
		model.addAttribute("prodDetail", prodDetail);
		
		return "cambakMall/prodDetail";
	}
	
	@RequestMapping(value="/prodQAList", method=RequestMethod.GET)
	public ResponseEntity<List<ProdQAVO>> prodQAList(@RequestParam("prodId") int prodId, @RequestParam("page") int page, @RequestParam("cate") String cate, PagingCriteria cri) {
		logger.info("QA 리스트 호출");
		
		cri.setPage(page);
		System.out.println(cri);
		
		ResponseEntity<List<ProdQAVO>> entity = null;
	      
	    try {
	       entity = new ResponseEntity<List<ProdQAVO>>(QAService.prodQAListAll(prodId, 1, cri, cate), HttpStatus.OK);
	    } catch (Exception e) {
	       e.printStackTrace();
	       entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);  // 예외가 발생하면 List<ReplyVO>는 null이므로 >> ResponseEntity<>
	    }
	    
	    return entity;
	}
	
	@RequestMapping(value="/prodQAReplyList", method=RequestMethod.POST)
	public ResponseEntity<List<ProdQAVO>> prodQAReplyList(@RequestBody ProdQAVO vo) {
		logger.info("QA 답글 리스트 호출");
		
		ResponseEntity<List<ProdQAVO>> entity = null;
	      
	    try {
	       entity = new ResponseEntity<List<ProdQAVO>>(QAService.prodQAReplyListAll(vo.getProdQA_no()), HttpStatus.OK);
	    } catch (Exception e) {
	       e.printStackTrace();
	       entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);  // 예외가 발생하면 List<ReplyVO>는 null이므로 >> ResponseEntity<>
	    }
	    
	    return entity;
	}
	
	@RequestMapping(value="/prodQAPP", method=RequestMethod.GET)
	public ResponseEntity<PagingParam> prodQAPageing(@RequestParam("prodId") int prodId, @RequestParam("cate") String cate, PagingCriteria cri) {
		logger.info("QA 리스트 페이징 호출");
		
		ResponseEntity<PagingParam> entity = null;
		
		PagingParam pp = new PagingParam();
		pp.setCri(cri);
		
		try {
			pp.setTotalCount(QAService.totalProdQACnt(1, prodId, cate));
			entity = new ResponseEntity<PagingParam>(pp, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);  // 예외가 발생하면 List<ReplyVO>는 null이므로 >> ResponseEntity<>
			e.printStackTrace();
		}
		
		return entity;
	}
	
	@RequestMapping(value="/prodQAForm", method=RequestMethod.GET)
	public String ShowInsertProdQA(@RequestParam("prodId") int prodId) throws Exception {
		logger.info("QA 글쓰기 페이지 소환");
		
		return "cambakMall/prodQAForm";
	}
	
	@RequestMapping(value="/prodQAForm", method=RequestMethod.POST)
	public String uploadForm(@RequestParam("prodId") int prodId, @RequestParam("page") int page, ProdQAInsertDTO insertQA, RedirectAttributes rttr, Model model) throws Exception {
		logger.info("QA 글쓰기 저장");
		
		insertQA.setProduct_id(prodId);
		
		System.out.println(insertQA.toString());

		if(insertQA.getProdQA_isSecret() != null) {
			insertQA.setProdQA_isSecret("Y");
		} else {
			insertQA.setProdQA_isSecret("N");
		}
		
		int getMaxNo = QAService.getMaxNo();
		
		int newNo = getMaxNo + 1;
		
		insertQA.setProdQA_ref(newNo);
		
		System.out.println(insertQA.toString());
		
		if(QAService.insertProdQA(insertQA)) {
			rttr.addAttribute("result", "success");
		}
		
		return "redirect:/mall/prodDetail/main?prodId=" + prodId + "&page=" + page;
	}
	
	@RequestMapping(value="/uploadFile", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<String>> uploadFile(MultipartFile[] files, HttpServletRequest request) {
		logger.info("파일 업로드");
		
		ResponseEntity<List<String>> entity = null;
		
		System.out.println(request.getSession().getServletContext().getRealPath("resources/uploads/boardProdQA"));
		System.out.println(request.getRealPath("resources/uploads/boardProdQA"));
		
		String path = request.getSession().getServletContext().getRealPath("resources/uploads/boardProdQA");
		
		List<String> saveFileNames = new ArrayList<String>();
		
		System.out.println(files);
		
		for(int i = 0; i < files.length; i++) {
			System.out.println("업로드 파일 이름 : " + files[i].getOriginalFilename());
			System.out.println("업로드 파일 사이즈 : " + files[i].getSize());
			System.out.println("업로드 파일의 타입 : " + files[i].getContentType()); // 파일의 MIME type (못 바꾸기 때문에 이미지인지 판별할때 사용)
			
			try {
				saveFileNames.add(FileUploadProdcess.uploadFile(path, files[i].getOriginalFilename(), files[i].getBytes()));
				entity = new ResponseEntity<List<String>>(saveFileNames, HttpStatus.OK);
			} catch (IOException e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		}
		
		System.out.println(saveFileNames.toString());
		return entity;
	}
	
	@ResponseBody // byte[]의 데이터(파일 데이터)가 web에 그대로 전송 되도록
	@RequestMapping("/displayFile")
	   public ResponseEntity<byte[]> displayFile(HttpServletRequest request, String fileName) throws IOException {
	      InputStream in = null;
	      ResponseEntity<byte[]> entity = null;
	      
	      try {
	         String ext = fileName.substring(fileName.lastIndexOf(".") + 1); // 확장자 추출
	         
	         MediaType mType = MediaConfirm.getMediaType(ext); // 이미지 파일인지 아닌지를 검사하기 위해
	         
	         HttpHeaders header = new HttpHeaders();
	         
	         
	         
	         String path = request.getSession().getServletContext().getRealPath("resources/uploads/boardProdQA");
//	         String uploadPath = path + "/2021/03/05";
	         fileName = fileName.replace('/', File.separatorChar);
	         logger.info(path + fileName);
	         System.out.println(path + fileName);
	         
	         in = new FileInputStream(path + fileName);
	         System.out.println(in);
	         
	         if (mType != null) {
	            header.setContentType(mType); 
	         } else {
	            fileName = fileName.substring(fileName.indexOf("_") + 1); // UUID_ 다음 originalFileName을 얻어옴
	            header.setContentType(MediaType.APPLICATION_OCTET_STREAM); // 다운로드 가능한 파일임
	            header.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\""); // 다운로드 될 수 있도록 일종의 링크 제공
	         }
	      
	      
	         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.CREATED); // 파일을 읽은 뒤 데이터를 그대로 전송
	      } catch (IOException e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	      } finally {
	         in.close();
	      }
	      
	      return entity;
	   }
	   
	   @RequestMapping(value="/deleteFile", method=RequestMethod.POST)
		public ResponseEntity<String> deleteFile(HttpServletRequest request, String fileName) {
			logger.info("삭제할 파일 : " + fileName);
			
			String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			String path = request.getSession().getServletContext().getRealPath("resources/uploads/boardProdQA");
			
			MediaType mType = MediaConfirm.getMediaType(ext);
			
			String tmp = fileName.replace("thumb_", "");
			String originalFile = path + tmp; // 삭제해야 할 오리지널 이미지 파일
			String thumbFile = path + fileName; // 삭제해야 할 썸네일 이미지 파일
			// *************우리의 OS가 windows이므로 아래 코드를 해줘야 함. (window는 File.seperator : \, linux : /) **************
			originalFile = originalFile.replace('/', File.separatorChar);
			thumbFile = thumbFile.replace('/', File.separatorChar);
			// **********************************************************************************************************************
			
			logger.info("삭제할 파일 (original) : " + originalFile + ", (thumb) : " + thumbFile);
			
			if(mType != null) {
				// 이미지 파일이면,
				// 삭제할 파일과 경로
				new File(originalFile).delete();
				new File(thumbFile).delete();
				
			}
			
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
	
	@RequestMapping(value="/prodQAModiForm", method=RequestMethod.GET)
	public String showModiProdQA(@RequestParam("no") int no, @RequestParam("prodId") int prodId, Model model) throws Exception {
		logger.info("QA 글 수정 페이지 소환");
		
		model.addAttribute("prodQA", QAService.prodQADetail(prodId, no));
		System.out.println(model);
		
		return "cambakMall/prodQAModiForm";
	}
	
	@RequestMapping(value="/prodQAModiForm", method=RequestMethod.POST)
	public String modiProdQA(@RequestParam("prodId") int prodId, @RequestParam("no") int no, @RequestParam("page") int page, ProdQAUpdateDTO updateQA, RedirectAttributes rttr) throws Exception {
		logger.info("QA 글 수정");
		
		updateQA.setProdQA_no(no);
		
		updateQA.setProduct_id(prodId);
		
		System.out.println(updateQA);
		
		if(updateQA.getProdQA_isSecret() != null) {
			updateQA.setProdQA_isSecret("Y");
		} else {
			updateQA.setProdQA_isSecret("N");
		}
		
		System.out.println(updateQA.toString());
		
		if(QAService.updateProdQA(updateQA)) {
			rttr.addAttribute("result", "success");
		}
		
		return "redirect:/mall/prodDetail/main?prodId=" + prodId + "&page=" + page;
	}
	
	@RequestMapping(value="/checkSecretPwd", method=RequestMethod.POST)
	public ResponseEntity<String> checkSecretPwd(@RequestBody ProdQAVO vo) throws Exception {
		logger.info("QA 글 삭제");
		
		System.out.println(vo.toString());
		ResponseEntity<String> entity = null;
		
		if(QAService.checkSecretPwd(vo.getProdQA_secretPassword(), vo.getProdQA_no())) {
			if(QAService.deleteProdQA(vo.getProdQA_no())) {
				entity = new ResponseEntity<String>("Success", HttpStatus.OK);
			}
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/updateViewCnt", method=RequestMethod.POST)
	public ResponseEntity<String> updateViewCnt(@RequestBody ProdQAVO vo) throws Exception {
		logger.info("QA 조회수 +1 ");
		
		System.out.println(vo.toString());
		ResponseEntity<String> entity = null;
		
		if(QAService.prodQAViewCnt(vo.getProdQA_no())) {
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/updateLikeCnt", method=RequestMethod.POST)
	public ResponseEntity<String> updateLikeCnt(@RequestBody ProdQAsLikeVO vo) throws Exception {
		logger.info("QA 좋아요 +1 ");
		
		System.out.println(vo.toString());
		ResponseEntity<String> entity = null;
		
		if(QAService.prodQAInsertLike(vo)) {
			if(QAService.prodQALikeCnt(vo.getProdQA_no())) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}			
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/deleteLike", method=RequestMethod.POST)
	public ResponseEntity<String> deleteLike(@RequestBody ProdQAsLikeVO vo) throws Exception {
		logger.info("QA 좋아요 -1 ");
		
		System.out.println(vo.toString());
		ResponseEntity<String> entity = null;
		
		if(QAService.prodQADeleteLike(vo)) {
			if(QAService.prodQALikeCnt(vo.getProdQA_no())) {
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			}			
		} else {
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}		
}
