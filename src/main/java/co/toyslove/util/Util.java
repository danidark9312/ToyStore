package co.toyslove.util;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.RenderingHints;
import java.awt.Toolkit;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.swing.JPanel;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class Util {
	
	@Value( "${uploadFile.folder}" )
	private String filePath;
	
	/**
	 * Metodo que guarda una imagen atraves de un formulario HTML al disco duro.
	 * @param multiPart
	 * @param request
	 * @return
	 */
	public String saveImage(MultipartFile multiPart, HttpServletRequest request,String prefix) {
		System.out.println("Param: "+filePath);
		String nombreOriginal = multiPart.getOriginalFilename();
		nombreOriginal = nombreOriginal.replace(" ", "-");
		String nombreFinal = randomAlphaNumeric(8)+nombreOriginal;
		String rutaFinal = filePath+prefix+"/";
		try {
			Path folder = Paths.get(rutaFinal);
			File imageFile = new File(rutaFinal + nombreFinal);
			if(!Files.exists(folder))
				Files.createDirectory(folder);
			
			System.out.println(imageFile.getAbsolutePath());
			multiPart.transferTo(imageFile);
			//resizeV2(multiPart.getInputStream(), imageFile.getAbsolutePath(), 800, 800);
			
			return nombreFinal;
		} catch (IOException e) {
			System.out.println("Error " + e.getMessage());
			return null;
		}
	}
	
	 public static File resize(File file, int width, int height) throws Exception
	    {
	        Image img = Toolkit.getDefaultToolkit().getImage( file.getAbsolutePath() );
	        loadCompletely(img);
	        BufferedImage bm = toBufferedImage(img);
	        bm = resizeV2(bm, width, height);

	        StringBuilder sb = new StringBuilder();
	        sb.append( bm.hashCode() ).append(".png");
	        String filename = sb.toString(); 

	        File result = new File( filename );
	        ImageIO.write(bm, "png", result);

	        return result;
	    }
	 
	 public static void loadCompletely (Image img)
	    {
	        MediaTracker tracker = new MediaTracker(new JPanel());
	        tracker.addImage(img, 0);
	        try {
	            tracker.waitForID(0);
	        } catch (InterruptedException ex) {
	            throw new RuntimeException(ex);
	        }
	    }
	
	 
	 public static BufferedImage toBufferedImage(Image img)
	    {
	        if (img instanceof BufferedImage)
	        {
	            return (BufferedImage) img;
	        }

	        BufferedImage bimage = new BufferedImage(img.getWidth(null), img.getHeight(null), BufferedImage.TYPE_INT_ARGB);

	        bimage.getGraphics().drawImage(img, 0, 0 , null);
	        bimage.getGraphics().dispose();

	        return bimage;
	    }
	
	 public static void resize(InputStream inputImagePath,
	            String outputImagePath, int scaledWidth, int scaledHeight)
	            throws IOException {
	        // reads input image
	        
	        BufferedImage inputImage = ImageIO.read(inputImagePath);
	 
	        // creates output image
	        BufferedImage outputImage = new BufferedImage(scaledWidth,
	                scaledHeight, inputImage.getType());
	 
	        // scales the input image to the output image
	        Graphics2D g2d = outputImage.createGraphics();
	        g2d.drawImage(inputImage, 0, 0, scaledWidth, scaledHeight, null);
	        g2d.dispose();
	 
	        // extracts extension of output file
	        String formatName = outputImagePath.substring(outputImagePath
	                .lastIndexOf(".") + 1);
	 
	        // writes to output file
	        ImageIO.write(outputImage, formatName, new File(outputImagePath));
	    }
	 
	 public static BufferedImage resizeV2(BufferedImage image, int areaWidth, int areaHeight) throws IOException{
		 	//BufferedImage image = ImageIO.read(inputImagePath);
		 	BufferedImage resized = null;
	        float scaleX = (float) areaWidth / image.getWidth();
	        float scaleY = (float) areaHeight / image.getHeight();
	        float scale = Math.min(scaleX, scaleY);
	        int w = Math.round(image.getWidth() * scale);
	        int h = Math.round(image.getHeight() * scale);

	        int type = image.getTransparency() == Transparency.OPAQUE ? BufferedImage.TYPE_INT_RGB : BufferedImage.TYPE_INT_ARGB;

	        boolean scaleDown = scale < 1;

	        if (scaleDown) {
	            // multi-pass bilinear div 2
	            int currentW = image.getWidth();
	            int currentH = image.getHeight();
	            resized = image;
	            while (currentW > w || currentH > h) {
	                currentW = Math.max(w, currentW / 2);
	                currentH = Math.max(h, currentH / 2);

	                BufferedImage temp = new BufferedImage(currentW, currentH, type);
	                Graphics2D g2 = temp.createGraphics();
	                g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
	                g2.drawImage(resized, 0, 0, currentW, currentH, null);
	                g2.dispose();
	                resized = temp;
	            }
	        } else {
	            Object hint = scale > 2 ? RenderingHints.VALUE_INTERPOLATION_BICUBIC : RenderingHints.VALUE_INTERPOLATION_BILINEAR;

	            resized = new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);
	            Graphics2D g2 = resized.createGraphics();
	            g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, hint);
	            g2.drawImage(image, 0, 0, w, h, null);
	            g2.dispose();
	            
	        }

	        return resized;
	        /*String formatName = outputImagePath.substring(outputImagePath
	                .lastIndexOf(".") + 1);
	 
	        ImageIO.write(resized, formatName, new File(outputImagePath));*/
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
