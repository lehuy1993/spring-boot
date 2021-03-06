
package fa.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetailsService userDetailsService;

	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
	}

	@Override protected void configure(HttpSecurity http) throws Exception { 
		http.csrf().disable();
		http
        .authorizeRequests()
            .antMatchers("/register","/resources/**","/","/member/show").permitAll()
            .antMatchers("/member/**").hasAnyRole("MEMBER", "ADMIN")
            .antMatchers("/admin/**").hasRole("ADMIN")
            .antMatchers("/employee/**").hasAnyRole("EMPLOYEE", "ADMIN")
            .and()
        .formLogin()
            .loginPage("/login")
            .usernameParameter("userName")
            .passwordParameter("password")
            .defaultSuccessUrl("/")
            .failureUrl("/login?error")
            .permitAll()
            .and()
        .logout()
        	.logoutUrl("/logout")
        	.logoutSuccessUrl("/login?logout")
        	.and()
        .exceptionHandling()
            .accessDeniedPage("/403");
	}
}
