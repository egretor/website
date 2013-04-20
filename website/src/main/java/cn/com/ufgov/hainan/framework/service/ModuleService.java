package cn.com.ufgov.hainan.framework.service;

import java.util.List;

import cn.com.ufgov.hainan.framework.business.Paging;
import cn.com.ufgov.hainan.framework.business.ResultType;

/**
 * 模块服务接口
 * 
 * @param <T>
 *            模块类
 */
public interface ModuleService<T> {
	/**
	 * 查询
	 * 
	 * @param hql
	 *            HQL语句
	 * @param parameters
	 *            参数
	 * @return 模块数据集合
	 */
	List<T> select(String hql, Object... parameters);

	/**
	 * 查询
	 * 
	 * @param paging
	 *            分页器
	 * @param hql
	 *            HQL语句
	 * @param parameters
	 *            参数
	 * @return 模块数据集合
	 */
	List<T> select(Paging paging, String hql, Object... parameters);

	/**
	 * 查询
	 * 
	 * @return 模块数据集合
	 */
	List<T> select();

	/**
	 * 查询
	 * 
	 * @param uuid
	 *            主键
	 * @return 模块数据
	 */
	T select(String uuid);

	/**
	 * 新增
	 * 
	 * @param value
	 *            模块数据
	 * @return 操作结果
	 */
	ResultType insert(T value);

	/**
	 * 修改
	 * 
	 * @param value
	 *            模块数据
	 * @return 操作结果
	 */
	ResultType update(T value);

	/**
	 * 保存
	 * 
	 * @param value
	 *            模块数据
	 * @return 操作结果
	 */
	ResultType storage(T value);

	/**
	 * 删除
	 * 
	 * @param value
	 *            模块数据
	 * @param cascade
	 *            级联操作
	 * @return 操作结果
	 */
	ResultType delete(T value, boolean cascade);

	/**
	 * 删除
	 * 
	 * @param value
	 *            模块数据
	 * @return 操作结果
	 */
	ResultType delete(T value);

	/**
	 * 是否存在相同数据
	 * 
	 * @param value
	 *            模块数据
	 * @return 结果
	 */
	boolean hasSame(T value);

	/**
	 * 是否数据被引用
	 * 
	 * @param value
	 *            模块数据
	 * @return 结果
	 */
	boolean hasReference(T value);

	/**
	 * 删除被引用数据
	 * 
	 * @param value
	 *            模块数据
	 * @return 结果
	 */
	boolean deleteReference(T value);
}
