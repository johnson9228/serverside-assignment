package com.serverside.controller;

import com.serverside.model.entity.Order;
import com.serverside.model.sessionbean.OrderSessionBeanLocal;
import com.serverside.utilities.OrderValidateManageLogic;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "OrderController", value = "/OrderController")
public class OrderController extends HttpServlet {

    @EJB
    private OrderSessionBeanLocal orderbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id =  Integer.parseInt(request.getParameter("id"));
        try{
            Order od = orderbean.findOrder(id);
            request.setAttribute("ODR",od);
            RequestDispatcher req = request.getRequestDispatcher("OrderUpdate.jsp");
            req.forward(request, response);
        }catch(EJBException ex){

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String oid = request.getParameter("OID");
        String cnm = request.getParameter("CNM");
        String od = request.getParameter("OD");
        String rd = request.getParameter("RD");
        String sd = request.getParameter("SD");
        String st = request.getParameter("ST");
        String com = request.getParameter("COM");

        PrintWriter out = response.getWriter();

        String[] s = { oid, cnm, od, rd, sd, st, com};

        try{
            if(OrderValidateManageLogic.validateManager(request).equals("UPDATE")){
                orderbean.updateOrder(s);
            }
            else if (OrderValidateManageLogic.validateManager(request).equals("DELETE")){
                orderbean.deleteOrder(Integer.parseInt(oid));
            }
            else{
                orderbean.addOrder(s);
            }

            OrderValidateManageLogic.navigateJS(out);

        } catch (Exception e) {
        }

    }
}

