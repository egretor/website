package cn.com.ufgov.hainan.framework.utility;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.dispatcher.Dispatcher;

import com.opensymphony.xwork2.config.Configuration;
import com.opensymphony.xwork2.config.ConfigurationManager;
import com.opensymphony.xwork2.config.RuntimeConfiguration;
import com.opensymphony.xwork2.config.entities.ActionConfig;

import cn.com.ufgov.hainan.framework.module.ActionConfiguration;

/**
 * 活动类
 */
public class Action {
	/**
	 * 活动配置集合
	 */
	private static List<ActionConfiguration> actionConfigurations;

	public static final List<ActionConfiguration> getActionConfigurations() {
		if (Action.actionConfigurations == null) {
			Action.actionConfigurations = new ArrayList<ActionConfiguration>();

			Dispatcher dispatcher = Dispatcher.getInstance();
			ConfigurationManager configurationManager = dispatcher.getConfigurationManager();
			Configuration configuration = configurationManager.getConfiguration();
			RuntimeConfiguration runtimeConfiguration = configuration.getRuntimeConfiguration();
			Map<String, Map<String, ActionConfig>> actionMap = runtimeConfiguration.getActionConfigs();

			if (actionMap != null) {
				Set<String> actionSet = actionMap.keySet();
				if (actionSet != null) {
					Iterator<String> actionIterator = actionSet.iterator();
					while (actionIterator.hasNext()) {
						String actionKey = actionIterator.next();
						Map<String, ActionConfig> actionConfigMap = actionMap.get(actionKey);
						if (actionConfigMap != null) {
							Set<String> actionConfigSet = actionConfigMap.keySet();
							if (actionConfigSet != null) {
								Iterator<String> actionConfigIterator = actionConfigSet.iterator();
								while (actionConfigIterator.hasNext()) {
									String actionConfigKey = actionConfigIterator.next();
									ActionConfig actionConfig = actionConfigMap.get(actionConfigKey);
									ActionConfiguration actionConfiguration = new ActionConfiguration(actionConfig);

									String packageName = actionConfiguration.getPackageName();
									String namespace = configuration.getPackageConfig(packageName).getNamespace();

									List<String> executes = new ArrayList<String>();
									Class<?> clazz;
									try {
										clazz = Class.forName(actionConfiguration.getClassName());
										Method[] methods = clazz.getDeclaredMethods();
										if (methods != null) {
											for (Method method : methods) {
												String returnType = method.getReturnType().getName();
												String methodName = method.getName();
												if (returnType.equals(String.class.getName())) {
													if (methodName.indexOf(ActionConfiguration.ACTION_EXECUTE_PREFIX) == 0) {
														executes.add(methodName);
													}
												}
											}
										}
									} catch (ClassNotFoundException e) {
										Trace.getLogger().error(e);
									}

									actionConfiguration.setNamespace(namespace);
									actionConfiguration.setExecutes(executes);

									Action.actionConfigurations.add(actionConfiguration);
								}
							}
						}
					}
				}
			}
		}

		return Action.actionConfigurations;
	}
}
