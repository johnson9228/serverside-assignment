package com.serverside.controller;

import com.serverside.model.entity.Payment;
import com.serverside.model.sessionbean.PaymentSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CheckPaymentServlet", value = "/CheckPaymentServlet")
public class CheckPaymentServlet extends HttpServlet {
    @EJB
    private PaymentSessionBeanLocal pmbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nOfPages = 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
        String keyword = request.getParameter("keyword");
        String direction = request.getParameter("direction");

        try {
            int rows = pmbean.getRowsNumber(keyword);
            nOfPages = rows / recordsPerPage;

            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }
            List<Payment> pmList = pmbean.getPaymentByPage(currentPage, recordsPerPage, keyword, direction);
            request.setAttribute("PMList", pmList);
        } catch (EJBException ex) {

        }

        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("keyword", keyword);
        request.setAttribute("direction", direction);

        RequestDispatcher rd = request.getRequestDispatcher("check-payment.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
