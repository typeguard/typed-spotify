package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class PurpleAlbum {
    private String albumType;
    private Profile[] artists;
    private ExternalUrls externalUrls;
    private String href;
    private String id;
    private Image[] images;
    private String name;
    private String type;
    private String uri;

    @JsonProperty("album_type")
    public String getAlbumType() { return albumType; }
    @JsonProperty("album_type")
    public void setAlbumType(String value) { this.albumType = value; }

    @JsonProperty("artists")
    public Profile[] getArtists() { return artists; }
    @JsonProperty("artists")
    public void setArtists(Profile[] value) { this.artists = value; }

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

    @JsonProperty("images")
    public Image[] getImages() { return images; }
    @JsonProperty("images")
    public void setImages(Image[] value) { this.images = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("type")
    public String getType() { return type; }
    @JsonProperty("type")
    public void setType(String value) { this.type = value; }

    @JsonProperty("uri")
    public String getUri() { return uri; }
    @JsonProperty("uri")
    public void setUri(String value) { this.uri = value; }
}
