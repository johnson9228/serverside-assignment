package com.serverside.controller;

import com.serverside.model.entity.Order;
import com.serverside.model.sessionbean.OrderSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderPaginationServlet", value = "/OrderPaginationServlet")
public class OrderPaginationServlet extends HttpServlet {

    @EJB
    private OrderSessionBeanLocal orderbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        int nOfPages = 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
        String keyword = request.getParameter("keyword");

        try {
            int rows = orderbean.getNumberOfRows(keyword);
            nOfPages = rows / recordsPerPage;
            if (rows % recordsPerPage != 0) {
                nOfPages++;
            }
            if (currentPage > nOfPages && nOfPages != 0) {
                currentPage = nOfPages;
            }

            List<Order> lists = orderbean.readOrder(currentPage,recordsPerPage,keyword);
            request.setAttribute("staffs",lists);

        }catch(EJBException ex){

        }

        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        request.setAttribute("keyword", keyword);
        RequestDispatcher dispatcher = request.getRequestDispatcher("orderpagination.jsp");
        dispatcher.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }
}
