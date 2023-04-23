package com.serverside.model.sessionbean;

import com.serverside.model.entity.Order;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.List;

@Stateless
public class OrderSessionBean implements OrderSessionBeanLocal{

    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;

    public List<Order> getAllOrder() throws EJBException {
        return em.createNamedQuery("Order.findAll").getResultList();
    }

    public Order findOrder(int id) throws EJBException {
        Query q = em.createNamedQuery("Order.findbyId");
        q.setParameter("id", id);
        return (Order) q.getSingleResult();
    }

    public List<Order> readOrder(int currentPage, int recordsPerPage, String keyword) throws EJBException {
        Query q = null;
        int start =0;

        if(keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.orders order by ordernumber ", Order.class);
            start = currentPage * recordsPerPage - recordsPerPage;
        } else{
            q = em.createNativeQuery("SELECT * from classicmodels.orders WHERE concat(ordernumber,orderdate,status,customernumber) LIKE ? order by ordernumber",Order.class);
                    start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
        List<Order> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    public int getNumberOfRows(String keyword) throws EJBException {
        Query q = null;
        if(keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.orders");
        }else{
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.orders WHERE concat(ordernumber,orderdate,status,customernumber) LIKE ? ");
            q.setParameter(1,"%" + keyword + "%");
        }
        BigInteger results = (BigInteger) q.getSingleResult();
        int i = results.intValue();
        return i;
    }


    public void updateOrder(String[] s) throws EJBException {

        Order o = findOrder(Integer.parseInt(s[0]));

        o.setCustomernumber(Integer.parseInt(s[1]));
        o.setOrderdate(s[2]);
        o.setRequireddate(s[3]);
        o.setShippeddate(s[4]);
        o.setStatus(s[5]);
        o.setComments(s[6]);
        em.merge(o);

    }

    @Override
    public void deleteOrder(int id) throws EJBException {

        Order od = findOrder(Integer.parseInt(String.valueOf(id)));
        em.remove(od);

    }

    @Override
    public void addOrder(String[] s) throws EJBException {

        Order od = new Order();

        od.setCustomernumber(Integer.parseInt(s[1]));
        od.setOrderdate(s[2]);
        od.setRequireddate(s[3]);
        od.setShippeddate(s[4]);
        od.setStatus(s[5]);
        od.setComments(s[6]);
        em.persist(od);

    }
}

