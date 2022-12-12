package DAO;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.apache.commons.lang3.RandomStringUtils;

public class JpaUtils<T> {

	private EntityManagerFactory entityManagerFactory;

	public JpaUtils() {
		String connectionString = "Web_DkDeTai";
		this.entityManagerFactory = Persistence.createEntityManagerFactory(connectionString);
	}
	public EntityManagerFactory getEntityManagerFactory() {
		return entityManagerFactory;
	}

	public EntityManager getEntityManager() {
		return entityManagerFactory.createEntityManager();
	}

	// create instance
	public T create(T entity) {
		EntityManager entityManager = this.entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.persist(entity);
		entityManager.getTransaction().commit();
		entityManager.close();
		return entity;
	}

	// Update
	public T update(T entity) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		entity = entityManager.merge(entity);
		entityManager.getTransaction().commit();
		entityManager.close();
		return entity;
	}

	// Delete
	public void delete(Class<T> type, Object id) {
		EntityManager entityManager = this.entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();
		Object reference = entityManager.getReference(type, id);
		entityManager.remove(reference);
		entityManager.getTransaction().commit();
		entityManager.close();
	}

	// Find
	public T find(Class<T> type, Object primaryKey) {
		EntityManager entityManager = this.entityManagerFactory.createEntityManager();
		T result = entityManager.find(type, primaryKey);
		entityManager.close();
		return result;
	}

	// Find all
	@SuppressWarnings("unchecked")
	public List<T> findAll(String queryString, Class<T> type) {
		EntityManager entityManager = this.entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryString, type);
		List<T> result = query.getResultList();
		entityManager.close();
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<T> findWithNamedQuery(String queryName, Map<String, Object> parameters) {
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		Set<Entry<String, Object>> setParameters = parameters.entrySet();
		for (Entry<String, Object> entry : setParameters) {
			query.setParameter(entry.getKey(), entry.getValue());
		}
		List<T> result = query.getResultList();
		entityManager.close();
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<T> pagination(String queryName, int currentPage, int pageSize) {

		EntityManager entityManager = entityManagerFactory.createEntityManager();
		Query query = entityManager.createNamedQuery(queryName);
		query.setFirstResult(currentPage).setMaxResults(pageSize * currentPage);

		List<T> result = query.getResultList();
		entityManager.close();
		return result;
	}

	public int count(String queryName) {

		EntityManager entityManager = entityManagerFactory.createEntityManager();
		entityManager.getTransaction().begin();

		int maxResults = ((Long) entityManager.createNamedQuery(queryName).getSingleResult()).intValue();

		entityManager.getTransaction().commit();
		entityManager.close();
		return maxResults;
	}
	
	public String randomId (String type) {
		String id = type + RandomStringUtils.randomNumeric(8);
		return id;
	}
}
