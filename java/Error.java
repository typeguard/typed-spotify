package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Error {
    private long status;
    private String message;

    @JsonProperty("status")
    public long getStatus() { return status; }
    @JsonProperty("status")
    public void setStatus(long value) { this.status = value; }

    @JsonProperty("message")
    public String getMessage() { return message; }
    @JsonProperty("message")
    public void setMessage(String value) { this.message = value; }
}
