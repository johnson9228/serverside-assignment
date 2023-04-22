package com.serverside.controller;

import com.serverside.model.entity.Employee;
import com.serverside.model.entity.Office;
import com.serverside.model.sessionbean.OfficeSessionBeanLocal;

import javax.ejb.EJB;
import javax.ejb.EJBException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OfficeController", value = "/OfficeController")
public class OfficeController extends HttpServlet {

    //RULES AND GUIDELINES FOR OFFICE CRUD
    //2 = When the user wants to create a new employee record
    //3 = When the user wants to update a selected employee record
    //4 = When the user wants to delete a selected employee record

    @EJB
    private OfficeSessionBeanLocal officebean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int choice = Integer.parseInt(request.getParameter("choice"));

        //Update office function (Before getting updated data)
        if (choice == 3) {
            try {
                int officeId = Integer.parseInt(request.getParameter("id"));

                Office office = officebean.getOffice(officeId);
                request.setAttribute("officeObject", office);
                RequestDispatcher req = request.getRequestDispatcher("office-update.jsp");
                req.forward(request, response);

            } catch (EJBException ex) {
                request.setAttribute("error", ex);
                RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                dispatcher.forward(request, response);
            }
        }
        //Delete office function
        else if (choice == 4) {
            try {
                int officeId = Integer.parseInt(request.getParameter("id"));

                int office = officebean.deleteOffice(officeId);

                //Validation
                if (office == -1) {
                    request.setAttribute("error", "Delete office record unsuccessful");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("message", "Delete office record successful");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("OfficeReadController");
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

        //Create office function
        if (choice == 2) {
            try {
                //Declare all the variables of the updated object
                String city = request.getParameter("city");
                String phone = request.getParameter("phone");
                String addressLine1 = request.getParameter("addressLine1");
                String addressLine2 = request.getParameter("addressLine2");
                String state = request.getParameter("state");
                String country = request.getParameter("country");
                String postalCode = request.getParameter("postalCode");
                String territory = request.getParameter("territory");

                int office = officebean.createOffice(city, phone, addressLine1, addressLine2, state, country, postalCode, territory);

                //Validation
                if (office == -1) {
                    request.setAttribute("error", "Create office record unsuccessful");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }

                request.setAttribute("message", "Update office record successful");
                RequestDispatcher dispatcher = request.getRequestDispatcher("OfficeReadController");
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
                int officeId = Integer.parseInt(request.getParameter("id"));
                String city = request.getParameter("city");
                String phone = request.getParameter("phone");
                String addressLine1 = request.getParameter("addressLine1");
                String addressLine2 = request.getParameter("addressLine2");
                String state = request.getParameter("state");
                String country = request.getParameter("country");
                String postalCode = request.getParameter("postalCode");
                String territory = request.getParameter("territory");

                Office office = officebean.updateOffice(officeId, city, phone, addressLine1, addressLine2, state, country, postalCode, territory);

                //Validation
                if (office == null) {
                    request.setAttribute("error", "Update office record unsuccessful");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }

                request.setAttribute("message", "Update office record successful");
                RequestDispatcher dispatcher = request.getRequestDispatcher("OfficeReadController");
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
