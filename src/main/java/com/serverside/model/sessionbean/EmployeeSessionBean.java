package com.serverside.model.sessionbean;

import com.serverside.model.entity.Employee;
import com.serverside.model.entity.Office;

import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

@Stateless
public class EmployeeSessionBean implements EmployeeSessionBeanLocal {

    @PersistenceContext(unitName = "classicmodels")
    EntityManager em;

    @Override
    public List<Employee> getAllEmployees() throws EJBException {
        return em.createNamedQuery("Employee.getAllEmployees").getResultList();
    }

    @Override
    public List<Employee> getAllEmployeesWithPage(int currentPage, int recordsPerPage, String keyword, String direction) throws EJBException {
        Query q = null;
        int start = 0;
        direction = " " + direction;

        if (keyword.isEmpty()) {
            q = em.createNativeQuery("SELECT * FROM classicmodels.employees order by employeenumber" + direction, Employee.class);
            start = (currentPage * recordsPerPage) - recordsPerPage;
        } else {
            q = em.createNativeQuery("SELECT * FROM classicmodels.employees WHERE concat(employeenumber, firstname, extension, email, officecode, jobtitle) LIKE ? order by employeenumber"
                    + direction, Employee.class);
            start = (currentPage * recordsPerPage) - recordsPerPage;
            q.setParameter(1, "%" + keyword + "%");
        }

        List<Employee> results = q.setFirstResult(start).setMaxResults(recordsPerPage).getResultList();
        return results;
    }

    @Override
    public Employee getEmployee(int employeeId) throws EJBException {
        Query q = em.createNamedQuery("Employee.getEmployee");
        q.setParameter("employeeId", Integer.valueOf(employeeId));
        return (Employee) q.getSingleResult();
    }

    @Override
    public int createEmployee(String firstName, String lastName, String email, String extension, Office officeObj, String reportsTo, String jobTitle) throws EJBException {

        List<Employee> empList = getAllEmployees();
        int largestEmployeeId = 1;
        int officeCode = officeObj.getId();

        if (empList != null) {
            //Search for the largest id number
            for (int i = 0; i < empList.size(); i++) {
                if (empList.get(i).getId() > largestEmployeeId) {
                    largestEmployeeId = empList.get(i).getId();
                }
            }
            //Create new employee id
            largestEmployeeId++;
        }

        Query q = em.createNativeQuery("INSERT INTO classicmodels.employees" +
                "(employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)" +
                "VALUES (:largestEmployeeId, :lastName, :firstName, :extension, :email, :officeCode, :reportsTo, :jobTitle)");
        q.setParameter("largestEmployeeId", largestEmployeeId);
        q.setParameter("lastName", lastName);
        q.setParameter("firstName", firstName);
        q.setParameter("extension", extension);
        q.setParameter("email", email);
        q.setParameter("officeCode", officeCode);
        q.setParameter("reportsTo", reportsTo);
        q.setParameter("jobTitle", jobTitle);
        q.executeUpdate();

        return 1;
    }

    @Override
    public Employee updateEmployee(int employeeId, String firstName, String lastName, String email, String extension, String reportsTo, String jobTitle, Office officeObj) throws EJBException {
        Employee emp = getEmployee(employeeId);

        //Validation
        if (emp != null) {
            emp.setFirstname(firstName);
            emp.setLastname(lastName);
            emp.setEmail(email);
            emp.setExtension(extension);
            emp.setReportsto(reportsTo);
            emp.setJobtitle(jobTitle);
            emp.setOfficecode(officeObj);

            return emp;
        } else {
            return null;
        }
    }

    @Override
    public int deleteEmployee(int employeeId) throws EJBException {
        Employee emp = getEmployee(employeeId);

        //Validation
        if (emp == null) {
            return -1;
        } else {
            em.remove(emp);
            return 1;
        }
    }
}
