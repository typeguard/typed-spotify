package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Track {
    private Error error;

    @JsonProperty("error")
    public Error getError() { return error; }
    @JsonProperty("error")
    public void setError(Error value) { this.error = value; }
}
