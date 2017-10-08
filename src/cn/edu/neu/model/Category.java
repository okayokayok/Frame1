package cn.edu.neu.model;

public class Category {
	private int cateId;
	private String cateName;
	private String catePic;
	private String cateDc;

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(int cateId, String cateName, String catePic, String cateDc) {
		super();
		this.cateId = cateId;
		this.cateName = cateName;
		this.catePic = catePic;
		this.cateDc = cateDc;
	}

	public int getCateId() {
		return cateId;
	}

	public void setCateId(int cateId) {
		this.cateId = cateId;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getCatePic() {
		return catePic;
	}

	public void setCatePic(String catePic) {
		this.catePic = catePic;
	}
	

	@Override
	public String toString() {
		return "Category [cateId=" + cateId + ", cateName=" + cateName + ", catePic=" + catePic + ", cateDc=" + cateDc
				+ "]";
	}

	public String getCateDc() {
		return cateDc;
	}

	public void setCateDc(String cateDc) {
		this.cateDc = cateDc;
	}

}
