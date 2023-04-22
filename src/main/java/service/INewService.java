package service;

import java.util.List;

import model.NewModel;
import paging.Pageble;

public interface INewService {
	List<NewModel> findByCategoryId(Long categoryId);
	NewModel save(NewModel newModel);
	NewModel update(NewModel updateNew);
	void delete(long[] ids);
	NewModel findOne(Long id);
	// offset là số index của đầu trang, limit: là tổng số item trong 1 page
	List<NewModel> findAll(Pageble pageble); 
	int getTotalItem();
	int countCategoryId(Long categoryId);
	int countNew(String newTitle);
}
