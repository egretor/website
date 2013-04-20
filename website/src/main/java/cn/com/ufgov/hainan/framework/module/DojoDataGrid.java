package cn.com.ufgov.hainan.framework.module;

/**
 * Dojo数据表格
 */
public class DojoDataGrid {
	/**
	 * 标识符
	 */
	private String identifier;
	/**
	 * 项集合
	 */
	private Object items;

	public String getIdentifier() {
		return identifier;
	}

	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}

	public Object getItems() {
		return items;
	}

	public void setItems(Object items) {
		this.items = items;
	}
}
