package riskManager.service;

import java.util.List;

import riskManager.model.Risk;

public interface RiskService {
	Risk save(Risk risk);
	
	List<Risk> findByPid(int pid);
	
	Risk findByRid(int rid);
	
	Risk update(Risk risk);
}
