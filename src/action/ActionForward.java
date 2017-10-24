package action;

public class ActionForward {
	private boolean isRedirect;
	private String path;
	
	public ActionForward() {}
	public ActionForward (boolean inRedirect, String path) {
		this.isRedirect = isRedirect;
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;		
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;	
	}
	public void setPath(String path) {
		this.path = path;
	}
}
