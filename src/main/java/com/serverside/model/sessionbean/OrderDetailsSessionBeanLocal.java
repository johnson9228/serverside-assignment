package com.serverside.model.sessionbean;

import com.serverside.model.entity.Order;
import com.serverside.model.entity.Orderdetail;
import com.serverside.model.entity.Product;

import javax.ejb.EJBException;
import java.util.List;

public interface OrderDetailsSessionBeanLocal {

    public List<Orderdetail> getAllOrderDetails() throws EJBException;
    public Orderdetail findOrderDetails(int id, String ID) throws EJBException;
    public Order findOrder(int id) throws EJBException;
    public Product findProduct (String id) throws EJBException;
    public List<Orderdetail> readOrderDetails(int currentPage, int recordsPerPage) throws EJBException;
    public int getNumberOfRows() throws EJBException ;
    public void updateOrderDetails(String[] s) throws EJBException;
    public void deleteOrderDetails (int id, String ID) throws EJBException;
    public void addOrderDetails (String[] s) throws EJBException;

}
