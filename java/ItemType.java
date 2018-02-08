package io.quicktype;

import java.util.Map;
import java.io.IOException;
import com.fasterxml.jackson.annotation.*;

public enum ItemType {
    TRACK;

    @JsonValue
    public String toValue() {
        switch (this) {
        case TRACK: return "track";
        }
        return null;
    }

    @JsonCreator
    public static ItemType forValue(String value) throws IOException {
        if (value.equals("track")) return TRACK;
        throw new IOException("Cannot deserialize ItemType");
    }
}
