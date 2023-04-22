package com.serverside.controller;

import com.serverside.model.entity.Employee;
import com.serverside.model.sessionbean.EmployeeSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeReadController", value = "/EmployeeReadController")
public class EmployeeReadController extends HttpServlet {

    @EJB
    private EmployeeSessionBeanLocal empbean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int noOfPages = 0;
            int currentPage = 1;
            int recordsPerPage = 20;
            String keyword = "";
            String direction = "ASC";

            //Validation if the user is browsing the table
            if (request.getParameter("currentPage") != null) {
                currentPage = Integer.valueOf(request.getParameter("currentPage"));
            }

            if (request.getParameter("recordsPerPage") != null) {
                recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
            }

            if (request.getParameter("keyword") != null) {
                keyword = request.getParameter("keyword");
            }

            if (request.getParameter("direction") != null) {
                direction = request.getParameter("direction");
            }

            //Calculations for noOfPages
            int rows = empbean.getAllEmployees().size();
            noOfPages = rows / recordsPerPage;

            if (rows % recordsPerPage != 0) {
                noOfPages++;
            }

            if (currentPage > noOfPages && noOfPages != 0) {
                currentPage = noOfPages;
            }

            List<Employee> employeeList = empbean.getAllEmployeesWithPage(currentPage, recordsPerPage, keyword, direction);
            request.setAttribute("employeeList", employeeList);

            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("recordsPerPage", recordsPerPage);
            request.setAttribute("keyword", keyword);
            request.setAttribute("direction", direction);
            RequestDispatcher dispatcher = request.getRequestDispatcher("staff.jsp");
            dispatcher.forward(request, response);

        } catch (EJBException ex) {
            request.setAttribute("error", ex);
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int noOfPages = 0;
            int currentPage = 1;
            int recordsPerPage = 20;
            String keyword = "";
            String direction = "ASC";

            //Validation if the user is browsing the table
            if (request.getParameter("currentPage") != null) {
                currentPage = Integer.valueOf(request.getParameter("currentPage"));
            }

            if (request.getParameter("recordsPerPage") != null) {
                recordsPerPage = Integer.valueOf(request.getParameter("recordsPerPage"));
            }

            if (request.getParameter("keyword") != null) {
                keyword = request.getParameter("keyword");
            }

            if (request.getParameter("direction") != null) {
                direction = request.getParameter("direction");
            }

            //Calculations for noOfPages
            int rows = empbean.getAllEmployees().size();
            noOfPages = rows / recordsPerPage;

            if (rows % recordsPerPage != 0) {
                noOfPages++;
            }

            if (currentPage > noOfPages && noOfPages != 0) {
                currentPage = noOfPages;
            }

            List<Employee> employeeList = empbean.getAllEmployeesWithPage(currentPage, recordsPerPage, keyword, direction);
            request.setAttribute("employeeList", employeeList);

            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("recordsPerPage", recordsPerPage);
            request.setAttribute("keyword", keyword);
            request.setAttribute("direction", direction);
            RequestDispatcher dispatcher = request.getRequestDispatcher("staff.jsp");
            dispatcher.forward(request, response);

        } catch (EJBException ex) { //Validation
            request.setAttribute("error", ex);
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }

}
