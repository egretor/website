package cn.com.ufgov.hainan.framework.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.HttpJspPage;

/**
 * 模块页面类
 */
public abstract class ModuleJsp implements HttpJspPage {

	private ServletConfig servletConfig;

	@Override
	public ServletConfig getServletConfig() {
		return this.servletConfig;
	}

	@Override
	public void init(ServletConfig servletConfig) throws ServletException {
		this.servletConfig = servletConfig;
		this.jspInit();
	}

	@Override
	public void destroy() {

	}

	@Override
	public String getServletInfo() {
		return null;
	}

	@Override
	public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
		HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
		PrintWriter printWriter = servletResponse.getWriter();

		Boolean permission = (Boolean) httpServletRequest.getAttribute(InitializeListener.REQUEST_PERMISSION);

		if (permission) {
			this._jspService(httpServletRequest, httpServletResponse);
		} else {
			printWriter.close();
		}
	}

	public void _jspInit() {

	}

	@Override
	public void jspInit() {
		this._jspInit();
	}

	public void _jspDestroy() {

	}

	@Override
	public void jspDestroy() {
		this._jspDestroy();
	}

	@Override
	public void _jspService(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws ServletException, IOException {

	}

}
