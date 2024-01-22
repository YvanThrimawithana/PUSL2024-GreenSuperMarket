package Servlet;

import Class.Wishlist;

public class WishlistHandler {
    public static void addToWishlist(String userEmail, int productId) {
        // You can add more business logic here if needed
        Wishlist.addToWishlist(userEmail, productId);
    }
}
