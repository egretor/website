package cn.com.ufgov.hainan.framework.business;

/**
 * 分页器类
 */
public class Paging {
	/**
	 * 最小页数
	 */
	public final static int MINIMUM_PAGE = 1;
	/**
	 * 每页最小行数
	 */
	public final static int MINIMUM_ROWS_PER_PAGE = 1;
	/**
	 * 每页最大行数
	 */
	public final static int MAXIMUM_ROWS_PER_PAGE = Integer.MAX_VALUE;

	/**
	 * 当前页
	 */
	private int currentPage = Paging.MINIMUM_PAGE;
	/**
	 * 每页行数
	 */
	private int rowsPerPage = Paging.MAXIMUM_ROWS_PER_PAGE;
	/**
	 * 总行数
	 */
	private int rowCount = 0;

	public int getCurrentPage() {
		return this.currentPage;
	}

	public void setCurrentPage(int currentPage) {
		if (currentPage >= Paging.MINIMUM_PAGE) {
			this.currentPage = currentPage;
		}
	}

	public int getRowsPerPage() {
		return this.rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		if ((rowsPerPage >= Paging.MINIMUM_ROWS_PER_PAGE) && (rowsPerPage <= Paging.MAXIMUM_ROWS_PER_PAGE)) {
			this.rowsPerPage = rowsPerPage;
		}
	}

	public int getRowCount() {
		return this.rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	/**
	 * 总页数
	 * 
	 * @return 总页数
	 */
	public int getPageCount() {
		int result = 1;

		result = this.rowCount / this.rowsPerPage;
		int remainder = this.rowCount % this.rowsPerPage;
		if (remainder > 0) {
			result++;
		}

		return result;
	}

	/**
	 * 第一条记录
	 * 
	 * @return 第一条记录
	 */
	public int getFirstResult() {
		int result = 0;

		result = (this.currentPage - 1) * this.rowsPerPage;

		return result;
	}

	/**
	 * 最后一条记录
	 * 
	 * @return 最后一条记录
	 */
	public int getLastResult() {
		int result = 0;

		result = this.currentPage * this.rowsPerPage;

		return result;
	}
}
