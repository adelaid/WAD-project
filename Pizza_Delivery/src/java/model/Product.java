package model;

/**
 * Created by rfischer on 14.03.16.
 */
public class Product {
    private int id;
    private String name;
    private String type;
    private String desc;
    private double unitprice;
    private int quantity;
    private String img;

    
     public Product(String name, String type, String desc, double unitprice,String img) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.desc = desc;
        this.unitprice = unitprice;
        this.img = img;
        
    }
    
    
     public Product(int id, String name, String type, String desc, double unitprice) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.desc = desc;
        this.unitprice = unitprice;
        
    }
    
      public Product(String name, String type, String desc, double unitprice) {
      
        this.name = name;
        this.type = type;
        this.desc = desc;
        this.unitprice = unitprice;
        
    }
    
    public Product(int id, String name, String type, String desc, double unitprice,int quantity) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.desc = desc;
        this.unitprice = unitprice;
        this.quantity=quantity;
    }
    public Product(String name, String type, int quantity){
       this.name = name;
        this.type = type;
        this.quantity = quantity; 
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", type=" + type + ", desc=" + desc + ", unitprice=" + unitprice + ", quantity=" + quantity + '}';
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

   
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(double unitprice) {
        this.unitprice = unitprice;
    }
}
