package servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShoppingListServlet extends HttpServlet {
    HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession();
        String action = request.getParameter("action");
        
        if (action == null)
            getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        else if (action.equals("logout")) {
            session.invalidate();
            session = request.getSession();
            request.setAttribute("message", "logoutSuccess");
            getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<String> itemsList = new ArrayList<>();
        String action = request.getParameter("action");
        String username;
        
        
        if (action.equals("register")) {
            username = request.getParameter("username");
            if (username == null || username.equals("")) {
                request.setAttribute("message", "nullUser");
                getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            }
            else {
                session.setAttribute("username", username);
                session.setAttribute("itemsList", itemsList);
            }
        }
        itemsList = (ArrayList<String>) session.getAttribute("itemsList");
        
        if (action.equals("add")) {
            String item = request.getParameter("item");
            if (item == null || item.equals("")) {
                request.setAttribute("message", "nullItem");
                getServletContext().getRequestDispatcher("/WEB-INF/shoppingList.jsp").forward(request, response);
            }
            else {
                itemsList.add(item);
                request.setAttribute("itemsList", itemsList);
            }
        }
        
        if (action.equals("delete")) {
            String deleted = request.getParameter("radioButton");
            if (deleted != null){
                itemsList.remove(deleted);
            }
        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/shoppingList.jsp").forward(request, response);
    }

}
