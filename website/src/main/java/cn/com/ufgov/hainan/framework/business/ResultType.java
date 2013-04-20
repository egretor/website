package cn.com.ufgov.hainan.framework.business;

/**
 * 操作结果枚举
 */
public enum ResultType {
	/**
	 * 存在相同数据
	 */
	HAS_SAME,
	/**
	 * 存在数据被引用
	 */
	HAS_REFERENCE,
	/**
	 * 成功
	 */
	SUCCESS,
	/**
	 * 失败
	 */
	FAIL
}
