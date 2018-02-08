package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class ItemExternalIDS {
    private String isrc;

    @JsonProperty("isrc")
    public String getIsrc() { return isrc; }
    @JsonProperty("isrc")
    public void setIsrc(String value) { this.isrc = value; }
}
