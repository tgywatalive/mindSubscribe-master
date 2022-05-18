package bean;

import java.util.Date;

/**
 * @author h w j
 * @instruction
 * 留言板  messageBoard ,对应的实体类
 */
public class MessageBoard {

	/**
	 * 报修id
	 */
	private Integer boardId ;
	
	/**
	 * 报修内容
	 */
	private String context ;
	
	/**
	 * 报修创建者Id
	 */
	private Integer createrId ;
	
	/**
	 * 报修时间
	 */
	private Date createTime;
	
	/**
	 * 是否显示
	 */
	private Integer isActive;
	
	/**
	 * 创建留言的来访者
	 * @return
	 */
	private Client client;
	//doctor添加
	private Doctor doctor;

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Integer getCreaterId() {
		return createrId;
	}

	public void setCreaterId(Integer createrId) {
		this.createrId = createrId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getIsActive() {
		return isActive;
	}

	public void setIsActive(Integer isActive) {
		this.isActive = isActive;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}
	//添加doctor
	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}


	/*@Override
	public String toString() {
		return "MessageBoard [boardId=" + boardId + ", context=" + context + ", createrId=" + createrId
				+ ", createTime=" + createTime + ", isActive=" + isActive + ", client=" + client + "]\n";
	}*/

	@Override
	public String toString() {
		return "MessageBoard [boardId=" + boardId + ", context=" + context + ", createrId=" + createrId
				+ ", createTime=" + createTime + ", isActive=" + isActive + ", doctor=" + doctor + "]\n";
	}
	
}

