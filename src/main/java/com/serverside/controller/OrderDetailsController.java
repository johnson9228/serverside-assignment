package com.serverside.controller;

import com.serverside.model.entity.Orderdetail;
import com.serverside.model.sessionbean.OrderDetailsSessionBeanLocal;
import com.serverside.model.sessionbean.OrderSessionBeanLocal;
import com.serverside.utilities.OrderDetailsValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "OrderDetailsController", value = "/OrderDetailsController")
public class OrderDetailsController extends HttpServlet {

    @EJB
    private OrderDetailsSessionBeanLocal odsb;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        String prcd = request.getParameter("ID");
        try{
            Orderdetail od = odsb.findOrderDetails(Integer.parseInt(id),prcd);
            request.setAttribute("OD", od);
            RequestDispatcher req = request.getRequestDispatcher("OrderDetailsUpdate.jsp");
            req.forward(request, response);
        }catch (EJBException ex){

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String orderdtno = request.getParameter("orderdetailsno");
        String prcd = request.getParameter("productcode");
        String qtyorder = request.getParameter("quantityorder");
        String priceeach = request.getParameter("priceeach");
        String orderlineno = request.getParameter("orderlineno");

        PrintWriter out = response.getWriter();

        String[] s = {orderdtno, prcd, qtyorder, priceeach, orderlineno};

        try{
            if(OrderDetailsValidateManageLogic.validateManager(request).equals("UPDATE")){
                odsb.updateOrderDetails(s);
                out.println("<SCRIPT type=\"text/javascript\">alert(\"Update successfully\")</SCRIPT>");
            }
            else if (OrderDetailsValidateManageLogic.validateManager(request).equals("DELETE")){
                odsb.deleteOrderDetails(Integer.parseInt(orderdtno), prcd);
                out.println("<SCRIPT type=\"text/javascript\">alert(\"Delete successfully\")</SCRIPT>");
            }else{
                odsb.addOrderDetails(s);
                out.println("<SCRIPT type=\"text/javascript\">alert(\"Add successfully\")</SCRIPT>");
            }

            OrderDetailsValidateManageLogic.navigateJS(out);
        } catch(EJBException ex){

            out.println("<SCRIPT type=\"text/javascript\">alert(\"Issue occured\")</SCRIPT>");

            RequestDispatcher req = request.getRequestDispatcher("orderdetailspagination.jsp");

            req.forward(request, response);

        }



    }
}
