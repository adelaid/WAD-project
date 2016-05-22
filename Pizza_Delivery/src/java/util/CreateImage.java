/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import model.Crust;
import model.Ingredient;
import model.Pizza;

/**
 *
 * @author Ada
 */
public class CreateImage {
    private static CreateImage instance;

    public static CreateImage getInstance() {
        if (instance == null) {
            instance = new CreateImage();
        }
        return instance;
    }
    
    
    public String split(String ss)  { 
    

        String[] result = ss.split("\\/");

       return result[2];
    }
    
    
    public String newImage(Pizza p){
        String pImg="";
     try {
         String name=p.getName();
         File path = new File("C:\\Users\\Ada\\Documents\\GitHub\\WAD-project\\Pizza_Delivery\\web\\img");
         //  File file = new File("resources/abc.txt");
         
         // ./img
//./img/cheese_mozz_ML.png
// load source images
String crust=split(p.getCrust().getImage());
BufferedImage image = ImageIO.read(new File(path, crust));
String sauce=split(p.getSauce().getImage());
BufferedImage overlay1 = ImageIO.read(new File(path, sauce));
String cheese="cheese_mozz_ML.png";
BufferedImage overlay2=null;
if(p.isCheese()){
 overlay2 = ImageIO.read(new File(path, cheese));
}
else{


}
ArrayList<Ingredient> ingredients=(ArrayList<Ingredient>)p.getIngredients();
ArrayList<BufferedImage> bf=new ArrayList<BufferedImage>();
for(Ingredient ii :ingredients){
BufferedImage bi=ImageIO.read(new File(path, split(ii.getImage())));
bf.add(bi);
}



// create the new image, canvas size is the max. of both image sizes
int w = Math.max(image.getWidth(), overlay1.getWidth());
int h = Math.max(image.getHeight(), overlay1.getHeight());
BufferedImage combined = new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);

// paint both images, preserving the alpha channels
Graphics g = combined.getGraphics();
g.drawImage(image, 0, 0, null);

g.drawImage(overlay1, 0, 0, null);

g.drawImage(overlay2, 0, 0, null);

for(BufferedImage bbb:bf){
g.drawImage(bbb, 0, 0, null);
}


pImg="./img/"+name+".png";

// Save as new image
ImageIO.write(combined, "PNG", new File(path, name+".png"));
     } catch (IOException ex) {
         Logger.getLogger(CreateImage.class.getName()).log(Level.SEVERE, null, ex);
     }

 return pImg;
 
 }
}
