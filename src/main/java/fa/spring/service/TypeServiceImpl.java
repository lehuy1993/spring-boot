package fa.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.spring.model.Type;
import fa.spring.repository.TypeRepository;

@Service
public class TypeServiceImpl implements TypeService {

	@Autowired
	private TypeRepository typeRepository;

	@Override
	public List<Type> getAllType() {
		return typeRepository.findAll();
	}

	@Override
	public void save(Type type) {
		// TODO Auto-generated method stub
		typeRepository.save(type);
	}
}
