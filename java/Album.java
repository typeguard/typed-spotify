package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class Album {
    private String albumType;
    private Profile[] artists;
    private Copyright[] copyrights;
    private AlbumExternalIDS externalIDS;
    private ExternalUrls externalUrls;
    private Object[] genres;
    private String href;
    private String id;
    private Image[] images;
    private String label;
    private String name;
    private long popularity;
    private String releaseDate;
    private String releaseDatePrecision;
    private AlbumTracks tracks;
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

    @JsonProperty("copyrights")
    public Copyright[] getCopyrights() { return copyrights; }
    @JsonProperty("copyrights")
    public void setCopyrights(Copyright[] value) { this.copyrights = value; }

    @JsonProperty("external_ids")
    public AlbumExternalIDS getExternalIDS() { return externalIDS; }
    @JsonProperty("external_ids")
    public void setExternalIDS(AlbumExternalIDS value) { this.externalIDS = value; }

    @JsonProperty("external_urls")
    public ExternalUrls getExternalUrls() { return externalUrls; }
    @JsonProperty("external_urls")
    public void setExternalUrls(ExternalUrls value) { this.externalUrls = value; }

    @JsonProperty("genres")
    public Object[] getGenres() { return genres; }
    @JsonProperty("genres")
    public void setGenres(Object[] value) { this.genres = value; }

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

    @JsonProperty("label")
    public String getLabel() { return label; }
    @JsonProperty("label")
    public void setLabel(String value) { this.label = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("popularity")
    public long getPopularity() { return popularity; }
    @JsonProperty("popularity")
    public void setPopularity(long value) { this.popularity = value; }

    @JsonProperty("release_date")
    public String getReleaseDate() { return releaseDate; }
    @JsonProperty("release_date")
    public void setReleaseDate(String value) { this.releaseDate = value; }

    @JsonProperty("release_date_precision")
    public String getReleaseDatePrecision() { return releaseDatePrecision; }
    @JsonProperty("release_date_precision")
    public void setReleaseDatePrecision(String value) { this.releaseDatePrecision = value; }

    @JsonProperty("tracks")
    public AlbumTracks getTracks() { return tracks; }
    @JsonProperty("tracks")
    public void setTracks(AlbumTracks value) { this.tracks = value; }

    @JsonProperty("type")
    public String getType() { return type; }
    @JsonProperty("type")
    public void setType(String value) { this.type = value; }

    @JsonProperty("uri")
    public String getUri() { return uri; }
    @JsonProperty("uri")
    public void setUri(String value) { this.uri = value; }
}
