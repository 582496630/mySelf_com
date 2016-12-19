package listener;

import java.io.UnsupportedEncodingException;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class OnlineUserListListener
 *
 */
@WebListener
public class OnlineUserListListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {
	private ServletContext app = null;
    /**
     * Default constructor. 
     */
    public OnlineUserListListener() {
        // TODO Auto-generated constructor stub
    }
    /**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
    	this.app = arg0.getServletContext();
        this.app.setAttribute("online", new TreeSet());
    }
    
    /**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent arg0)  { 
    	Set all = (Set)this.app.getAttribute("online");
        String name = (String)arg0.getValue();
        //有下面的语句，获取的用户名会乱码
       /*try {
			name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
        all.add(name);
        this.app.setAttribute("online", all);
    }
    
    /**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent arg0)  { 
    	Set all = (Set)this.app.getAttribute("online");
        all.remove(arg0.getValue());
        this.app.setAttribute("online", all);
    }
    
    /**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
Set all = (Set)this.app.getAttribute("online");
    	
    	if (all.size()>0) {
    		all.remove(arg0.getSession().getAttribute("username"));
		}
        this.app.setAttribute("online", all);
    }
    
    
    
    
    
    
    
    
    
    
    
	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    }
}
