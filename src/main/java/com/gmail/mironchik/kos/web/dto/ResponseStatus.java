package com.gmail.mironchik.kos.web.dto;

/**
 * Created by koc9n on 03.03.15.
 */
public class ResponseStatus {
    public static final ResponseStatus SUCCESS = new ResponseStatus("success");
    public static final ResponseStatus ERROR = new ResponseStatus("error");
    private String status;
    private String message;

    private ResponseStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
