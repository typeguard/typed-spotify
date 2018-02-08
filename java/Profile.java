package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Profile {
    private ExternalUrls externalUrls;
    private String href;
    private String id;
    private String name;
    private ArtistType type;
    private String uri;
    private String displayName;
    private Followers followers;
    private Image[] images;

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

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("type")
    public ArtistType getType() { return type; }
    @JsonProperty("type")
    public void setType(ArtistType value) { this.type = value; }

    @JsonProperty("uri")
    public String getUri() { return uri; }
    @JsonProperty("uri")
    public void setUri(String value) { this.uri = value; }

    @JsonProperty("display_name")
    public String getDisplayName() { return displayName; }
    @JsonProperty("display_name")
    public void setDisplayName(String value) { this.displayName = value; }

    @JsonProperty("followers")
    public Followers getFollowers() { return followers; }
    @JsonProperty("followers")
    public void setFollowers(Followers value) { this.followers = value; }

    @JsonProperty("images")
    public Image[] getImages() { return images; }
    @JsonProperty("images")
    public void setImages(Image[] value) { this.images = value; }
}
