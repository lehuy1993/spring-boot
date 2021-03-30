package fa.spring.service;

import java.util.List;

import fa.spring.model.Type;

public interface TypeService {
	
	List<Type> getAllType();
	void save(Type type);
	

}
