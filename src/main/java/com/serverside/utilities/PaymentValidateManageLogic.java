package com.serverside.utilities;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;

public class PaymentValidateManageLogic {
    public static String validateManager(HttpServletRequest request) {
        if (request.getParameter("type") != null && request.getParameter("type").equals("update")) {
            return "update";
        } else if (request.getParameter("type") != null && request.getParameter("type").equals("delete")) {
            return "delete";
        }
        return "add";
    }

    // this method is used to notify a user that a record has been updated and to
    // redirect to another page
    public static void navigateJS(PrintWriter out) {
        out.println("<SCRIPT type=\"text/javascript\">");
        out.println("alert(\"Record has been updated and you will be redirected.\")");
        out.println("window.location.assign(\"CheckPaymentServlet?currentPage=1&recordsPerPage=70&keyword=&direction=ASC\")");
        out.println("</SCRIPT>");
    }
}
