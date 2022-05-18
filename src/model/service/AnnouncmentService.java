package model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import bean.Announcement;
import bean.Doctor;
import model.dao.AnnouncmentDao;
import utils.ResultDate;
import utils.Util;

/**
 * @author h w j
 * @instruction
 * 宣传信息的Service
 */
public class AnnouncmentService {

	AnnouncmentDao announcmentDao = new AnnouncmentDao();

	
	/**
	 * 查询符合条件的宣传信息
	 * 
	 * @param search 封装了查询条件的Map集合
	 * @return 查询到的宣传信息列表
	 */
	public List<Announcement> listSearch(Map<String, String> search) {

		return announcmentDao.listSearch(search);
	}


	/**
	 * 切换宣传信息的显示和隐藏，0隐藏，1显示
	 * @param announcmentId 要切换的公告id
	 * @param action 要更新到的状态
	 * @param response 响应对象
	 */
	public void toggleDoctorActive(String announcmentId, String action, HttpServletResponse response) {


		int i = announcmentDao.toggleClientActive(announcmentId, action);

		ResultDate rd = new ResultDate();
		if (i == 1) {
			// 修改成功
			rd.setIsSuccess(true);
			rd.setMsg("修改成功");

		} else {

			// 修改失败
			rd.setIsSuccess(false);
			rd.setMsg("失败，请刷新页面后重试");

		}

		// 响应，JSON格式数据
		Util.responseJson(rd, response);

			
	}


	/**
	 * 根据announcementId，返回一条宣传信息，响应给客户端
	 * @param announcementId 宣传信息id
	 * @param response 响应对象
	 */
	public void getAnnouncementToResponse(int announcementId, HttpServletResponse response) {
		Announcement announcement = announcmentDao.getAnnouncement(announcementId);

		ResultDate rd = new ResultDate();
		if (announcement != null) {
			// 成功
			rd.setIsSuccess(true);
			rd.setMsg("查询成功");
			rd.getDataList().add(announcement);

		} else {

			// 查询失败
			rd.setIsSuccess(false);
			rd.setMsg("失败，请刷新页面后重试");

		}

		// 响应，JSON格式数据
		Util.responseJson(rd, response);
		
	}


	/**
	 * 增加一条宣传信息
	 * @param announcement 要增加的宣传对象
	 * @param response 响应对象
	 */
	public void addAnnouncement(Announcement announcement, HttpServletResponse response) {

		int i = announcmentDao.addAnnouncement(announcement);

		ResultDate rd = new ResultDate();
		if (i == 1) {
			// 创建公告成功
			rd.setIsSuccess(true);
			rd.setMsg("创建公告成功");

		} else {

			// 修改失败
			rd.setIsSuccess(false);
			rd.setMsg("失败，请刷新页面后重试");

		}

		// 响应，JSON格式数据
		Util.responseJson(rd, response);
		
	}


	/**
	 * 查询所有显示的宣传信息（最新num条）
	 * @param num 查询的宣传信息数量
	 * @return 最新的num条公告的列表
	 */
	public ArrayList<Announcement> getAnnouncmentNum(int num) {
		
		return announcmentDao.getAnnouncmentNum(num);
	}
	
}
