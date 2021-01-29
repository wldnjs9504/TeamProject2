package net.product.action;

public class ActionForward {
	//페이지를 이동할때 필요한 정보를 저장하는 객체
	//1. 이동할 주소
	//2. 이동할 방식(response, forward)
	
	//이동주소
	private String path;
	//이동방식 
	// true : sendRedirect 방식으로 이동
	// false : forward 방식으로 이동
	private boolean isRedirect;
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	
}
