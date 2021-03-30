package fa.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.spring.model.Promotion;
import fa.spring.repository.PromotionRepository;

@Service
public class PromotionServiceImpl implements PromotionService {

	@Autowired
	private PromotionRepository promotionRepository;
	@Override
	public void save(Promotion promotion) {
		// TODO Auto-generated method stub
		promotionRepository.save(promotion);
	}

	@Override
	public List<Promotion> getAll() {
		// TODO Auto-generated method stub
		return promotionRepository.findAll();
	}

	@Override
	public Optional<Promotion> findBypromotionId(int promotionId) {
		// TODO Auto-generated method stub
		return promotionRepository.findById(promotionId);
	}

	@Override
	public void delete(int promotionId) {
		// TODO Auto-generated method stub
		promotionRepository.deleteById(promotionId);
	}

   
}
