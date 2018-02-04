package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class ExternalIDS {
    private String upc;

    @JsonProperty("upc")
    public String getUpc() { return upc; }
    @JsonProperty("upc")
    public void setUpc(String value) { this.upc = value; }
}
