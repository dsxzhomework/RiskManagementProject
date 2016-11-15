package riskManager.action;

import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import riskManager.model.Risk;
import riskManager.service.RiskService;

public class RiskAction extends BaseAction{
	
	@Autowired
	private RiskService riskService;
	
	String success = "success";
	String fail = "fail";
	int rid;
	int pid;
	String name;	
	String content;
	int possibility;
	int affect;
	String trigger;
	int state;//
	int provider;//uid
	int tracker;//uid
	public RiskService getRiskService() {
		return riskService;
	}

	public void setRiskService(RiskService riskService) {
		this.riskService = riskService;
	}

	
	public String add(){
		if(request.getParameter("name")==""||request.getParameter("content")==""||request.getParameter("trigger")==""
				||request.getParameter("possibility")==""||request.getParameter("affect")==""){
			return fail;
		}
		
		name = request.getParameter("name");
		content = request.getParameter("content");
		trigger = request.getParameter("trigger");
		possibility = Integer.parseInt(request.getParameter("possibility"));
		affect = Integer.parseInt(request.getParameter("affect"));
		
		ServletContext sc = request.getServletContext();
		pid = (int) sc.getAttribute("pid");//
		provider =  (int) sc.getAttribute("uid");//
		
		Risk risk = new Risk(pid,name, content, possibility, affect, trigger, provider);
		risk = riskService.save(risk);
		sc.setAttribute("rid",risk.getRid());
		System.out.println("add.action"+risk.getRid());
		return success;
	}
	
	public String change(){
		ServletContext sc = request.getServletContext();
		rid =(int) sc.getAttribute("rid");
		Risk risk = riskService.findByRid(rid);
		state = risk.getState();
		if(state==2){
			return fail;
		}
		risk.setState(++state);
		risk = riskService.update(risk);
		sc.setAttribute("state", risk.getState());
		return success;	
	}
	
	public String show(){
		ServletContext sc = request.getServletContext();
		if(request.getParameter("rid")!=null){
			rid = Integer.parseInt(request.getParameter("rid"));
		}
		else{
			rid =(int)sc.getAttribute("rid");
		}
		System.out.println(rid);
		Risk risk = riskService.findByRid(rid);
		
		sc.setAttribute("rid", rid);
		sc.setAttribute("rname", risk.getName());
		sc.setAttribute("content", risk.getContent());
		sc.setAttribute("possibility", risk.getPossibility());
		sc.setAttribute("affect", risk.getAffect());
		sc.setAttribute("trigger", risk.getThetrigger());
		sc.setAttribute("state",risk.getState());
		sc.setAttribute("provider", risk.getAffect());//pname
		sc.setAttribute("tracker", risk.getTracker());//pname
		
		return success;	
	}
	
	
}
