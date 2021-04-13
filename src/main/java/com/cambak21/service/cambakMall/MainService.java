package com.cambak21.service.cambakMall;

import java.util.List;

import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.mallMainTotalDTO;

public interface MainService {
	
	public List<ProductsVO> getNewProduct4(int i) throws Exception;
	
	public List<mallMainTotalDTO> getTotalCount() throws Exception;
	
}
