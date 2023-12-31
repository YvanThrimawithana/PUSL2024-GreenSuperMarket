package GetterSetters;

public class FeedbackItems {
    private String userEmail;
    private String feedbackStatus;
    private String feedbackText;

    // Constructor (you can create one if needed)
 public void FeedbackItems() {
        
    }
    // Getter methods
    public String getUserEmail() {
        return userEmail;
    }

    public String getFeedbackStatus() {
        return feedbackStatus;
    }

    public String getFeedbackText() {
        return feedbackText;
    }

    // Setter methods
    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public void setFeedbackStatus(String feedbackStatus) {
        this.feedbackStatus = feedbackStatus;
    }

    public void setFeedbackText(String feedbackText) {
        this.feedbackText = feedbackText;
    }
}
