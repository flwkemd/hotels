package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;


@WebServlet(urlPatterns= {"*.me"}, initParams= {@WebInitParam(name="properties",value="C:\\Users\\flwke\\Downloads\\SHINSEUNGBUM (2)\\WebContent\\WEB-INF\\action.properties")})

public class ConreollerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map commandMap = new HashMap();

    public ConreollerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }//서블릿이 처음 요청될때 , 
    @Override
    public void init(ServletConfig config) throws ServletException{
    	String props = config.getInitParameter("properties");
    	Properties pr = new Properties();
    	FileInputStream f = null;
    	try {
    		f=new FileInputStream(props);
    		//f파일을 지정
    		
    		pr.load(f);
    	}catch(IOException e) {
    		throw new ServletException(e);
    	}finally {
    		try { if(f!=null)f.close();}
    		
    		catch(IOException e) {}
    	}
    	for(Object obj : pr.keySet()) {
    		//command : /message의 값
    		String command = (String)obj;
    		String className=pr.getProperty(command);
    		try {
    			//action.MessageAction 이름의 클래스를 class 화
    			Class commandClass = Class.forName(className);
    			//commandInstance : action.MessAction 클래스 객체 저장
    			Object commandInstance = commandClass.newInstance();
    			//action.properties에 설정된 이름의 클래스를 객체화하여 저장하는 map객체
    			commandMap.put(command, commandInstance);
    		}catch (Exception e) {
    			throw new ServletException(e);
    		}
    	}
    } //init 메서드 끝
    //요청시 마다 get방식 요청이면 deGet 메서드를 호출 , post 방식이면 dopost 메서드를 호출


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		Action action = null;
		ActionForward forward = null;
		String command = null;
		try {
			//command : /jspstudy2/message.me
			command = request.getRequestURI();
			//request.getContextPath() : /jspstudy2
			if(command.indexOf(request.getContextPath())==0) {
				command = command.substring(request.getContextPath().length());
			}
			action = (Action)commandMap.get(command);
			forward=action.execute (request, response);
		}catch (Exception e) {
			throw new ServletException(e);
		} if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}else {
			response.sendRedirect("nopage.jsp");
		}
	}

}
