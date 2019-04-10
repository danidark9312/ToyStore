package co.toyslove.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class Util {
	/**
	 * Metodo que guarda una imagen atraves de un formulario HTML al disco duro.
	 * @param multiPart
	 * @param request
	 * @return
	 */
	public static String guardarImagen(MultipartFile multiPart, HttpServletRequest request,String prefix) {
		String nombreOriginal = multiPart.getOriginalFilename();
		nombreOriginal = nombreOriginal.replace(" ", "-");
		String nombreFinal = randomAlphaNumeric(8)+nombreOriginal;
		String rutaFinal = request.getServletContext().getRealPath("/resources/images/"+prefix+"/");
		try {
			Path folder = Paths.get(rutaFinal);
			File imageFile = new File(rutaFinal + nombreFinal);
			if(!Files.exists(folder))
				Files.createDirectory(folder);
			
			System.out.println(imageFile.getAbsolutePath());
			multiPart.transferTo(imageFile);
			return nombreFinal;
		} catch (IOException e) {
			System.out.println("Error " + e.getMessage());
			return null;
		}
	}
	
	/**
	 * Metodo para generar una cadena aleatoria de longitud N
	 * @param count
	 * @return
	 */
	public static String randomAlphaNumeric(int count) {
		String CARACTERES = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		StringBuilder builder = new StringBuilder();
		while (count-- != 0) {
			int character = (int) (Math.random() * CARACTERES.length());
			builder.append(CARACTERES.charAt(character));
		}
		return builder.toString();
	}

}
