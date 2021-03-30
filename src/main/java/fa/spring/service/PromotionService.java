package fa.spring.service;

import java.util.List;
import java.util.Optional;

import fa.spring.model.Promotion;

public interface PromotionService {
    
	void save(Promotion promotion);
	List<Promotion> getAll();
	Optional<Promotion> findBypromotionId(int promotionId);
	void delete(int promotionId);
}
