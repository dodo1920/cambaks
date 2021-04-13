package com.cambak21.service.cambakMall;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cambak21.domain.ProductsVO;
import com.cambak21.dto.mallMainTotalDTO;
import com.cambak21.persistence.cambakMall.MainDAO;



@Service
public class MainServiceImpl implements MainService {

	@Inject
	private MainDAO dao;
	
	
	@Override
	public List<ProductsVO> getNewProduct4(int i) throws Exception {
		
		return dao.getNewProduct4(i);
	}


	@Override
	public List<mallMainTotalDTO> getTotalCount() throws Exception {
		
		return dao.getTotalCount();
	}

}
