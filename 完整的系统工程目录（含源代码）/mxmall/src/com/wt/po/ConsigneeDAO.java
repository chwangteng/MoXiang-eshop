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
 * Consignee entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.wt.po.Consignee
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class ConsigneeDAO {
	private static final Logger log = LoggerFactory
			.getLogger(ConsigneeDAO.class);
	// property constants
	public static final String CONSIGNEENAME = "consigneename";
	public static final String CONSIGNEEADDRESS = "consigneeaddress";
	public static final String CONSIGNEEPHONE = "consigneephone";

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

	public void save(Consignee transientInstance) {
		log.debug("saving Consignee instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Consignee persistentInstance) {
		log.debug("deleting Consignee instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Consignee findById(java.lang.Integer id) {
		log.debug("getting Consignee instance with id: " + id);
		try {
			Consignee instance = (Consignee) getCurrentSession().get(
					"com.wt.po.Consignee", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Consignee> findByExample(Consignee instance) {
		log.debug("finding Consignee instance by example");
		try {
			List<Consignee> results = (List<Consignee>) getCurrentSession()
					.createCriteria("com.wt.po.Consignee")
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
		log.debug("finding Consignee instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Consignee as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Consignee> findByConsigneename(Object consigneename) {
		return findByProperty(CONSIGNEENAME, consigneename);
	}

	public List<Consignee> findByConsigneeaddress(Object consigneeaddress) {
		return findByProperty(CONSIGNEEADDRESS, consigneeaddress);
	}

	public List<Consignee> findByConsigneephone(Object consigneephone) {
		return findByProperty(CONSIGNEEPHONE, consigneephone);
	}

	public List findAll() {
		log.debug("finding all Consignee instances");
		try {
			String queryString = "from Consignee";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Consignee merge(Consignee detachedInstance) {
		log.debug("merging Consignee instance");
		try {
			Consignee result = (Consignee) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Consignee instance) {
		log.debug("attaching dirty Consignee instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Consignee instance) {
		log.debug("attaching clean Consignee instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static ConsigneeDAO getFromApplicationContext(ApplicationContext ctx) {
		return (ConsigneeDAO) ctx.getBean("ConsigneeDAO");
	}
}