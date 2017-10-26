package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.BoardAllAction;

@WebServlet(
		urlPatterns={"*.bo"},
		initParams={@WebInitParam(
				name="properties",
				//value="C:\\Users\\GD\\eclipse-Shin\\jspstudy2\\WebContent\\WEB-INF\\method.properties"
				value="C:\\Users\\flwke\\Downloads\\SHINSEUNGBUM (2)\\WebContent\\WEB-INF\\method.properties"
				)}
		)
public class ControllerMethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Properties pr = new Properties();
	public ControllerMethodServlet() {
		super();
	}
	@Override
	   public void init(ServletConfig config)
	         throws ServletException{
		  //prop : method.properties 파일의 절대 경로
	      String prop = config.getInitParameter("properties");
	      FileInputStream f = null;
	      try{
	         f = new FileInputStream(prop);
	         pr.load(f);
	      }catch(Exception e){
	         throw new ServletException(e);
	      }finally{
	         try{if(f != null)f.close();   }
	         catch(Exception e){}
	      }
	   }
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      doPost(request,response);
	   }

	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("euc-kr");
	      ActionForward forward = null;
	      String command = null;
	      try{
	         command = request.getRequestURI();
	         if(command.indexOf(request.getContextPath())==0){
	            command = command.substring(request.getContextPath().length());
	            //commend : /model2/board/writeForm.bo
	            //paramtypes : 매개변수의 자료형
	         }
	         Class[] paramTypes = new Class[]
	               {HttpServletRequest.class,
	                     HttpServletResponse.class};
	         //paramObject : 매서드에 전달할 매개변수 값
	         Object[] paramObjs = new Object[]{request,response};
	         //methodName : writForm
	         String methodName = pr.getProperty(command);
	         /*
	          * BoardAllAction 클래스에서 이름이 writeForm 이면서
	          * 매개변수의 자료형이 
	          * HttpServletRequest.class와
	          * HttpServletResponse.class인 메서드를 객체로 리턴
	          */
	         Method method = BoardAllAction.class.getMethod(methodName, paramTypes);
	         BoardAllAction action = new BoardAllAction();
	         //invoke : 메서드를 호출
	         forward=(ActionForward)
	               method.invoke(action, paramObjs);
	      }catch(Exception e){
	         throw new ServletException(e);

	      }
	      if(forward != null){
	         if(forward.isRedirect())
	            response.sendRedirect(forward.getPath());
	         else{
	            RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
	            dispatcher.forward(request,response);
	         }   
	      }
	   }
	}