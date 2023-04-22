package service.impl;

import java.util.List;

import javax.inject.Inject;

import dao.ICategoryDAO;
import model.CategoryModel;
import service.ICategoryService;

public class CategoryService implements ICategoryService{
	
//	private ICategoryDAO categoryDAO;
//	
//	public CategoryService() {
//		categoryDAO = new CategoryDAO();
//		// .......
//	}
	
	@Inject
	private ICategoryDAO categoryDAO;
	
	@Override
	public List<CategoryModel> findAll() {
		// TODO Auto-generated method stub
		return categoryDAO.findAll();
	}

	@Override
	public CategoryModel findOne(Long id) {
		return categoryDAO.findOne(id);
	}

}
