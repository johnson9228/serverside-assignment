package com.serverside.model.sessionbean;


import com.serverside.model.entity.Order;
import com.serverside.model.entity.Orderdetail;
import com.serverside.model.entity.OrderdetailId;
import com.serverside.model.entity.Product;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;

@Stateless
public class OrderDetailsSessionBean implements OrderDetailsSessionBeanLocal{

    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;

    @Override
    public List<Orderdetail> getAllOrderDetails() throws EJBException {
        return em.createNamedQuery("Orderdetail.findAll").getResultList();
    }

    public Orderdetail findOrderDetails(int id, String prcd) throws EJBException {

        Query q = em.createNamedQuery("Orderdetail.findbyId");
        q.setParameter("id",id);
        q.setParameter("ID", prcd);
        return (Orderdetail) q.getSingleResult();
    }

    @Override
    public Order findOrder(int id) throws EJBException {
        Query q = em.createNamedQuery("Order.findbyId");
        q.setParameter("id",id);
        return (Order) q.getSingleResult();
    }

    @Override
    public Product findProduct(String id) throws EJBException {
        Query q = em.createNamedQuery("Product.findbyId");
        q.setParameter("id", id);
        return (Product) q.getSingleResult();
    }

    @Override
    public List<Orderdetail> readOrderDetails(int currentPage, int recordsPerPage) throws EJBException {
        Query q = null;
        q = em.createNativeQuery("SELECT * FROM classicmodels.orderdetails order by ordernumber", Orderdetail.class);
        int start = currentPage * recordsPerPage - recordsPerPage;
        List<Orderdetail> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public int getNumberOfRows() throws EJBException {
        Query q = null;
        q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.orderdetails");
        BigInteger results = (BigInteger) q.getSingleResult();
        int i = results.intValue();
        return i;
    }

    @Override
    public void updateOrderDetails(String[] s) throws EJBException {

        Orderdetail od = findOrderDetails(Integer.parseInt(s[0]),s[1]);
        Order o = findOrder(Integer.parseInt(s[0]));

        Product prcd = findProduct(s[1]);
        od.setOrdernumber(o);
        od.setProductcode(prcd);
        od.setQuantityordered(Integer.parseInt(s[2]));
        od.setPriceeach(Double.parseDouble(s[3]));
        od.setOrderlinenumber(Integer.parseInt(s[4]));
        em.merge(od);


    }

    @Override
    public void deleteOrderDetails(int id, String ID) throws EJBException {
        Orderdetail ed = findOrderDetails(id, ID);
        em.remove(ed);

    }

    @Override
    public void addOrderDetails(String[] s) throws EJBException {

        try{
            Orderdetail od = new Orderdetail();
            OrderdetailId odid = new OrderdetailId();
            odid.setOrdernumber((Integer.valueOf(s[0])));
            odid.setProductcode(s[1]);

            od.setId(odid);

            Order order = findOrder(Integer.parseInt(s[0]));
            od.setOrdernumber(order);

            Product prcd = findProduct(s[1]);
            od.setProductcode(prcd);
            od.setQuantityordered(Integer.parseInt(s[2]));
            od.setPriceeach(Double.parseDouble(s[3]));
            od.setOrderlinenumber(Integer.parseInt(s[4]));
            em.persist(od);
        }
        catch(Exception ex)
        {

        }

    }
}
