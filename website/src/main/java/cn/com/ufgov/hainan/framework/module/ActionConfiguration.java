package cn.com.ufgov.hainan.framework.module;

import java.util.List;

import com.opensymphony.xwork2.config.entities.ActionConfig;

/**
 * 活动配置
 */
public class ActionConfiguration extends ActionConfig {
	public static final String ACTION_EXECUTE_PREFIX = "execute";

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 命名空间
	 */
	private String namespace;
	/**
	 * 执行集合
	 */
	private List<String> executes;

	public String getNamespace() {
		return namespace;
	}

	public void setNamespace(String namespace) {
		this.namespace = namespace;
	}

	public List<String> getExecutes() {
		return executes;
	}

	public void setExecutes(List<String> executes) {
		this.executes = executes;
	}

	public ActionConfiguration(ActionConfig actionConfig) {
		super(actionConfig);
	}

	public ActionConfiguration(String packageName, String name, String className) {
		super(packageName, name, className);
	}
}
