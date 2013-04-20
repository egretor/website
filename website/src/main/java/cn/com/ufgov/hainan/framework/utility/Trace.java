package cn.com.ufgov.hainan.framework.utility;

import org.apache.log4j.Logger;

/**
 * 跟踪类
 */
public class Trace {
	/**
	 * 日志器
	 * 
	 * @return 日志器
	 */
	public static final Logger getLogger() {
		return Logger.getLogger(Trace.class);
	}
}
