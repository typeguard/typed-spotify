package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class PlaylistTracks {
    private String href;
    private Item[] items;
    private long limit;
    private Object next;
    private long offset;
    private Object previous;
    private long total;

    @JsonProperty("href")
    public String getHref() { return href; }
    @JsonProperty("href")
    public void setHref(String value) { this.href = value; }

    @JsonProperty("items")
    public Item[] getItems() { return items; }
    @JsonProperty("items")
    public void setItems(Item[] value) { this.items = value; }

    @JsonProperty("limit")
    public long getLimit() { return limit; }
    @JsonProperty("limit")
    public void setLimit(long value) { this.limit = value; }

    @JsonProperty("next")
    public Object getNext() { return next; }
    @JsonProperty("next")
    public void setNext(Object value) { this.next = value; }

    @JsonProperty("offset")
    public long getOffset() { return offset; }
    @JsonProperty("offset")
    public void setOffset(long value) { this.offset = value; }

    @JsonProperty("previous")
    public Object getPrevious() { return previous; }
    @JsonProperty("previous")
    public void setPrevious(Object value) { this.previous = value; }

    @JsonProperty("total")
    public long getTotal() { return total; }
    @JsonProperty("total")
    public void setTotal(long value) { this.total = value; }
}
