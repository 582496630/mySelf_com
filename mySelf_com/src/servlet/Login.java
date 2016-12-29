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

import com.mysql.jdbc.PreparedStatement;
import com.sun.corba.se.impl.oa.poa.ActiveObjectMap.Key;
import com.sun.javafx.collections.MappingChange.Map;

/**
 * Servlet implementation class Login
 */
@WebServlet("/servlet/Login")
public class Login extends HttpServlet {
	
	//声明所需的常量  驱动、数据库地址、用户名、密码
	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL ="jdbc:mysql://localhost:3306/db_one2";
	public static final String DBUSER = "root";
	public static final String DBPWD = "root";

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
			Class.forName(DBDRIVER);
			Connection conn= DriverManager.getConnection(DBURL, DBUSER, DBPWD);
			String sql = "select * from 登陆账号";
			PreparedStatement prest = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet re = prest.executeQuery();
			while(re.next()){
				String username = re.getString("name");
				String password = re.getString("password");
				setname.add(username);
				setname.add(password);
				System.out.println(setname.size());
			}
			
			//关闭数据流，只有在IO与数据库时用到了关闭数据流
			re.close();
			prest.close();
			conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//把set集合放到数组内
		Object[] strarray = setname.toArray();
		
	
		
		//String[] string = { "世俗", "周游","颜庆祥"};
		
		int i = 0;
		while (i < setname.size()) {

			if (strarray[i].equals(name) && "123456".equals(pwd)) {

				// if(string.equals(name)&&"123456".equals(pwd)){
				//ServletContext context = getServletContext();运行无问题后可以删除 考试中发现
				RequestDispatcher rd = request.getRequestDispatcher("/login/login2.jsp");
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
