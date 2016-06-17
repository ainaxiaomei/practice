package com.snail.audio.admin.json.jsonObject;

public class JsonTree {
    private String id;
    private String parent;
    private String text;
    private String icon;
    private JsonTreeState state;
    private JsonTreeLiAttr li_attr     ;
	public JsonTreeLiAttr getLi_attr() {
		return li_attr;
	}
	public void setLi_attr(JsonTreeLiAttr li_attr) {
		this.li_attr = li_attr;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public JsonTreeState getState() {
		return state;
	}
	public void setState(JsonTreeState state) {
		this.state = state;
	}
    
}
