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
//     Album data = Converter.AlbumFromJsonString(jsonString);
//     Artist data = Converter.ArtistFromJsonString(jsonString);
//     Playlist data = Converter.PlaylistFromJsonString(jsonString);
//     Profile data = Converter.ProfileFromJsonString(jsonString);
//     Track data = Converter.TrackFromJsonString(jsonString);

package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.core.JsonProcessingException;

public class Converter {
    // Serialize/deserialize helpers

    public static Album AlbumFromJsonString(String json) throws IOException {
        return getAlbumObjectReader().readValue(json);
    }

    public static String AlbumToJsonString(Album obj) throws JsonProcessingException {
        return getAlbumObjectWriter().writeValueAsString(obj);
    }

    public static Artist ArtistFromJsonString(String json) throws IOException {
        return getArtistObjectReader().readValue(json);
    }

    public static String ArtistToJsonString(Artist obj) throws JsonProcessingException {
        return getArtistObjectWriter().writeValueAsString(obj);
    }

    public static Playlist PlaylistFromJsonString(String json) throws IOException {
        return getPlaylistObjectReader().readValue(json);
    }

    public static String PlaylistToJsonString(Playlist obj) throws JsonProcessingException {
        return getPlaylistObjectWriter().writeValueAsString(obj);
    }

    public static Profile ProfileFromJsonString(String json) throws IOException {
        return getProfileObjectReader().readValue(json);
    }

    public static String ProfileToJsonString(Profile obj) throws JsonProcessingException {
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
        AlbumReader = mapper.reader(Album.class);
        AlbumWriter = mapper.writerFor(Album.class);
    }

    private static ObjectReader getAlbumObjectReader() {
        if (AlbumReader == null) instantiateMapper();
        return AlbumReader;
    }

    private static ObjectWriter getAlbumObjectWriter() {
        if (AlbumWriter == null) instantiateMapper();
        return AlbumWriter;
    }

    private static ObjectReader ArtistReader;
    private static ObjectWriter ArtistWriter;

    private static void instantiateArtistMapper() {
        ObjectMapper mapper = new ObjectMapper();
        ArtistReader = mapper.reader(Artist.class);
        ArtistWriter = mapper.writerFor(Artist.class);
    }

    private static ObjectReader getArtistObjectReader() {
        if (ArtistReader == null) instantiateMapper();
        return ArtistReader;
    }

    private static ObjectWriter getArtistObjectWriter() {
        if (ArtistWriter == null) instantiateMapper();
        return ArtistWriter;
    }

    private static ObjectReader PlaylistReader;
    private static ObjectWriter PlaylistWriter;

    private static void instantiatePlaylistMapper() {
        ObjectMapper mapper = new ObjectMapper();
        PlaylistReader = mapper.reader(Playlist.class);
        PlaylistWriter = mapper.writerFor(Playlist.class);
    }

    private static ObjectReader getPlaylistObjectReader() {
        if (PlaylistReader == null) instantiateMapper();
        return PlaylistReader;
    }

    private static ObjectWriter getPlaylistObjectWriter() {
        if (PlaylistWriter == null) instantiateMapper();
        return PlaylistWriter;
    }

    private static ObjectReader ProfileReader;
    private static ObjectWriter ProfileWriter;

    private static void instantiateProfileMapper() {
        ObjectMapper mapper = new ObjectMapper();
        ProfileReader = mapper.reader(Profile.class);
        ProfileWriter = mapper.writerFor(Profile.class);
    }

    private static ObjectReader getProfileObjectReader() {
        if (ProfileReader == null) instantiateMapper();
        return ProfileReader;
    }

    private static ObjectWriter getProfileObjectWriter() {
        if (ProfileWriter == null) instantiateMapper();
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
        if (TrackReader == null) instantiateMapper();
        return TrackReader;
    }

    private static ObjectWriter getTrackObjectWriter() {
        if (TrackWriter == null) instantiateMapper();
        return TrackWriter;
    }
}
