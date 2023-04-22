package dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import dao.INewDAO;
import mapper.NewMapper;
import model.NewModel;
import paging.Pageble;
import sorting.Sorter;

public class NewDAO extends AbstractDAO<NewModel> implements INewDAO{
	
	
	@Override
	public List<NewModel> findByCategoryId(Long categoryId) {
		String sql = "Select * from news where categoryid = ?";
		return query(sql, new NewMapper(), categoryId);
	}

	@Override
	public Long save(NewModel newModel) {
//		String sql = "Insert into news (title, content, categoryid) values (?,?,?)";
		
		// Dùng StringBuilder để không tốn quá nhìu vùng nhớ
		StringBuilder sql = new StringBuilder("Insert into news (title, content, ");
		sql.append("thumbnail, shortdescription, categoryid, createddate, createdby)");
		sql.append(" values (?,?,?,?,?,?,?)");
		return insert(sql.toString(), newModel.getTitle(), newModel.getContent(), 
				newModel.getThumbnail(), newModel.getShortDescription(), newModel.getCategoryId(),
				newModel.getCreatedDate(), newModel.getCreatedBy());
	}
	
	@Override
	public void update(NewModel updateNew) {
		StringBuilder sql = new StringBuilder("UPDATE news SET title = ?, thumbnail = ?,");
		sql.append(" shortdescription = ?, content = ?, categoryid = ?,");
		sql.append(" createddate = ?, createdby = ?, modifieddate = ?, modifiedby = ? WHERE id = ?");
		update(sql.toString(), updateNew.getTitle(), updateNew.getThumbnail(), updateNew.getShortDescription(),
				updateNew.getContent(), updateNew.getCategoryId(), updateNew.getCreatedDate(), 
				updateNew.getCreatedBy(), updateNew.getModifiedDate(), 
				updateNew.getModifiedBy(), updateNew.getId());
	}

	@Override
	public void delete(long id) {
		String sql1 = "delete from news where id = ?";
		update(sql1, id);
	}

	@Override
	public NewModel findOne(Long id) {
		String sql = "Select n.*, c.name from news n inner join category c on n.categoryid = c.id where n.id = ?";
//		String sql =  "Select * from news";
		List<NewModel> news = query(sql, new NewMapper(), id);
		
		// Lấy vị trí thứ 0 (đầu ti�?n) trong list
		return news.isEmpty() ? null : news.get(0);
	}

	@Override
	public List<NewModel> findAll(Pageble pageble) {
		// offset là số index của đầu trang, limit: là tổng số item trong 1 page
		
		StringBuilder sql = new StringBuilder();
		
		Sorter sorter = pageble.getSorter();
		String sortName = sorter.getSortName();
		String sortBy = sorter.getSortBy();
		Long sortCategoryId = sorter.getSortCategoryId();
		
		Integer offset = pageble.getOffset();
		Integer limit = pageble.getLimit();
		
		// hàm isNotBlank -> check null & ""
		if(sorter != null && sorter.getSortCategoryId() != null && !StringUtils.isNotBlank(sorter.getSortName()) && !StringUtils.isNotBlank(sorter.getSortBy())) {
			sql.setLength(0);
//			load data trang thể loại chi tiết
			sql.append("select * from news where categoryid = "+sortCategoryId);
		}else if(sorter != null && sorter.getSortCategoryId() != null && StringUtils.isNotBlank(sorter.getSortName()) && StringUtils.isNotBlank(sorter.getSortBy())) {
			sql.setLength(0);
//			load data trang thể loại chi tiết
			sql.append("select * from newservlet12month2018.news n where categoryId = "+ sorter.getSortCategoryId() +" order by "+sortName+" "+sortBy);
		}else if(sorter != null && StringUtils.isNotBlank(sorter.getSortName()) && StringUtils.isNotBlank(sorter.getSortBy())) { 
			sql.setLength(0);
//			load data trang list của admin
			sql.append("select n.*, c.name from newservlet12month2018.news n INNER JOIN category c ON n.categoryid = c.id order by "+sortName+" "+sortBy);
		}else {
			sql.setLength(0);
			System.out.println("load data trang chủ");
			sql.append("select * from news");
		}
		
		if(offset != null && limit != null) { // check nếu null thì ko setParameter
			sql.append(" limit "+offset+", "+limit); 
		}
		System.out.println(sql.toString());
		return query(sql.toString(), new NewMapper());
		
	}

	@Override
	public int getTotalItem() {
		String sql = "select count(*) from news";
		return count(sql);
	}

	@Override
	public int countCategoryId(Long categoryId) {
		String sql = "SELECT COUNT(*) FROM news where categoryid = " + categoryId;
		return count(sql);
	}

	@Override
	public int countNew(String newTitle) {
		String sql = "Select count(*) from news where title like '%" + newTitle + "%'";
		return count(sql);
	}
	
	
}
