package com.model.function.DTO;

public class MessageDTO {

	private int num;
	private String send;
	private String receive;
	private String message;
	private String date;

	
	public MessageDTO(String send, String receive, String message) {
		this.send = send;
		this.receive = receive;
		this.message = message;
	}
	
	public MessageDTO(int num, String send, String receive, String message, String date) {
		this.num = num;
		this.send = send;
		this.receive = receive;
		this.message = message;
		this.date = date;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSend() {
		return send;
	}

	public void setSend(String send) {
		this.send = send;
	}

	public String getReceive() {
		return receive;
	}

	public void setReceive(String receive) {
		this.receive = receive;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
