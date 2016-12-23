package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map.Entry;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.corba.se.impl.oa.poa.ActiveObjectMap.Key;
import com.sun.javafx.collections.MappingChange.Map;

/**
 * Servlet implementation class Login
 */
@WebServlet("/servlet/Login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String name = request.getParameter("username");
		//用于过滤器中
		session.setAttribute("userid", name);

		String pwd = request.getParameter("password");
		//用于过滤器中
		session.setAttribute("userpwd", pwd);

		//连接数据库，取出数据库中的用户名与密码
		TreeSet<String> setname = new TreeSet<String>();
		
		try {
		      Connection connect = DriverManager.getConnection(
		          "jdbc:mysql://localhost:3306/db_one2","root","root");
		           //连接URL为   jdbc:mysql//服务器地址/数据库名  ，后面的2个参数分别是登陆用户名和密码

		     // System.out.println("Success connect Mysql server!");
		      Statement stmt = connect.createStatement();
		      ResultSet rs = stmt.executeQuery("select * from 登陆账号");
		                                                              //user 为你表的名称
		while (rs.next()) {
			setname.add(rs.getString("name")) ;
			
			
		       // System.out.println(rs.getString("name"));
		        //System.out.println(rs.getString("password"));
		      }
		    }
		    catch (Exception e) {
		      System.out.print("get data error!");
		      e.printStackTrace();
		    }
		
	
		
		String[] string = { "世俗", "周游","颜庆祥"};
		
		int i = 0;
		while (i < setname.size()) {

			if (string[i].equals(name) && "123456".equals(pwd)) {

				// if(string.equals(name)&&"123456".equals(pwd)){
				ServletContext context = getServletContext();
				RequestDispatcher rd = context.getRequestDispatcher("/login/login2.jsp");
				rd.forward(request, response);
				return;

			} else {
				i++;
			}
		}
		// }
		RequestDispatcher rd = request.getRequestDispatcher("/login/loginFail.jsp");
		rd.forward(request, response);
	}

	private Object i(int j) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
