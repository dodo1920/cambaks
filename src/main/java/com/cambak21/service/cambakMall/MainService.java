package com.cambak21.service.cambakMall;

import java.util.List;

import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.mallMainTopCountDTO;
import com.cambak21.dto.mallMainTotalDTO;

public interface MainService {
	
	public List<mallMainTopCountDTO> getNewProduct4(int i) throws Exception;
	
	public List<mallMainTotalDTO> getTotalCount() throws Exception;
	
	public List<mallMainTopCountDTO> getTopReview() throws Exception;
	
	public List<mallMainTopCountDTO> getTopSelling() throws Exception;
	
	public List<mallMainTopCountDTO> countReviews() throws Exception;
	
	public int getStar(int id) throws Exception;
	
}
