package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum ArtistType {
    ARTIST;

    @JsonValue
    public String toValue() {
        switch (this) {
        case ARTIST: return "artist";
        }
        return null;
    }

    @JsonCreator
    public static ArtistType forValue(String value) throws IOException {
        if (value.equals("artist")) return ARTIST;
        throw new IOException("Cannot deserialize ArtistType");
    }
}
