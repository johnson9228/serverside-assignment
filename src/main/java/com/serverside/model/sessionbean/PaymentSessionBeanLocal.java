package com.serverside.model.sessionbean;

import com.serverside.model.entity.Customer;
import com.serverside.model.entity.Payment;
import com.serverside.model.entity.PaymentId;

import javax.ejb.EJBException;
import javax.ejb.Local;
import java.util.List;

@Local
public interface PaymentSessionBeanLocal {
    //Read
    public List<Payment> getAllPayments() throws EJBException;

    public Payment getPayment(PaymentId id) throws EJBException;

    public List<Payment> getPaymentByPage(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;

    public int getRowsNumber(String keyword) throws EJBException;

    //Create
    public void createPayment(Payment p) throws EJBException;

    //Update
    public void updatePayment( PaymentId pId, String[] s) throws EJBException;

    //Delete
    public void deletePayment(PaymentId id) throws EJBException;

}
