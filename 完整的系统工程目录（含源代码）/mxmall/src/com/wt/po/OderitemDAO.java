package com.wt.po;

import java.util.List;
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
 * Oderitem entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.wt.po.Oderitem
 * @author MyEclipse Persistence Tools
 */
@Transactional
public class OderitemDAO {
	private static final Logger log = LoggerFactory
			.getLogger(OderitemDAO.class);
	// property constants
	public static final String ODERITEMQUANTITY = "oderitemquantity";
	public static final String ORDERITEMPRICE = "orderitemprice";

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

	public void save(Oderitem transientInstance) {
		log.debug("saving Oderitem instance");
		try {
			getCurrentSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Oderitem persistentInstance) {
		log.debug("deleting Oderitem instance");
		try {
			getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Oderitem findById(java.lang.Integer id) {
		log.debug("getting Oderitem instance with id: " + id);
		try {
			Oderitem instance = (Oderitem) getCurrentSession().get(
					"com.wt.po.Oderitem", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Oderitem> findByExample(Oderitem instance) {
		log.debug("finding Oderitem instance by example");
		try {
			List<Oderitem> results = (List<Oderitem>) getCurrentSession()
					.createCriteria("com.wt.po.Oderitem").add(create(instance))
					.list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding Oderitem instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from Oderitem as model where model."
					+ propertyName + "= ?";
			Query queryObject = getCurrentSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List<Oderitem> findByOderitemquantity(Object oderitemquantity) {
		return findByProperty(ODERITEMQUANTITY, oderitemquantity);
	}

	public List<Oderitem> findByOrderitemprice(Object orderitemprice) {
		return findByProperty(ORDERITEMPRICE, orderitemprice);
	}

	public List findAll() {
		log.debug("finding all Oderitem instances");
		try {
			String queryString = "from Oderitem";
			Query queryObject = getCurrentSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public Oderitem merge(Oderitem detachedInstance) {
		log.debug("merging Oderitem instance");
		try {
			Oderitem result = (Oderitem) getCurrentSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(Oderitem instance) {
		log.debug("attaching dirty Oderitem instance");
		try {
			getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Oderitem instance) {
		log.debug("attaching clean Oderitem instance");
		try {
			getCurrentSession().buildLockRequest(LockOptions.NONE).lock(
					instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public static OderitemDAO getFromApplicationContext(ApplicationContext ctx) {
		return (OderitemDAO) ctx.getBean("OderitemDAO");
	}
}