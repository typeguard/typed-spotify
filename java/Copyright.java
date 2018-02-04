package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Copyright {
    private String text;
    private String type;

    @JsonProperty("text")
    public String getText() { return text; }
    @JsonProperty("text")
    public void setText(String value) { this.text = value; }

    @JsonProperty("type")
    public String getType() { return type; }
    @JsonProperty("type")
    public void setType(String value) { this.type = value; }
}
