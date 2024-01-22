package GetterSetters;

import java.sql.Timestamp;

/**
 *
 * @author yvant
 */
public class PaymentItems {
    private int paymentId;
    private int orderId;
    private String customerEmail;
    private String paymentStatus;
    private Timestamp paymentDate;
    private double totalCost;

    // Constructor
    public PaymentItems(int paymentId, int orderId, String customerEmail, String paymentStatus, Timestamp paymentDate, double totalCost) {
        this.paymentId = paymentId;
        this.orderId = orderId;
        this.customerEmail = customerEmail;
        this.paymentStatus = paymentStatus;
        this.paymentDate = paymentDate;
        this.totalCost = totalCost;
    }

    // Getter and setter methods...

    // You can also create a method to get a formatted string of the payment details
    public String getFormattedPaymentDetails() {
        return "Payment ID: " + paymentId + "\n" +
               
                "Customer Email: " + customerEmail + "\n" +
               
                "Payment Date: " + paymentDate + "\n" +
                "Total Cost: " + totalCost;
    }
}