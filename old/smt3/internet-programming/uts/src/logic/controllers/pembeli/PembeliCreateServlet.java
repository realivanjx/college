package logic.controllers.pembeli;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.DI;
import logic.models.Customer;

@WebServlet("/pembeli/create")
public class PembeliCreateServlet extends HttpServlet
{
    private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) 
    throws ServletException, IOException
    {
        try
        {
            // Validating.
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");

            if (name == null || name.isEmpty())
            {
                throw new Exception("name is empty");
            }

            // Creating.
            Customer data = new Customer();
            data.name = name;
            data.address = address;
            data.phone = phone;
            DI.customerService.create(data);

            // Done.
            response.sendRedirect(request.getContextPath() + "/pembeli.jsp");
        }
        catch (Exception ex)
        {
            response.sendError(400, ex.getMessage());
        }
    }
}
