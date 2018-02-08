package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Track {
    private Profile[] artists;
    private long discNumber;
    private long durationMS;
    private boolean explicit;
    private ExternalUrls externalUrls;
    private String href;
    private String id;
    private boolean isPlayable;
    private String name;
    private String previewURL;
    private long trackNumber;
    private ItemType type;
    private String uri;
    private PurpleAlbum album;
    private ItemExternalIDS externalIDS;
    private Long popularity;
    private Profile linkedFrom;

    @JsonProperty("artists")
    public Profile[] getArtists() { return artists; }
    @JsonProperty("artists")
    public void setArtists(Profile[] value) { this.artists = value; }

    @JsonProperty("disc_number")
    public long getDiscNumber() { return discNumber; }
    @JsonProperty("disc_number")
    public void setDiscNumber(long value) { this.discNumber = value; }

    @JsonProperty("duration_ms")
    public long getDurationMS() { return durationMS; }
    @JsonProperty("duration_ms")
    public void setDurationMS(long value) { this.durationMS = value; }

    @JsonProperty("explicit")
    public boolean getExplicit() { return explicit; }
    @JsonProperty("explicit")
    public void setExplicit(boolean value) { this.explicit = value; }

    @JsonProperty("external_urls")
    public ExternalUrls getExternalUrls() { return externalUrls; }
    @JsonProperty("external_urls")
    public void setExternalUrls(ExternalUrls value) { this.externalUrls = value; }

    @JsonProperty("href")
    public String getHref() { return href; }
    @JsonProperty("href")
    public void setHref(String value) { this.href = value; }

    @JsonProperty("id")
    public String getId() { return id; }
    @JsonProperty("id")
    public void setId(String value) { this.id = value; }

    @JsonProperty("is_playable")
    public boolean getIsPlayable() { return isPlayable; }
    @JsonProperty("is_playable")
    public void setIsPlayable(boolean value) { this.isPlayable = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("preview_url")
    public String getPreviewURL() { return previewURL; }
    @JsonProperty("preview_url")
    public void setPreviewURL(String value) { this.previewURL = value; }

    @JsonProperty("track_number")
    public long getTrackNumber() { return trackNumber; }
    @JsonProperty("track_number")
    public void setTrackNumber(long value) { this.trackNumber = value; }

    @JsonProperty("type")
    public ItemType getType() { return type; }
    @JsonProperty("type")
    public void setType(ItemType value) { this.type = value; }

    @JsonProperty("uri")
    public String getUri() { return uri; }
    @JsonProperty("uri")
    public void setUri(String value) { this.uri = value; }

    @JsonProperty("album")
    public PurpleAlbum getAlbum() { return album; }
    @JsonProperty("album")
    public void setAlbum(PurpleAlbum value) { this.album = value; }

    @JsonProperty("external_ids")
    public ItemExternalIDS getExternalIDS() { return externalIDS; }
    @JsonProperty("external_ids")
    public void setExternalIDS(ItemExternalIDS value) { this.externalIDS = value; }

    @JsonProperty("popularity")
    public Long getPopularity() { return popularity; }
    @JsonProperty("popularity")
    public void setPopularity(Long value) { this.popularity = value; }

    @JsonProperty("linked_from")
    public Profile getLinkedFrom() { return linkedFrom; }
    @JsonProperty("linked_from")
    public void setLinkedFrom(Profile value) { this.linkedFrom = value; }
}
