package cn.com.ufgov.hainan.framework.action;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.PrincipalAware;
import org.apache.struts2.interceptor.PrincipalProxy;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.util.ServletContextAware;

import cn.com.ufgov.hainan.framework.business.Paging;
import cn.com.ufgov.hainan.framework.business.ResultType;
import cn.com.ufgov.hainan.framework.module.DojoDataGrid;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

/**
 * 模块活动类
 */
public abstract class ModuleAction implements ServletContextAware, ApplicationAware, SessionAware, ServletRequestAware, PrincipalAware, RequestAware, ParameterAware, ServletResponseAware, Preparable {
	/**
	 * 空白
	 */
	public static final String NONE = ActionSupport.NONE;
	/**
	 * 错误
	 */
	public static final String ERROR = ActionSupport.ERROR;
	/**
	 * 成功
	 */
	public static final String SUCCESS = ActionSupport.SUCCESS;
	/**
	 * 输入
	 */
	public static final String INPUT = ActionSupport.INPUT;
	/**
	 * 登录
	 */
	public static final String LOGIN = ActionSupport.LOGIN;
	/**
	 * 退出
	 */
	public static final String LOGOUT = "logout";
	/**
	 * 拒绝
	 */
	public static final String DENY = "deny";
	/**
	 * 数据
	 */
	public static final String JSON = "json";

	/**
	 * 网站根目录
	 */
	private static String websiteRoot;
	/**
	 * 网站标题
	 */
	private static String websiteTitle;

	public String getWebsiteRoot() {
		if (ModuleAction.websiteRoot == null) {
			String value = this.strutsServletContext.getContextPath();
			if (value.equals("/")) {
				ModuleAction.websiteRoot = "";
			} else {
				ModuleAction.websiteRoot = value;
			}
		}

		return ModuleAction.websiteRoot;
	}

	public String getWebsiteTitle() {
		if (ModuleAction.websiteTitle == null) {
			ModuleAction.websiteTitle = this.strutsApplication.get(InitializeListener.APPLICATION_WEBSITE_TITLE).toString();
		}

		return ModuleAction.websiteTitle;
	}

	public String getDojoStyle() {
		String result = "";

		result = this.strutsSession.get(InitializeListener.SESSION_DOJO_STYLE).toString();

		return result;
	}

	/**
	 * 上下文
	 */
	protected ServletContext strutsServletContext;
	/**
	 * 应用数据
	 */
	protected Map<String, Object> strutsApplication;
	/**
	 * 会话数据
	 */
	protected Map<String, Object> strutsSession;
	/**
	 * 请求
	 */
	protected HttpServletRequest strutsHttpServletRequest;
	/**
	 * 委托代理
	 */
	protected PrincipalProxy strutsPrincipalProxy;
	/**
	 * 请求数据
	 */
	protected Map<String, Object> strutsRequest;
	/**
	 * 参数数据
	 */
	protected Map<String, String[]> strutsParameters;
	/**
	 * 应答
	 */
	protected HttpServletResponse strutsHttpServletResponse;
	/**
	 * 分页器
	 */
	protected Paging paging;
	/**
	 * Dojo数据表格
	 */
	protected DojoDataGrid dojoDataGrid;
	protected String message;

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.strutsServletContext = servletContext;
	}

	@Override
	public void setApplication(Map<String, Object> application) {
		this.strutsApplication = application;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.strutsSession = session;
	}

	@Override
	public void setServletRequest(HttpServletRequest httpServletRequest) {
		this.strutsHttpServletRequest = httpServletRequest;
	}

	@Override
	public void setPrincipalProxy(PrincipalProxy principalProxy) {
		this.strutsPrincipalProxy = principalProxy;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.strutsRequest = request;
	}

	@Override
	public void setParameters(Map<String, String[]> parameters) {
		this.strutsParameters = parameters;
	}

	@Override
	public void setServletResponse(HttpServletResponse httpServletResponse) {
		this.strutsHttpServletResponse = httpServletResponse;
	}

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	public DojoDataGrid getDojoDataGrid() {
		return dojoDataGrid;
	}

	public void setDojoDataGrid(DojoDataGrid dojoDataGrid) {
		this.dojoDataGrid = dojoDataGrid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public void removeNullBooleanParameter(String key) {
		Object value = this.strutsParameters.get(key);
		if (value != null) {
			String[] values = (String[]) value;

			if ((values.length == 0) || (values[0].isEmpty())) {
				this.strutsParameters.remove(key);
			}
		}
	}

	public void processMessage(ResultType resultType) {
		switch (resultType) {
		case HAS_SAME:
			this.setMessage("存在相同的数据！");
			break;
		case HAS_REFERENCE:
			this.setMessage("存在被引用的数据！");
			break;
		case SUCCESS:
			this.setMessage("数据操作成功！");
			break;
		case FAIL:
			this.setMessage("数据操作失败！");
			break;
		}
	}
}
