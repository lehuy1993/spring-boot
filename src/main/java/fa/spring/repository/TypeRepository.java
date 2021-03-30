package fa.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import fa.spring.model.Type;

@Repository
public interface TypeRepository extends JpaRepository<Type, Integer> {

}
