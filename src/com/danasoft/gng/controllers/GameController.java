package com.danasoft.gng.controllers;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GameController
 */
@WebServlet("/GameController")
public class GameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static int numGuesses = 0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GameController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int low = Integer.parseInt(request.getParameter("low"));
		int high = Integer.parseInt(request.getParameter("high"));
		int delta = high - low;
		session.setAttribute("low", low);
		session.setAttribute("high",high);
		Random rand = new Random();
		int randomNumber = rand.nextInt(delta) + low;
		session.setAttribute("randomNumber", randomNumber);
		RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(request.getParameter("num") != null) {
			int num = Integer.parseInt(request.getParameter("num"));
			session.setAttribute("num", num);
		} else {
			session.setAttribute("num", null);
			session.setAttribute("randomNumber", null);
		}
		
		response.sendRedirect("/GreatNumberGame");
//		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/GreatNumberGame.jsp");
//		view.forward(request, response);
	}

}
