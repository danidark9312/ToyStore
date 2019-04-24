package co.toyslove.util;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

@Component
public class TemplateReader {
	
	public String getTemplate(String templateName) {
		File file = null;
		String templateContent = null;
		try {
			file = new ClassPathResource("template/"+templateName+".html").getFile();
			System.out.println(file.getAbsolutePath());
			templateContent = Files.readAllLines(file.toPath(),StandardCharsets.ISO_8859_1).stream().reduce("", String::concat);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("template couldn't be loaded");
		}
		return templateContent;
	}
	
}
