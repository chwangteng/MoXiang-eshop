package com.wt.po;

import java.util.List;
import java.util.Set;
import org.hibernate.LockOptions;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import static org.hibernate.criterion.Example.create;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.annotation.Transactional;

/**
 * A data access object (DAO) providing persistence and search support for
 * Orderstate entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.wt.po.Orderstate
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class OrderstateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(OrderstateDAO.class);
	// property constants
	public static final String ORDERSTATENAME = "orderstatename";

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	protected void initDao() {
		// do nothing
	}

	public void save(Orderstate transientInstance) {
		log.debug("saving Orderstate instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Orderstate persistentInstance) {
		log.debug("deleting Orderstate instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Orderstate findById(java.lang.Integer id) {
		log.debug("getting Orderstate instance with id: " + id);
		try {
			Orderstate instance = (Orderstate) getCurrentSession().get(
					"com.wt.po.Orderstate", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Orderstate> findByExample(Orderstate instance) {
		log.debug("finding Orderstate instance by example");
		try {
			List<Orderstate> results = (List<Orderstate>) getCurrentSession()
					.createCriteria("com.wt.po.Orderstate")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Orderstate instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Orderstate as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Orderstate> findByOrderstatename(Object orderstatename) {
		return findByProperty(ORDERSTATENAME, orderstatename);
	}

	public List findAll() {
		log.debug("finding all Orderstate instances");
		try {
			String queryString = "from Orderstate";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Orderstate merge(Orderstate detachedInstance) {
		log.debug("merging Orderstate instance");
		try {
			Orderstate result = (Orderstate) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Orderstate instance) {
		log.debug("attaching dirty Orderstate instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Orderstate instance) {
		log.debug("attaching clean Orderstate instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static OrderstateDAO getFromApplicationContext(ApplicationContext ctx) {
		return (OrderstateDAO) ctx.getBean("OrderstateDAO");
	}
}