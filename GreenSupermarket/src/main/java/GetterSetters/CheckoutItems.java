package GetterSetters;

public class CheckoutItems {
    private int order_id;
    private String prod_name;
    private int prod_quantity;
    private double prod_price;

    // Constructor
   

    public void CheckoutItems() {
        
    }

    // Getters
    public int getOrderId() {
        return order_id;
    }

   

    public String getProdName() {
        return prod_name;
    }

    public int getProdQuantity() {
        return prod_quantity;
    }

    public double getProdPrice() {
        return prod_price;
    }

    // Setters
    public void setOrderId(int order_id) {
        this.order_id = order_id;
    }

    

    public void setProdName(String prod_name) {
        this.prod_name = prod_name;
    }

    public void setProdQuantity(int prod_quantity) {
        this.prod_quantity = prod_quantity;
    }

    public void setProdPrice(double prod_price) {
        this.prod_price = prod_price;
    }
}
