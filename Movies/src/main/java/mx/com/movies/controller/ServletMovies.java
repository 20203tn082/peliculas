package mx.com.movies.controller;

import mx.com.movies.model.BeanMovie;
import mx.com.movies.model.DaoMovie;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ServletMovies", value = "/ServletMovies")
public class ServletMovies extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listMovies", new DaoMovie().findAllMovies());
        request.getRequestDispatcher("/views/movie/movies.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        switch(action){
            case "create":
                // do something
                String name1 = request.getParameter("name") != null ? request.getParameter("name") : "";
                String description1 = request.getParameter("description")!= null ? request.getParameter("description") : "";
                String fecha1=request.getParameter("date")!= null ? request.getParameter("date") : "";
                double collection1 = Double.parseDouble(request.getParameter("collection"));

                BeanMovie beanMovie1 = new BeanMovie(0,name1, description1, fecha1, collection1, 0);

                if(new DaoMovie().create(beanMovie1)){
                    request.setAttribute("message", "Película modificada correctamente");
                } else {
                    request.setAttribute("message", "Película no modificada");
                }
                request.setAttribute("listMovies", new DaoMovie().findAllMovies());
                request.getRequestDispatcher("/views/movie/movies.jsp").forward(request, response);
                break;

            case "update":
                // do something
                int id = Integer.parseInt(request.getParameter("id")!= null ? request.getParameter("id") : "");
                String name = request.getParameter("name") != null ? request.getParameter("name") : "";
                String description = request.getParameter("description")!= null ? request.getParameter("description") : "";
                String fecha=request.getParameter("date")!= null ? request.getParameter("date") : "";
                double collection = Double.parseDouble(request.getParameter("collection"));

                BeanMovie beanMovie = new BeanMovie(id,name, description, fecha, collection, 0);

                if(new DaoMovie().update(beanMovie)){
                    request.setAttribute("message", "Película modificada correctamente");
                } else {
                    request.setAttribute("message", "Película no modificada");
                }
                request.setAttribute("listMovies", new DaoMovie().findAllMovies());
                request.getRequestDispatcher("/views/movie/movies.jsp").forward(request, response);
                break;
            case "delete":
                int id2 = Integer.parseInt(request.getParameter("id")!= null ? request.getParameter("id") : "");
                if (new DaoMovie().delete(id2)){
                    request.setAttribute("message", "Película eliminada correctamente");

                }else{
                    request.setAttribute("message", "Película no eliminada");
                }
                request.setAttribute("listMovies", new DaoMovie().findAllMovies());
                request.getRequestDispatcher("/views/movie/movies.jsp").forward(request, response); // do something
                break;
            default:
                // no supported
                break;
        }
    }
}
