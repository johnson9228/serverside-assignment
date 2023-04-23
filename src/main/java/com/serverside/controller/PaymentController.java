package com.serverside.controller;

import com.serverside.model.entity.Customer;
import com.serverside.model.entity.Payment;
import com.serverside.model.entity.PaymentId;
import com.serverside.model.sessionbean.CustomerSessionBeanLocal;
import com.serverside.model.sessionbean.PaymentSessionBeanLocal;
import com.serverside.utilities.PaymentValidateManageLogic;

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
import java.util.List;

@WebServlet(name = "PaymentController", value = "/PaymentController")
public class PaymentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @EJB
    private PaymentSessionBeanLocal pmbean;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String checknumber = request.getParameter("checknumber");
        int customernumber = Integer.parseInt(request.getParameter("customernumber"));

        try {
            PaymentId pmId = new PaymentId();
            pmId.setChecknumber(checknumber);
            pmId.setCustomernumber(customernumber);
            Payment pm = pmbean.getPayment(pmId);
            request.setAttribute("PM", pm);
            if(PaymentValidateManageLogic.validateManager(request).equals("update")){
                RequestDispatcher rd = request.getRequestDispatcher("payment-update.jsp");
                rd.forward(request, response);
            }
            if(PaymentValidateManageLogic.validateManager(request).equals("delete")){
                RequestDispatcher rd = request.getRequestDispatcher("payment-delete.jsp");
                rd.forward(request,response);
            }


        } catch (EJBException ex) {
            request.setAttribute("err", ex);
            RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int customerNumber = Integer.parseInt(request.getParameter("customerNumber"));
        String checkNumber = request.getParameter("checkNumber");
        String paymentDate = request.getParameter("paymentDate");
        BigDecimal amount = BigDecimal.valueOf(Double.parseDouble(request.getParameter("amount")));
        RequestDispatcher rd;
        PrintWriter out = response.getWriter();
        try {
            if (PaymentValidateManageLogic.validateManager(request).equals("add")) {
                PaymentId pId = new PaymentId();
                pId.setCustomernumber(customerNumber);
                pId.setChecknumber(checkNumber);
                String pd = new SimpleDateFormat("dd/MM/yyyy").format(new Date());
                Payment p = new Payment();
                p.setId(pId);
                p.setPaymentdate(pd);
                p.setAmount(amount);
                pmbean.createPayment(p);

            } else if (PaymentValidateManageLogic.validateManager(request).equals("update")) {
                PaymentId pId = new PaymentId();
                pId.setCustomernumber(customerNumber);
                pId.setChecknumber(checkNumber);
                String[] s = {paymentDate, String.valueOf(amount)};
                pmbean.updatePayment(pId, s);
            } else if (PaymentValidateManageLogic.validateManager(request).equals("delete")) {
                PaymentId pId = new PaymentId();
                pId.setCustomernumber(customerNumber);
                pId.setChecknumber(checkNumber);
                pmbean.deletePayment(pId);
            }
            PaymentValidateManageLogic.navigateJS(out);


        } catch (EJBException ex) {
            request.setAttribute("err",ex);
            StackTraceElement[] stktrace
                    = ex.getStackTrace();
            request.setAttribute("error", stktrace);
            rd = request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
        }


    }
}
