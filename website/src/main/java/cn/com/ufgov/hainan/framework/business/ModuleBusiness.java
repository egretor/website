package cn.com.ufgov.hainan.framework.business;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collections;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.hql.ast.QueryTranslatorImpl;
import org.hibernate.impl.SessionFactoryImpl;

import cn.com.ufgov.hainan.framework.service.ModuleService;
import cn.com.ufgov.hainan.framework.utility.Trace;

/**
 * 模块业务抽象类
 * 
 * @param <T>
 *            模块类
 */
public abstract class ModuleBusiness<T> implements ModuleService<T> {
	/**
	 * 会话工厂
	 */
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return this.sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/**
	 * 泛型类
	 * 
	 * @return 泛型类
	 */
	protected Class<?> getGenerics() {
		Class<?> result = null;
		Type type = this.getClass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			ParameterizedType parameterizedType = (ParameterizedType) type;
			Type[] types = parameterizedType.getActualTypeArguments();
			if (types != null) {
				result = (Class<?>) types[0];
			}
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> select(String hql, Object... parameters) {
		List<T> results = null;

		Session session = this.sessionFactory.openSession();
		Query query = session.createQuery(hql);

		if (parameters != null) {
			int position = 0;
			for (Object parameter : parameters) {
				query.setParameter(position, parameter);
				position++;
			}
		}

		results = query.list();

		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> select(Paging paging, String hql, Object... parameters) {
		List<T> results = null;

		Session session = this.sessionFactory.openSession();

		SessionFactoryImpl sessionFactoryImpl = (SessionFactoryImpl) this.sessionFactory;
		QueryTranslatorImpl queryTranslator = new QueryTranslatorImpl(hql, hql, Collections.EMPTY_MAP, sessionFactoryImpl);
		queryTranslator.compile(Collections.EMPTY_MAP, false);
		StringBuilder countSqlBuilder = new StringBuilder();
		countSqlBuilder.append("select count(*) from ( ");
		countSqlBuilder.append(queryTranslator.getSQLString());
		countSqlBuilder.append(" )");
		String countSql = countSqlBuilder.toString();

		SQLQuery sqlQuery = session.createSQLQuery(countSql);
		Query query = session.createQuery(hql);

		if (parameters != null) {
			int position = 0;
			for (Object parameter : parameters) {
				sqlQuery.setParameter(position, parameter);
				query.setParameter(position, parameter);
				position++;
			}
		}

		Object value = sqlQuery.uniqueResult();
		if (value != null) {
			int count = Integer.parseInt(value.toString());
			paging.setRowCount(count);
		}

		query.setFirstResult(paging.getFirstResult());
		query.setMaxResults(paging.getLastResult());

		results = query.list();

		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> select() {
		List<T> results = null;

		Session session = this.sessionFactory.openSession();

		Class<?> type = this.getGenerics();
		Criteria criteria = session.createCriteria(type);
		results = criteria.list();

		return results;
	}

	@SuppressWarnings("unchecked")
	@Override
	public T select(String uuid) {
		T result = null;

		Session session = this.sessionFactory.openSession();

		Class<?> type = this.getGenerics();
		result = (T) session.load(type, uuid);

		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ResultType insert(T value) {
		ResultType result = ResultType.FAIL;

		boolean interrupt = this.hasSame(value);

		if (interrupt) {
			result = ResultType.HAS_SAME;
		} else {
			Session session = this.sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				transaction.begin();
				value = (T) session.save(value);
				result = ResultType.SUCCESS;
			} catch (HibernateException e) {
				Trace.getLogger().error(e);
				transaction.rollback();
			} finally {
				transaction.commit();
			}
		}

		return result;
	}

	@Override
	public ResultType update(T value) {
		ResultType result = ResultType.FAIL;

		boolean interrupt = this.hasSame(value);

		if (interrupt) {
			result = ResultType.HAS_SAME;
		} else {
			Session session = this.sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				transaction.begin();
				session.update(value);
				result = ResultType.SUCCESS;
			} catch (HibernateException e) {
				Trace.getLogger().error(e);
				transaction.rollback();
			} finally {
				transaction.commit();
			}
		}

		return result;
	}

	@Override
	public ResultType storage(T value) {
		ResultType result = ResultType.FAIL;

		boolean interrupt = this.hasSame(value);

		if (interrupt) {
			result = ResultType.HAS_SAME;
		} else {
			Session session = this.sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				transaction.begin();
				session.saveOrUpdate(value);
				result = ResultType.SUCCESS;
			} catch (HibernateException e) {
				Trace.getLogger().error(e);
				transaction.rollback();
			} finally {
				transaction.commit();
			}
		}

		return result;
	}

	@Override
	public ResultType delete(String uuid, boolean cascade) {
		ResultType result = ResultType.FAIL;

		boolean interrupt = true;
		boolean hasReference = this.hasReference(uuid);

		if (hasReference) {
			result = ResultType.HAS_REFERENCE;
			if (cascade) {
				interrupt = !this.deleteReference(uuid);
			}
		} else {
			interrupt = false;
		}

		if (!interrupt) {
			Session session = this.sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				transaction.begin();
				Class<?> type = this.getGenerics();
				Object value = session.load(type, uuid);
				session.delete(value);
				result = ResultType.SUCCESS;
			} catch (HibernateException e) {
				Trace.getLogger().error(e);
				transaction.rollback();
			} finally {
				transaction.commit();
			}
		}

		return result;
	}

	@Override
	public ResultType delete(String uuid) {
		return this.delete(uuid, false);
	}
}
