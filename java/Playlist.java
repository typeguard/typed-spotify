package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Playlist {
    private boolean collaborative;
    private String description;
    private ExternalUrls externalUrls;
    private Followers followers;
    private String href;
    private String id;
    private Image[] images;
    private String name;
    private Profile owner;
    private boolean purplePublic;
    private String snapshotID;
    private PlaylistTracks tracks;
    private String type;
    private String uri;

    @JsonProperty("collaborative")
    public boolean getCollaborative() { return collaborative; }
    @JsonProperty("collaborative")
    public void setCollaborative(boolean value) { this.collaborative = value; }

    @JsonProperty("description")
    public String getDescription() { return description; }
    @JsonProperty("description")
    public void setDescription(String value) { this.description = value; }

    @JsonProperty("external_urls")
    public ExternalUrls getExternalUrls() { return externalUrls; }
    @JsonProperty("external_urls")
    public void setExternalUrls(ExternalUrls value) { this.externalUrls = value; }

    @JsonProperty("followers")
    public Followers getFollowers() { return followers; }
    @JsonProperty("followers")
    public void setFollowers(Followers value) { this.followers = value; }

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

    @JsonProperty("owner")
    public Profile getOwner() { return owner; }
    @JsonProperty("owner")
    public void setOwner(Profile value) { this.owner = value; }

    @JsonProperty("public")
    public boolean getPurplePublic() { return purplePublic; }
    @JsonProperty("public")
    public void setPurplePublic(boolean value) { this.purplePublic = value; }

    @JsonProperty("snapshot_id")
    public String getSnapshotID() { return snapshotID; }
    @JsonProperty("snapshot_id")
    public void setSnapshotID(String value) { this.snapshotID = value; }

    @JsonProperty("tracks")
    public PlaylistTracks getTracks() { return tracks; }
    @JsonProperty("tracks")
    public void setTracks(PlaylistTracks value) { this.tracks = value; }

    @JsonProperty("type")
    public String getType() { return type; }
    @JsonProperty("type")
    public void setType(String value) { this.type = value; }

    @JsonProperty("uri")
    public String getUri() { return uri; }
    @JsonProperty("uri")
    public void setUri(String value) { this.uri = value; }
}
