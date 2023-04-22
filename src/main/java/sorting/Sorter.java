package sorting;

public class Sorter {
	
	private String sortName;
	private String sortBy;
	private Long sortCategoryId;
	
	public Sorter(String sortName, String sortBy, Long sortCategoryId) {
		this.setSortName(sortName);
		this.setSortBy(sortBy);
		this.setSortCategoryId(sortCategoryId);
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public String getSortBy() {
		return sortBy;
	}

	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}

	public Long getSortCategoryId() {
		return sortCategoryId;
	}

	public void setSortCategoryId(Long sortCategoryId) {
		this.sortCategoryId = sortCategoryId;
	}
	
}
