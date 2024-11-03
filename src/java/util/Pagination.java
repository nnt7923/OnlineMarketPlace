
package util;

import java.util.List;

/**
 *
 * @author phamd
 */
public class Pagination {
    
    
    public static <T> List<T> getPaginatedList(List<T> fullList, int page, int itemsPerPage) {

        int fromIndex = Math.max((page - 1) * itemsPerPage, 0);
        

        int toIndex = Math.min(page * itemsPerPage, fullList.size());
        
  
        return fullList.subList(fromIndex, toIndex);
    }

    public static int calculateTotalPages(int totalItems, int itemsPerPage) {

        return (totalItems + itemsPerPage - 1) / itemsPerPage;
    }
}


