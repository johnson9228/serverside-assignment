package com.serverside.controller;

import com.serverside.model.entity.Customer;
import com.serverside.model.entity.Employee;
import com.serverside.model.entity.Payment;
import com.serverside.model.entity.PaymentId;
import com.serverside.model.sessionbean.CustomerSessionBean;
import com.serverside.model.sessionbean.CustomerSessionBeanLocal;
import com.serverside.model.sessionbean.EmployeeSessionBeanLocal;
import com.serverside.utilities.CustomerValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet(name = "CustomerController", value = "/CustomerController")
public class CustomerController extends HttpServlet {
    //Set the serialization version
    private static final long serialVersionUID = 1L;

    @EJB
    private CustomerSessionBeanLocal custBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        int customerNumber = Integer.parseInt(request.getParameter("customernumber"));
        try {
            Customer c = custBean.getCustomer(customerNumber);
            request.setAttribute("CUST", c);
            if (CustomerValidateManageLogic.validateManager(request).equals("update")) {
                RequestDispatcher rd = request.getRequestDispatcher("customer-update.jsp");
                rd.forward(request, response);
            }
            if (CustomerValidateManageLogic.validateManager(request).equals("delete")) {
                RequestDispatcher rd = request.getRequestDispatcher("customer-delete.jsp");
                rd.forward(request, response);
            }

        } catch (EJBException ex) {
            request.setAttribute("err", ex);
            RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String customerNumber = request.getParameter("customerNumber");
        String customerName = request.getParameter("customerName");
        String contactLastName = request.getParameter("contactLastName");
        String contactFirstName = request.getParameter("contactFirstName");
        String phone = request.getParameter("phone");
        String addressLine1 = request.getParameter("addressLine1");
        String addressLine2 = request.getParameter("addressLine2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postalCode = request.getParameter("postalCode");
        String country = request.getParameter("country");
        String employeeNumber = request.getParameter("employeeNumber");
        String creditLimit = request.getParameter("creditLimit");
        String type = request.getParameter("type");
        PrintWriter out = response.getWriter();
        try {
            if (CustomerValidateManageLogic.validateManager(request).equals("add")) {
                customerNumber = String.valueOf(custBean.getMaxId() + 1);
                String[] s = {customerNumber, customerName,
                        contactLastName, contactFirstName, phone,
                        addressLine1, addressLine2, city, state, postalCode,
                        country, employeeNumber, creditLimit};
                 custBean.createCustomer(s);

            } else if (CustomerValidateManageLogic.validateManager(request).equals("update")) {
                String[] s = {customerNumber, customerName,
                        contactLastName, contactFirstName, phone,
                        addressLine1, addressLine2, city, state, postalCode,
                        country, creditLimit};
                Customer c = custBean.getCustomer(Integer.parseInt(customerNumber));
                Employee e = c.getSalesrepemployeenumber();
                //Employee e = e
                custBean.updateCustomer(s, e);

            } else if (CustomerValidateManageLogic.validateManager(request).equals("delete")) {
                custBean.deleteCustomer(Integer.parseInt(customerNumber));
            }
            CustomerValidateManageLogic.navigateJS(out);


        } catch (EJBException ex) {
            RequestDispatcher rd;
            request.setAttribute("err", ex);
            StackTraceElement[] stktrace
                    = ex.getStackTrace();
            request.setAttribute("error", stktrace);
            rd = request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
        }


    }
}
