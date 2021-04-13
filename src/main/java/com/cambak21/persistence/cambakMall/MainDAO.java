package com.cambak21.persistence.cambakMall;

import java.util.List;

import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.mallMainTotalDTO;

public interface MainDAO {
	
		public List<ProductsVO> getNewProduct4(int i) throws Exception;
	
		public List<mallMainTotalDTO> getTotalCount() throws Exception;
	}
