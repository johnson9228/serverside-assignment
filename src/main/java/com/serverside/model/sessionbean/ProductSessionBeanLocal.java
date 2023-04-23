package com.serverside.model.sessionbean;

import com.serverside.model.entity.Product;
import com.serverside.model.entity.Productline;

import javax.ejb.EJBException;
import java.util.List;


public interface ProductSessionBeanLocal {

    public List<Product> getAllProduct() throws EJBException;
    public Product getProduct(String id) throws EJBException;
    public List<Product> readSomeProduct() throws EJBException;
    public List<Product> readProduct(int currPage, int recordsPerPage, String keyword, String sort) throws EJBException;
    public int getNoOfRows(String keyword) throws EJBException;
    public void updateProduct(String[] s, Productline pl) throws EJBException;
    public void deleteProduct(String id) throws EJBException;
    public void addProduct(String[] s, Productline pl) throws EJBException;




}
