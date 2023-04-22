package service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import dao.ICategoryDAO;
import dao.INewDAO;
import model.CategoryModel;
import model.NewModel;
import paging.Pageble;
import service.INewService;

public class NewService implements INewService{
	
	@Inject
	private INewDAO newDao;
	
	@Inject
	private ICategoryDAO categoryDao;

	@Override
	public List<NewModel> findByCategoryId(Long categoryId) {
		return newDao.findByCategoryId(categoryId);
	}

	@Override
	public NewModel save(NewModel newModel) {
		// Giữ lại các giá trị ko bh đổi
		newModel.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		CategoryModel category = categoryDao.findOneByCode(newModel.getCategoryCode());
		newModel.setCategoryId(category.getId());
		
		Long newId = newDao.save(newModel);
		return newDao.findOne(newId);
	}

	@Override
	public NewModel update(NewModel updateNew) {
		NewModel oldNew = newDao.findOne(updateNew.getId());
		// Giữ lại các giá trị ko bh đổi
		updateNew.setCreatedDate(oldNew.getCreatedDate());
		updateNew.setCreatedBy(oldNew.getCreatedBy());
		updateNew.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		CategoryModel category = categoryDao.findOneByCode(updateNew.getCategoryCode());
		updateNew.setCategoryId(category.getId());
		newDao.update(updateNew);
		return newDao.findOne(updateNew.getId());
	}

	@Override
	public void delete(long[] ids) {
		for(long id : ids) {
			// trước khi xóa bài viết phải xóa comment trong bài viết
			
			// 1. xóa comment (khóa ngoại new_id) 
			
			// 2. xóa bài viết
			newDao.delete(id);
		}
	}

	@Override
	public List<NewModel> findAll(Pageble pageble) {
		return newDao.findAll(pageble);
	}

	@Override
	public int getTotalItem() {
		return newDao.getTotalItem();
	}

	@Override
	public NewModel findOne(Long id) {
		NewModel newModel = newDao.findOne(id);
		
		CategoryModel categoryModel = categoryDao.findOne(newModel.getCategoryId());
		// Lấy code của category -> sử dụng code để binding  
		newModel.setCategoryCode(categoryModel.getCode());
		
		return newModel;
	}

	@Override
	public int countCategoryId(Long categoryId) {
		// TODO Auto-generated method stub
		return newDao.countCategoryId(categoryId);
	}

	@Override
	public int countNew(String newTitle) {
		return newDao.countNew(newTitle);
	}
	
	

}
