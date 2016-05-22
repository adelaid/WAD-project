/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listener;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.imageio.ImageIO;
import static javax.servlet.SessionTrackingMode.URL;
import static javax.swing.Spring.height;
import static javax.swing.Spring.width;

/**
 *
 * @author Ada
 */
public class NewClass {



 public void createImage(String nume1, String nume2, String nume3){

     try {
         File path = new File("web/img");
         //  File file = new File("resources/abc.txt");
         
         // ./img
//./img/cheese_mozz_ML.png
// load source images
BufferedImage overlay = ImageIO.read(new File(path, "cheese_mozz_ML.png"));
BufferedImage image = ImageIO.read(new File(path, "crust_pan_NoFinish.png"));

// create the new image, canvas size is the max. of both image sizes
int w = Math.max(image.getWidth(), overlay.getWidth());
int h = Math.max(image.getHeight(), overlay.getHeight());
BufferedImage combined = new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);

// paint both images, preserving the alpha channels
Graphics g = combined.getGraphics();
g.drawImage(image, 0, 0, null);
g.drawImage(overlay, 0, 0, null);

// Save as new image
ImageIO.write(combined, "PNG", new File(path, "combined.png"));
     } catch (IOException ex) {
         Logger.getLogger(NewClass.class.getName()).log(Level.SEVERE, null, ex);
     }

 
 
 }


}
