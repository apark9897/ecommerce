package com.anderson.ecommerce.dto.checkout;

public class StripeResponse {
    private String sessionId;
    private String redirectUrl;

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getRedirectUrl() {
        return redirectUrl;
    }

    public void setRedirectUrl(String redirectUrl) {
        this.redirectUrl = redirectUrl;
    }

    public StripeResponse(String sessionId, String redirectUrl) {
        this.sessionId = sessionId;
        this.redirectUrl = redirectUrl;
    }

    public StripeResponse() {
    }
}

