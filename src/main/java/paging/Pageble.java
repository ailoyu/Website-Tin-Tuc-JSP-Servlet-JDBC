package paging;

import sorting.Sorter;

public interface Pageble {
	
	Integer getPage();
	
	Integer getOffset();

	Integer getLimit();
	
	Sorter getSorter();
}
