package fa.spring.repository;

import org.springframework.data.repository.CrudRepository;

import fa.spring.model.Roles;

public interface RoleRepository extends CrudRepository<Roles, Integer> {

	

	Roles findByRoleName(String roleName);
}
