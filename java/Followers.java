package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Followers {
    private Object href;
    private long total;

    @JsonProperty("href")
    public Object getHref() { return href; }
    @JsonProperty("href")
    public void setHref(Object value) { this.href = value; }

    @JsonProperty("total")
    public long getTotal() { return total; }
    @JsonProperty("total")
    public void setTotal(long value) { this.total = value; }
}
