package com.oceanview.model;

public class Room {
	
	private int roomId;
	private String roomType;
	private double pricePerNight;
	private String status;
	
	public int getRoomId() { return roomId; }
	public void setRoomId(int roomId) { this.roomId = roomId; }
	
	public String getRoomType() { return roomType; }
	public void setRoomType(String roomType) { this.roomType = roomType; }
	
	public double getPricePerNight() { return pricePerNight; }
	public void setPricePerNight(double pricePerNight) { this.pricePerNight = pricePerNight; }
	
	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }
}