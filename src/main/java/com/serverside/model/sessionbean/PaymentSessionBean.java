package com.serverside.model.sessionbean;

import com.serverside.model.entity.Customer;
import com.serverside.model.entity.Payment;
import com.serverside.model.entity.PaymentId;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Stateless
public class PaymentSessionBean implements PaymentSessionBeanLocal {
    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;

    @Override
    public List<Payment> getAllPayments() throws EJBException {
        return em.createNamedQuery("Payment.findAll").getResultList();
    }

    @Override
    public Payment getPayment(PaymentId id) throws EJBException {
        Query q = em.createNamedQuery("Payment.findbyId");
        q.setParameter("checkNumber", id.getChecknumber());
        q.setParameter("customerNumber", id.getCustomernumber());
        return (Payment) q.getSingleResult();
    }

    @Override
    public List<Payment> getPaymentByPage(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.payments ORDER BY customernumber" + direction, Payment.class);
            start = currentPage * recordsPerPage - recordsPerPage;
        } else {
            q = em.createNativeQuery("SELECT * FROM  classicmodels.payments WHERE concat(customernumber, checknumber) LIKE ?" +
                    " ORDER BY customernumber" + direction, Payment.class);
            start = currentPage * recordsPerPage - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }
        List<Payment> payments = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return payments;
    }

    @Override
    public int getRowsNumber(String keyword) throws EJBException {
        Query q = null;
        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow FROM classicmodels.payments");
        } else {
            q = em.createNativeQuery("SELECT COUNT(*) AS totalrow from classicmodels.payments WHERE concat(customernumber, checknumber) LIKE ?");
            q.setParameter(1, "%" + keyword + "%");

        }
        BigInteger results = (BigInteger) q.getSingleResult();
        return results.intValue();
    }

    @Override
    public void createPayment(Payment p) throws EJBException {
        Query q = null;

        q = em.createNativeQuery("INSERT INTO classicmodels.payments " +
                "(customernumber, checknumber, paymentdate, amount) " +
                "VALUES (:customernumber, :checknumber, :paymentdate, :amount)");
        q.setParameter("customernumber", p.getId().getCustomernumber());
        q.setParameter("checknumber", p.getId().getChecknumber());
        q.setParameter("paymentdate", p.getPaymentdate());
        q.setParameter("amount", p.getAmount());
        q.executeUpdate();
    }

    @Override
    public void updatePayment(PaymentId pId, String[] s) throws EJBException {
        Payment p = getPayment(pId);
        p.setPaymentdate(s[0]);
        p.setAmount(BigDecimal.valueOf(Double.parseDouble(s[1])));
        em.merge(p);
    }

    @Override
    public void deletePayment(PaymentId id) throws EJBException {
        Payment p = getPayment(id);
        em.remove(p);
    }
}
