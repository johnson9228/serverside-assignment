package com.serverside.model.sessionbean;

import com.serverside.model.entity.Office;

import javax.ejb.EJBException;
import javax.ejb.Local;
import java.util.List;

@Local
public interface OfficeSessionBeanLocal {

    //Read methods
    public List<Office> getAllOffice() throws EJBException;

    public List<Office> getAllOfficeWithPage(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException;

    public Office getOffice(int officeId) throws EJBException;

    //Create methods
    public int createOffice(String city, String phone, String addressLine1, String addressLine2, String state, String country, String postalCode, String territory) throws EJBException;

    //Update methods
    public Office updateOffice(int officeId, String city, String phone, String addressLine1, String addressLine2, String state, String country, String postalCode, String territory) throws EJBException;

    //Delete methods
    public int deleteOffice(int officeId) throws EJBException;
}
