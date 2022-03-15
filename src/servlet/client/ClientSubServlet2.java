package servlet.client;

import bean.Client;
import bean.ClientArchive;
import bean.Doctor;
import bean.Question;
import model.service.ClientArchiveService;
import model.service.DoctorService;
import model.service.QuestionService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Servlet implementation class ClientSubServlet 普通来访者的预约咨询业务
 */

/**
 * @author h w j
 * @instruction
 * 来访者端，预约业务流程控制器
 */
public class ClientSubServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	DoctorService doctorService = new DoctorService();

	ClientArchive clientArchive = new ClientArchive();

	ClientArchiveService clientArchiveService = new ClientArchiveService();
	
	QuestionService questionService = new QuestionService();

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String m = request.getParameter("m");

		// 当前登录用户
		Client clientNow = (Client) request.getSession().getAttribute(ClientLoginServlet.LOGIN_CLIENT);

		/*// 管理员权限输入
		Doctor doctorNow = (Doctor) request.getSession().getAttribute(DoctorLoginServlet.LOGIN_DOCTOR);*/

		
	 if ("subStep3".equals(m)) {
			// 查看其他人申请详情


			// 显示正在咨询中的

			/*List<ClientArchive> list = clientArchiveService.subOnList(clientArchive.getDoctorId());

			request.setAttribute("clientArchiveList", list);*/


			request.getRequestDispatcher("/client/subOnList.jsp").forward(request, response);

		}


	}

}
