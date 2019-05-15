package co.toyslove.config;

import java.text.NumberFormat;
import java.util.Locale;
import java.util.Properties;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import co.toyslove.util.EmailSender;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "co.toyslove")
@PropertySource("classpath:parameter.properties")
public class WebMvcConfig implements WebMvcConfigurer {

//	@Bean
//	public ViewResolver getViewResolver() {
//		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//		resolver.setPrefix("/WEB-INF/views/");
//		resolver.setSuffix(".jsp");
//		return resolver;
//	}

	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp().prefix("/WEB-INF/views/").suffix(".jsp");
	}
	// @Bean
	// public MessageSource messageSource() {
	// ResourceBundleMessageSource messageSource = new
	// ResourceBundleMessageSource();
	// messageSource.setBasename("messages");
	// return messageSource;
	// }

	

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("shop");
	}
	


	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
	    CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
	    multipartResolver.setDefaultEncoding("utf-8");
	    // multipartResolver.setMaxUploadSize(100000);
	    return multipartResolver;
	}
	
	@Bean
	public JavaMailSender getJavaMailSender() {
		String username = "maestramagaliceleste@gmail.com";
		String password = "ayudaspoderosas";
		
	    JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
	    mailSender.setHost("smtp.gmail.com");
	    mailSender.setPort(587);
	    mailSender.setUsername(username);
	    mailSender.setPassword(password);
	     
	    Properties props=new Properties(); 
	    // props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.debug", "true");
	    
	    mailSender.setJavaMailProperties(props);
	     
	    return mailSender;
	}
	
	@Bean(name = "currencyFormat")
	public NumberFormat getCurrencyFormat() {
		NumberFormat currencyInstance = NumberFormat.getCurrencyInstance(new Locale("es", "CO"));
		currencyInstance.setMaximumFractionDigits(0);
		return currencyInstance;
	}
	
	

}
