package dao;

import java.util.List;

import model.NewModel;
import paging.Pageble;

public interface INewDAO extends GenericDAO<NewModel> {
	
	NewModel findOne(Long id);
	
	// offset là số index của đầu trang, limit: là tổng số item trong 1 page
	List<NewModel> findAll(Pageble pageble);
	
	List<NewModel> findByCategoryId(Long categoryId);
	
	Long save(NewModel newModel);
	
	void update(NewModel newModel);
	
	void delete(long id);
	
	int getTotalItem();
	
	int countCategoryId(Long categoryId);
	
	int countNew(String newTitle);
}
