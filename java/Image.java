package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Image {
    private Long height;
    private String url;
    private Long width;

    @JsonProperty("height")
    public Long getHeight() { return height; }
    @JsonProperty("height")
    public void setHeight(Long value) { this.height = value; }

    @JsonProperty("url")
    public String getUrl() { return url; }
    @JsonProperty("url")
    public void setUrl(String value) { this.url = value; }

    @JsonProperty("width")
    public Long getWidth() { return width; }
    @JsonProperty("width")
    public void setWidth(Long value) { this.width = value; }
}
