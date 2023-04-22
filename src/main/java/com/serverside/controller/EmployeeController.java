package com.serverside.controller;

import com.serverside.model.entity.Employee;
import com.serverside.model.entity.Office;
import com.serverside.model.sessionbean.EmployeeSessionBeanLocal;
import com.serverside.model.sessionbean.OfficeSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EmployeeController", value = "/EmployeeController")
public class EmployeeController extends HttpServlet {

    //RULES AND GUIDELINES FOR EMPLOYEE CRUD
    //2 = When the user wants to create a new employee record
    //3 = When the user wants to update a selected employee record
    //4 = When the user wants to delete a selected employee record

    @EJB
    private EmployeeSessionBeanLocal empbean;
    @EJB
    private OfficeSessionBeanLocal officebean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int choice = Integer.parseInt(request.getParameter("choice"));

        //Update employee function (Before getting updated data)
        if (choice == 3) {
            try {
                int employeeId = Integer.parseInt(request.getParameter("id"));

                Employee emp = empbean.getEmployee(employeeId);
                request.setAttribute("employeeObject", emp);
                RequestDispatcher req = request.getRequestDispatcher("employee-update.jsp");
                req.forward(request, response);

            } catch (EJBException ex) {
                request.setAttribute("error", ex);
                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
            }
        }
        //Delete employee function
        else if (choice == 4) {
            try {
                int employeeId = Integer.parseInt(request.getParameter("id"));

                int emp = empbean.deleteEmployee(employeeId);

                //Validation
                if (emp == -1) {
                    request.setAttribute("error", "Delete employee record unsuccessful");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("message", "Delete employee record successful");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("EmployeeReadController");
                    dispatcher.forward(request, response);
                }

            } catch (EJBException ex) {
                request.setAttribute("error", ex);
                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("error", "Invalid choice");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int choice = Integer.parseInt(request.getParameter("choice"));

        //Create employee function
        if (choice == 2) {
            try {
                //Declare all the variables of the updated object
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String extension = request.getParameter("extension");
                int officeCode = Integer.parseInt(request.getParameter("officeCode"));
                String reportsTo = request.getParameter("reportsTo");
                String jobTitle = request.getParameter("jobTitle");

                Office officeObj = officebean.getOffice(officeCode);

                if (officeObj == null) {
                    request.setAttribute("error", "Unable to read the Office Object");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }

                int emp = empbean.createEmployee(firstName, lastName, email, extension, officeObj, reportsTo, jobTitle);

                //Validation
                if (emp == -1) {
                    request.setAttribute("error", "Create employee record unsuccessful");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }

                request.setAttribute("message", "Update employee record successful");
                RequestDispatcher dispatcher = request.getRequestDispatcher("EmployeeReadController");
                dispatcher.forward(request, response);

            } catch (EJBException ex) {
                request.setAttribute("error", ex);
                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
            }
        }
        //After the user submits the update form
        else if (choice == 3) {
            try {
                //Declare all the variables of the updated object
                int employeeId = Integer.parseInt(request.getParameter("id"));
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String extension = request.getParameter("extension");
                int officeCode = Integer.parseInt(request.getParameter("officeCode"));
                String reportsTo = request.getParameter("reportsTo");
                String jobTitle = request.getParameter("jobTitle");

                Office officeObj = officebean.getOffice(officeCode);

                if (officeObj == null) {
                    request.setAttribute("error", "Unable to read the Office Object");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }

                Employee emp = empbean.updateEmployee(employeeId, firstName, lastName, email, extension, reportsTo, jobTitle, officeObj);

                //Validation
                if (emp == null) {
                    request.setAttribute("error", "Update employee record unsuccessful");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }

                request.setAttribute("message", "Update employee record successful");
                RequestDispatcher dispatcher = request.getRequestDispatcher("EmployeeReadController");
                dispatcher.forward(request, response);


            } catch (EJBException ex) {
                request.setAttribute("error", ex);
                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("error", "Invalid choice");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
