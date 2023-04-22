package dao.impl;

import java.util.List;

import dao.ICategoryDAO;
import mapper.CategoryMapper;
import mapper.NewMapper;
import model.CategoryModel;
import model.NewModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO{
	
	@Override
	public List<CategoryModel> findAll() {
		String sql = "Select * from category";
		return query(sql, new CategoryMapper());
	}

	@Override
	public CategoryModel findOne(Long id) {
		String sql = "Select * from category where id = ?";
		List<CategoryModel> category = query(sql, new CategoryMapper(), id);
		
		// Lấy vị trí thứ 0 (đầu ti�?n) trong list
		return category.isEmpty() ? null : category.get(0);
	}

	@Override
	public CategoryModel findOneByCode(String code) {
		String sql = "Select * from category where code = ?";
		List<CategoryModel> category = query(sql, new CategoryMapper(), code);
		
		// Lấy vị trí thứ 0 (đầu ti�?n) trong list
		return category.isEmpty() ? null : category.get(0);
	}
	
}
