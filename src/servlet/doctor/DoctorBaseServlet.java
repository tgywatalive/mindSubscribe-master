package servlet.doctor;

import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Announcement;
import bean.Client;
import bean.Doctor;
import bean.Message;
import bean.MessageBoard;
import model.service.*;
import servlet.client.ClientLoginServlet;

/**
 * @author h w j
 * @instruction
 * 场地管理员端，首页，修改基本信息(包括密码)控制器
 */
public class DoctorBaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	DoctorService doctorService = new DoctorService();

	MessageBoardService messageBoardService = new MessageBoardService();

	MessageService messageService = new MessageService();

	AnnouncmentService announcmentService = new AnnouncmentService();

	ClientService clientService = new ClientService(); // 新建代码

	ClientArchiveService clientArchiveService = new ClientArchiveService(); // 新建代码

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String m = request.getParameter("m");
		
		// 当前登录用户
		Doctor doctorNow = (Doctor) request.getSession().getAttribute(DoctorLoginServlet.LOGIN_DOCTOR);

		if ("updatePwd".equals(m)) {

			// 修改密码

			String newPwd = request.getParameter("newPwd");

			String password = request.getParameter("password");

			String msg = "";
			if (doctorNow.getDoctorPwd().equals(password)) {

				// 成功
				doctorService.updateDoctorPwd(doctorNow.getDoctorId(), newPwd);

				msg = "{\"result\":\"true\",\"msg\":\"修改成功,请重新登录！\"}";

				request.getSession().removeAttribute(ClientLoginServlet.LOGIN_CLIENT);

			} else if (!doctorNow.getDoctorPwd().equals(password)) {
				msg = "{\"result\":\"false\",\"msg\":\"修改失败，原始密码错误！\"}";
			} else {
				msg = "{\"result\":\"false\",\"msg\":\"修改失败，请重试！\"}";
			}

			response.setContentType("application/json; charset=utf-8");

			Writer writer = response.getWriter();

			writer.write(msg);

			writer.close();

		} else if ("doctorIndex".equals(m)) {

			// 查数据（首页用到的）

			//查询共有多少注册来访者
			int clientNum = clientService.getClientNum();

			request.setAttribute("clientNum", clientNum);

			//查询共有多少咨询记录
			int clientArchive = clientArchiveService.getClientArchiveNum();

			request.setAttribute("clientArchive", clientArchive);

			// 查询所有显示的留言(最新的十条）
			ArrayList<MessageBoard> newMessageBoardList = messageBoardService.getMessageBoardNum(10);

			request.setAttribute("newMessageBoardList", newMessageBoardList);

			// 查询所有未读的消息(最新的十条）
			ArrayList<Message> messageList = messageService.getMessageNum(10, doctorNow.getDoctorId(), "doctor");

			request.setAttribute("messageList", messageList);

			// 查询所有显示的宣传信息(最新的十条)
			ArrayList<Announcement> announcmentList = announcmentService.getAnnouncmentNum(10);

			request.setAttribute("announcmentList", announcmentList);

			// 转发到首页(学生用户和场地管理员共用一个首页) 这里已改
			request.getRequestDispatcher("/doctor/home.jsp").forward(request, response);

		} else if ("doctorInfo".equals(m)) {

			// 查看个人信息

			request.getRequestDispatcher("/doctor/doctor_info.jsp").forward(request, response);
		}

	}

}
