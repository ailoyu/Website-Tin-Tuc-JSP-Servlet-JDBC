package service;

import java.util.List;

import model.CategoryModel;

public interface ICategoryService {
	List<CategoryModel> findAll();
	CategoryModel findOne(Long id);
}
