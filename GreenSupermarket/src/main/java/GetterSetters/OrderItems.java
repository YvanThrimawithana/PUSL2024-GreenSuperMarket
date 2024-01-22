package GetterSetters;

public class OrderItems {
    private int orderId;
    private String productName;
    private int quantity;
    private double price;
    private double totalprice;

    public  OrderItems() {
        
    }
    // Getter for orderId
    public int getOrderId() {
        return orderId;
    }

    // Setter for orderId
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    // Getter for productName
    public String getProductName() {
        return productName;
    }

    // Setter for productName
    public void setProductName(String productName) {
        this.productName = productName;
    }

    // Getter for quantity
    public int getQuantity() {
        return quantity;
    }

    // Setter for quantity
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    // Getter for price
    public double getPrice() {
        return price;
    }

    // Setter for price
    public void setPrice(double price) {
        this.price = price;
    }
    public double getTotalPrice() {
        return totalprice;
    }

    // Setter for price
    public void setTotalPrice(double totalprice) {
        this.totalprice = totalprice;
    }
}
