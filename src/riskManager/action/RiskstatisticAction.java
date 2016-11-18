package riskManager.action;

import java.util.*;
import javax.servlet.ServletContext;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;

//import riskManager.model.Risk;
import riskManager.service.RiskService;

public class RiskstatisticAction extends BaseAction{

	@Autowired
	private RiskService riskService;
	
	SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
	String success="success";
	
	@Override
	public String execute(){
		
		ServletContext sc=request.getServletContext();
		
	//	String sorttype=request.getParameter("sorttype");
		String timestart=request.getParameter("searchtimestart");
		String timeend=request.getParameter("searchtimeend");
		
		Date start=null;
		Date end=null;
		try {
			start=f.parse(timestart);
			end=f.parse(timeend);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<Integer> resultidentify=riskService.statisticIdentify(start, end);
		List<Integer> resultfault=riskService.statisticFault(start, end);
		
		int sizeidentify=resultidentify.size();
		String[] identifyrisklist=new String[sizeidentify];
		for(int i=0;i<sizeidentify;i++){
			identifyrisklist[i]=Integer.toString(resultidentify.get(i));
		}
		
		int sizefault=resultfault.size();
		String[] faultrisklist=new String[sizefault];
		for(int i=0;i<sizefault;i++){
			faultrisklist[i]=Integer.toString(resultfault.get(i));
		}
		
		sc.setAttribute("identifyrisklist", identifyrisklist);
		sc.setAttribute("faultrisklist", faultrisklist);
		
		/**
		if(sorttype.equals("identify")){
			
		}else{
			if(sorttype.equals("fault")){
				
			}else{
				success="incomplete condition";
			}
		}*/
		
		return success;
	}
}
