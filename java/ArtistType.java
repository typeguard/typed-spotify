package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum ArtistType {
    ARTIST, TRACK, USER;

    @JsonValue
    public String toValue() {
        switch (this) {
        case ARTIST: return "artist";
        case TRACK: return "track";
        case USER: return "user";
        }
        return null;
    }

    @JsonCreator
    public static ArtistType forValue(String value) throws IOException {
        if (value.equals("artist")) return ARTIST;
        if (value.equals("track")) return TRACK;
        if (value.equals("user")) return USER;
        throw new IOException("Cannot deserialize ArtistType");
    }
}
