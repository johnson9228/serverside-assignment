package com.serverside.model.sessionbean;

import com.serverside.model.entity.Customer;
import com.serverside.model.entity.Employee;
import com.serverside.model.entity.Payment;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;

@Stateless
public class CustomerSessionBean implements CustomerSessionBeanLocal {
    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;

    @Override
    public List<Customer> getAllCustomers() throws EJBException {
        return em.createNamedQuery("Customer.findAll").getResultList();
    }

    @Override
    public Customer getCustomer(int customerNumber) throws EJBException {
        Query q = em.createNamedQuery("Customer.findById");
        q.setParameter("customernumber", customerNumber);
        return (Customer) q.getSingleResult();
    }

    @Override
    public List<Customer> getCustomerByPage(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.customers ORDER BY customernumber" + direction, Customer.class);
            start = currentPage * recordsPerPage - recordsPerPage;
        } else {
            q = em.createNativeQuery("SELECT * FROM  classicmodels.customers WHERE " +
                    "concat(customernumber, customername, contactfirstname, contactlastname, phone) LIKE ?" +
                    " ORDER BY customernumber" + direction, Customer.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
        List<Customer> customers = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return customers;
    }

    @Override
    public int getNumberofRows(String keyword) throws EJBException {
        Query q = null;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.customers");
        } else {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.customers WHERE " +
                    "concat(customernumber, customername, contactfirstname, contactlastname, phone) LIKE ?");
            q.setParameter(1, "%" + keyword + "%");

        }

        BigInteger result = (BigInteger) q.getSingleResult();
        return result.intValue();
    }

    @Override
    public int getMaxId() throws EJBException {
        Query q = null;
        q = em.createNativeQuery("SELECT MAX(customernumber) FROM classicmodels.customers");
        Short result = (Short) q.getSingleResult();
        return result.intValue();
    }


    @Override
    public void createCustomer(String[] s) throws EJBException {
        Query q = null;
        q = em.createNativeQuery("INSERT INTO classicmodels.customers " +
                "(customernumber, customername, contactlastname, contactfirstname," +
                "  phone, addressline1, addressline2, city, state, postalcode," +
                "  country, salesrepemployeenumber, creditlimit)" +
                "  VALUES (:customernumber, :customername, :contactlastname, :contactfirstname, :phone, " +
                ":addressline1, :addressline2, :city, :state, :postalcode, :country, " +
                ":salesrepemployeenumber , :creditlimit)", Customer.class);
        q.setParameter("customernumber", Short.parseShort(s[0]));
        q.setParameter("customername", s[1]);
        q.setParameter("contactlastname", s[2]);
        q.setParameter("contactfirstname", s[3]);
        q.setParameter("phone", s[4]);
        q.setParameter("addressline1", s[5]);
        q.setParameter("addressline2", s[6]);
        q.setParameter("city", s[7]);
        q.setParameter("state", s[8]);
        q.setParameter("postalcode", s[9]);
        q.setParameter("country", s[10]);
        q.setParameter("salesrepemployeenumber", Short.parseShort(s[11]));
        q.setParameter("creditlimit", BigDecimal.valueOf(Double.parseDouble(s[12])));
        q.executeUpdate();


    }

    @Override
    public void updateCustomer(String[] s, Employee e) throws EJBException {
        Customer c = getCustomer(Integer.parseInt(s[0]));
        c.setCustomername(s[1]);
        c.setContactlastname(s[2]);
        c.setContactfirstname(s[3]);
        c.setPhone(s[4]);
        c.setAddressline1(s[5]);
        c.setAddressline2(s[6]);
        c.setCity(s[7]);
        c.setState(s[8]);
        c.setPostalcode(s[9]);
        c.setCountry(s[10]);
        if (e != null) {
            c.setSalesrepemployeenumber(e);
        } else {
            c.setSalesrepemployeenumber(null);
        }
        if (!s[11].equals("null") && s[11] == null && s[11].length() != 0) {
            c.setCreditlimit(BigDecimal.valueOf(Double.parseDouble(s[11])));
        } else {
            c.setCreditlimit(null);
        }


        em.merge(c);
    }

    @Override
    public void deleteCustomer(int customerNumber) throws EJBException {
        Query q = null;
        q = em.createNativeQuery("DELETE FROM classicmodels.customers " +
                "WHERE customernumber = :customernumber");
        q.setParameter("customernumber", customerNumber);
        q.executeUpdate();
    }
}
