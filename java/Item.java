package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Item {
    private String addedAt;
    private Profile addedBy;
    private boolean isLocal;
    private Track track;

    @JsonProperty("added_at")
    public String getAddedAt() { return addedAt; }
    @JsonProperty("added_at")
    public void setAddedAt(String value) { this.addedAt = value; }

    @JsonProperty("added_by")
    public Profile getAddedBy() { return addedBy; }
    @JsonProperty("added_by")
    public void setAddedBy(Profile value) { this.addedBy = value; }

    @JsonProperty("is_local")
    public boolean getIsLocal() { return isLocal; }
    @JsonProperty("is_local")
    public void setIsLocal(boolean value) { this.isLocal = value; }

    @JsonProperty("track")
    public Track getTrack() { return track; }
    @JsonProperty("track")
    public void setTrack(Track value) { this.track = value; }
}
