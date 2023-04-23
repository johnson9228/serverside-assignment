package com.serverside.model.sessionbean;

import com.serverside.model.entity.Customer;
import com.serverside.model.entity.Employee;

import javax.ejb.EJBException;
import javax.ejb.Local;
import java.util.List;

@Local
public interface CustomerSessionBeanLocal {
    //Read
    public List<Customer> getAllCustomers() throws EJBException;
    public Customer getCustomer(int id) throws EJBException;
    public List<Customer> getCustomerByPage(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;
    public int getNumberofRows(String keyword)throws EJBException;
    public int getMaxId()throws EJBException;

    //Create
    public void createCustomer(String[] s) throws EJBException;

    //Update
    public void updateCustomer(String[] s, Employee e) throws EJBException;

    //Delete
    public void deleteCustomer(int customerNumber) throws EJBException;

}
