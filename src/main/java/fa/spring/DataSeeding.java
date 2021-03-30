/*
 * package fa.spring;
 * 
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.context.ApplicationListener; import
 * org.springframework.context.event.ContextRefreshedEvent; import
 * org.springframework.stereotype.Component;
 * 
 * import fa.spring.model.Roles; import fa.spring.model.Type; import
 * fa.spring.repository.RoleRepository; import fa.spring.service.TypeService;
 * 
 * @Component public class DataSeeding implements
 * ApplicationListener<ContextRefreshedEvent>{
 * 
 * @Autowired private RoleRepository roleRepository;
 * 
 * @Autowired private TypeService typeService;
 * 
 * 
 * @Override public void onApplicationEvent(ContextRefreshedEvent event) { //
 * TODO Auto-generated method stub
 * 
 * // Roles if (roleRepository.findByRoleName("ROLE_ADMIN") == null) {
 * roleRepository.save(new Roles("ROLE_ADMIN")); } if
 * (roleRepository.findByRoleName("ROLE_EMPLOYEE") == null) {
 * roleRepository.save(new Roles("ROLE_EMPLOYEE")); }
 * 
 * if (roleRepository.findByRoleName("ROLE_MEMBER") == null) {
 * roleRepository.save(new Roles("ROLE_MEMBER")); } //Type List<Type> types =
 * typeService.getAllType(); if (types == null) { typeService.save(new
 * Type("Humor")); typeService.save(new Type("Act")); typeService.save(new
 * Type("Affection"));
 * 
 * }
 * 
 * 
 * }
 * 
 * }
 */