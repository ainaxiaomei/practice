package com.snail.audio.admin.json.jsonObject;

public class JsonTreeBulider{
	 String id;
	 String parent;
	 String text;
	 String icon;
	 JsonTreeState state ;
	 JsonTreeLiAttr li_attr =new JsonTreeLiAttr();
	 JsonTreeBulider(String id, String parent){
    	this.id=id;
    	this.parent=parent;
    }
	 public JsonTreeBulider(){
	 }
    public JsonTreeBulider text(String text){
    	this.text=text;
    	return this;
    }
    public JsonTreeBulider icon(String icon){
    	this.icon=icon;
    	return this;
    }
    public JsonTreeBulider state(JsonTreeState state){
    	this.state=state;
    	return this;
    }
    public JsonTreeBulider group(String group){
    	this.li_attr.setGroup(group);
    	return this;
    }
    public JsonTreeBulider level(String level){
    	this.li_attr.setLevel(level);
    	return this;
    }
    public JsonTreeBulider groupServerId(String groupServertId){
    	this.li_attr.setGroupMucServerId(groupServertId);
    	return this;
    }
    public JsonTreeBulider liAttr(JsonTreeLiAttr li_attr){
    	this.li_attr=li_attr;
    	return this;
    }
    public JsonTree build(){
		return new JsonTree(this);
    	
    }
   
    
}