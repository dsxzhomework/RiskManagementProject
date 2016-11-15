package riskManager.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="risks")
public class Risk implements Serializable{
	@Id
	private int rid;
	private int pid;
	private String name;	
	private String content;
	private int possibility;
	private int affect;
	private String thetrigger;
	private int state;//未锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
	private int provider;//uid
	private int tracker;//uid
	
	
	public Risk(){
		super();
	}
	
	public Risk(int pid, String name, String content, int possibility, int affect, String trigger,
			int provider) {
		
		this.pid = pid;
		this.name = name;
		this.content = content;
		this.possibility = possibility;
		this.affect = affect;
		this.thetrigger = trigger;
		this.provider = provider;
		this.state = 0;
		this.tracker = provider;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

	public String getThetrigger() {
		return thetrigger;
	}
	public void setThetrigger(String thetrigger) {
		this.thetrigger = thetrigger;
	}
	public int getPossibility() {
		return possibility;
	}

	public void setPossibility(int possibility) {
		this.possibility = possibility;
	}

	public int getAffect() {
		return affect;
	}

	public void setAffect(int affect) {
		this.affect = affect;
	}

	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getProvider() {
		return provider;
	}

	public void setProvider(int provider) {
		this.provider = provider;
	}

	public int getTracker() {
		return tracker;
	}

	public void setTracker(int tracker) {
		this.tracker = tracker;
	}
	
}
