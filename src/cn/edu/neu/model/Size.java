package cn.edu.neu.model;

import java.util.List;

public class Size {
	private int sizeId;
	private String sizeName;
	
	
	public Size() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Size(int sizeId, String sizeName, List<Goods> goods) {
		super();
		this.sizeId = sizeId;
		this.sizeName = sizeName;
		
	}
	public int getSizeId() {
		return sizeId;
	}
	public void setSizeId(int sizeId) {
		this.sizeId = sizeId;
	}
	public String getSizeName() {
		return sizeName;
	}
	public void setSizeName(String sizeName) {
		this.sizeName = sizeName;
	}
	
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(obj instanceof Size){
			if(((Size) obj).getSizeId()==this.getSizeId())
				return true;
		}
		return super.equals(obj);
	}

	@Override
	public String toString() {
		return "Size [sizeId=" + sizeId + ", sizeName=" + sizeName +  "]";
	}
	
}
