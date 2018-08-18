// To use this code, add the following Maven dependency to your project:
//
//     com.fasterxml.jackson.core : jackson-databind : 2.9.0
//
// Import this package:
//
//     import io.quicktype.Converter;
//
// Then you can deserialize a JSON string with
//
//     Track data = Converter.AlbumFromJsonString(jsonString);
//     Track data = Converter.ArtistFromJsonString(jsonString);
//     Track data = Converter.PlaylistFromJsonString(jsonString);
//     Track data = Converter.ProfileFromJsonString(jsonString);
//     Track data = Converter.TrackFromJsonString(jsonString);

package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.core.JsonProcessingException;

public class Converter {
    // Serialize/deserialize helpers

    public static Track AlbumFromJsonString(String json) throws IOException {
        return getAlbumObjectReader().readValue(json);
    }

    public static String AlbumToJsonString(Track obj) throws JsonProcessingException {
        return getAlbumObjectWriter().writeValueAsString(obj);
    }

    public static Track ArtistFromJsonString(String json) throws IOException {
        return getArtistObjectReader().readValue(json);
    }

    public static String ArtistToJsonString(Track obj) throws JsonProcessingException {
        return getArtistObjectWriter().writeValueAsString(obj);
    }

    public static Track PlaylistFromJsonString(String json) throws IOException {
        return getPlaylistObjectReader().readValue(json);
    }

    public static String PlaylistToJsonString(Track obj) throws JsonProcessingException {
        return getPlaylistObjectWriter().writeValueAsString(obj);
    }

    public static Track ProfileFromJsonString(String json) throws IOException {
        return getProfileObjectReader().readValue(json);
    }

    public static String ProfileToJsonString(Track obj) throws JsonProcessingException {
        return getProfileObjectWriter().writeValueAsString(obj);
    }

    public static Track TrackFromJsonString(String json) throws IOException {
        return getTrackObjectReader().readValue(json);
    }

    public static String TrackToJsonString(Track obj) throws JsonProcessingException {
        return getTrackObjectWriter().writeValueAsString(obj);
    }

    private static ObjectReader AlbumReader;
    private static ObjectWriter AlbumWriter;

    private static void instantiateAlbumMapper() {
        ObjectMapper mapper = new ObjectMapper();
        AlbumReader = mapper.reader(Track.class);
        AlbumWriter = mapper.writerFor(Track.class);
    }

    private static ObjectReader getAlbumObjectReader() {
        if (AlbumReader == null) instantiateAlbumMapper();
        return AlbumReader;
    }

    private static ObjectWriter getAlbumObjectWriter() {
        if (AlbumWriter == null) instantiateAlbumMapper();
        return AlbumWriter;
    }

    private static ObjectReader ArtistReader;
    private static ObjectWriter ArtistWriter;

    private static void instantiateArtistMapper() {
        ObjectMapper mapper = new ObjectMapper();
        ArtistReader = mapper.reader(Track.class);
        ArtistWriter = mapper.writerFor(Track.class);
    }

    private static ObjectReader getArtistObjectReader() {
        if (ArtistReader == null) instantiateArtistMapper();
        return ArtistReader;
    }

    private static ObjectWriter getArtistObjectWriter() {
        if (ArtistWriter == null) instantiateArtistMapper();
        return ArtistWriter;
    }

    private static ObjectReader PlaylistReader;
    private static ObjectWriter PlaylistWriter;

    private static void instantiatePlaylistMapper() {
        ObjectMapper mapper = new ObjectMapper();
        PlaylistReader = mapper.reader(Track.class);
        PlaylistWriter = mapper.writerFor(Track.class);
    }

    private static ObjectReader getPlaylistObjectReader() {
        if (PlaylistReader == null) instantiatePlaylistMapper();
        return PlaylistReader;
    }

    private static ObjectWriter getPlaylistObjectWriter() {
        if (PlaylistWriter == null) instantiatePlaylistMapper();
        return PlaylistWriter;
    }

    private static ObjectReader ProfileReader;
    private static ObjectWriter ProfileWriter;

    private static void instantiateProfileMapper() {
        ObjectMapper mapper = new ObjectMapper();
        ProfileReader = mapper.reader(Track.class);
        ProfileWriter = mapper.writerFor(Track.class);
    }

    private static ObjectReader getProfileObjectReader() {
        if (ProfileReader == null) instantiateProfileMapper();
        return ProfileReader;
    }

    private static ObjectWriter getProfileObjectWriter() {
        if (ProfileWriter == null) instantiateProfileMapper();
        return ProfileWriter;
    }

    private static ObjectReader TrackReader;
    private static ObjectWriter TrackWriter;

    private static void instantiateTrackMapper() {
        ObjectMapper mapper = new ObjectMapper();
        TrackReader = mapper.reader(Track.class);
        TrackWriter = mapper.writerFor(Track.class);
    }

    private static ObjectReader getTrackObjectReader() {
        if (TrackReader == null) instantiateTrackMapper();
        return TrackReader;
    }

    private static ObjectWriter getTrackObjectWriter() {
        if (TrackWriter == null) instantiateTrackMapper();
        return TrackWriter;
    }
}
