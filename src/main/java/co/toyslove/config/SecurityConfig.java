package co.toyslove.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	String loginPage = "login";
		 http.csrf().disable()
		   .authorizeRequests()
		// 	.anyRequest().permitAll();
            // .anyRequest()
             .antMatchers("/admin/**")
             .authenticated()
             .and()
         .formLogin()
             .loginPage("/"+loginPage)
             .permitAll()
             .failureUrl("/"+loginPage+"?error=\"Error de autenticación\"");
		//super.configure(http);
	}

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication()
		.withUser("daniel").password("{noop}1234").roles("GENERAL")
		.and()
		.withUser("manuela").password("{noop}1234").roles("GENERAL")
		;
	}
	
	@Override
	  public void configure(WebSecurity web) throws Exception {
	    web
	      .ignoring()
	         .antMatchers("/resources/**"); 
	  }

}
