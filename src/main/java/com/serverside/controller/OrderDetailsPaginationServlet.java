package com.serverside.controller;

import com.serverside.model.entity.Orderdetail;
import com.serverside.model.sessionbean.OrderDetailsSessionBeanLocal;
import com.serverside.model.sessionbean.OrderSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderDetailsPaginationServlet", value = "/OrderDetailsPaginationServlet")
public class OrderDetailsPaginationServlet extends HttpServlet {

    @EJB
    private OrderDetailsSessionBeanLocal odsb;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int nOfPages= 0;
        int currentPage = Integer.valueOf(request.getParameter("currentPage"));
        int recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));

        try{
            int rows = odsb.getNumberOfRows();
            nOfPages = rows / recordsPerPage;
            if(rows % recordsPerPage != 0 ){
                nOfPages++;
            }
            if(currentPage > nOfPages && nOfPages != 0){
                currentPage = nOfPages;
            }
            List<Orderdetail> lists = odsb.readOrderDetails(currentPage, recordsPerPage);
            request.setAttribute("staffs",lists);
        }catch(EJBException ex){

        }

        request.setAttribute("nOfPages", nOfPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("recordsPerPage", recordsPerPage);
        RequestDispatcher dispatcher = request.getRequestDispatcher("orderdetailspagination.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
