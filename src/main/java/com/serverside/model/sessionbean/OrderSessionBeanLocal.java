package com.serverside.model.sessionbean;


import com.serverside.model.entity.Order;

import javax.ejb.EJBException;
import java.util.List;

public interface OrderSessionBeanLocal {

    public List<Order> getAllOrder() throws EJBException;
    public Order findOrder(int id) throws EJBException;
    public List<Order> readOrder(int currentPage, int recordsPerPage, String keyword) throws EJBException;
    public int getNumberOfRows(String keyword) throws EJBException ;
    public void updateOrder(String[] s) throws EJBException;
    public void deleteOrder(int id) throws EJBException;
    public void addOrder(String[] s) throws EJBException;

}
