package com.serverside.model.sessionbean;

import com.serverside.model.entity.Office;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Stateless
public class OfficeSessionBean implements OfficeSessionBeanLocal {

    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;

    @Override
    public List<Office> getAllOffice() throws EJBException {
        return em.createNamedQuery("Office.getAllOffice").getResultList();
    }

    @Override
    public List<Office> getAllOfficeWithPage(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;

        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.offices order by officecode" + direction, Office.class);
            start = (currentPage * recordsPerPage) - recordsPerPage;
        } else {
            q = em.createNativeQuery("SELECT * FROM classicmodels.offices WHERE concat(officecode, city, state, country, postalcode, territory) LIKE ? order by officecode"
                    + direction, Office.class);
            start = (currentPage * recordsPerPage) - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }

        List<Office> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public Office getOffice(int officeId) throws EJBException {
        Query q = em.createNamedQuery("Office.getOffice");
        q.setParameter("officeId", Integer.valueOf(officeId));
        return (Office) q.getSingleResult();
    }

    @Override
    public int createOffice(String city, String phone, String addressLine1, String addressLine2, String state, String country, String postalCode, String territory) throws EJBException {
        List<Office> officeList = getAllOffice();
        int largestOfficeCode = 1;

        if (officeList != null) {
            //Search for the largest office code
            for (int i = 0; i < officeList.size(); i++) {
                if (officeList.get(i).getId() > largestOfficeCode) {
                    largestOfficeCode = officeList.get(i).getId();
                }
            }
            //Create new employee id
            largestOfficeCode++;
        }

        Query q = em.createNativeQuery("INSERT INTO classicmodels.offices" +
                "(officecode, city, phone, addressline1, addressline2, state, country, postalcode, territory)" +
                "VALUES (:largestOfficeCode, :city, :phone, :addressLine1, :addressLine2, :state, :country, :postalCode, :territory)");
        q.setParameter("largestOfficeCode", largestOfficeCode);
        q.setParameter("city", city);
        q.setParameter("phone", phone);
        q.setParameter("addressLine1", addressLine1);
        q.setParameter("addressLine2", addressLine2);
        q.setParameter("state", state);
        q.setParameter("country", country);
        q.setParameter("postalCode", postalCode);
        q.setParameter("territory", territory);
        q.executeUpdate();

        return 1;
    }

    @Override
    public Office updateOffice(int officeId, String city, String phone, String addressLine1, String addressLine2, String state, String country, String postalCode, String territory) throws EJBException {
        Office office = getOffice(officeId);

        //Validation
        if (office != null) {
            office.setCity(city);
            office.setPhone(phone);
            office.setAddressline1(addressLine1);
            office.setAddressline2(addressLine2);
            office.setState(state);
            office.setCountry(country);
            office.setPostalcode(postalCode);
            office.setTerritory(territory);

            return office;
        } else {
            return null;
        }
    }

    @Override
    public int deleteOffice(int officeId) throws EJBException {
        Office office = getOffice(officeId);

        //Validation
        if (office == null) {
            return -1;
        } else {
            em.remove(office);
            return 1;
        }
    }
}
