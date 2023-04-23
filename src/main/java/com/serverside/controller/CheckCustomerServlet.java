package com.serverside.controller;

import com.serverside.model.entity.Customer;
import com.serverside.model.entity.Payment;
import com.serverside.model.sessionbean.CustomerSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CheckCustomerServlet", value = "/CheckCustomerServlet")
public class CheckCustomerServlet extends HttpServlet {
    @EJB
    private CustomerSessionBeanLocal custbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int nOfPages = 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
        String keyword = request.getParameter("keyword");
        String direction = request.getParameter("direction");

        try {
            int rows = custbean.getNumberofRows(keyword);
            nOfPages = rows / recordsPerPage;

            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }
            List<Customer> cList = custbean.getCustomerByPage(currentPage, recordsPerPage, keyword, direction);
            request.setAttribute("CList", cList);
        } catch (EJBException ex) {

        }

        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("keyword", keyword);
        request.setAttribute("direction", direction);

        RequestDispatcher rd = request.getRequestDispatcher("check-customer.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
