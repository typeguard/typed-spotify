// To parse this data:
//
//   const Convert = require("./file");
//
//   const album = Convert.toAlbum(json);
//   const artist = Convert.toArtist(json);
//   const playlist = Convert.toPlaylist(json);
//   const profile = Convert.toProfile(json);
//   const track = Convert.toTrack(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
function toAlbum(json) {
    return cast(JSON.parse(json), o("Album"));
}

function albumToJson(value) {
    return JSON.stringify(value, null, 2);
}

function toArtist(json) {
    return cast(JSON.parse(json), o("Artist"));
}

function artistToJson(value) {
    return JSON.stringify(value, null, 2);
}

function toPlaylist(json) {
    return cast(JSON.parse(json), o("Playlist"));
}

function playlistToJson(value) {
    return JSON.stringify(value, null, 2);
}

function toProfile(json) {
    return cast(JSON.parse(json), o("Profile"));
}

function profileToJson(value) {
    return JSON.stringify(value, null, 2);
}

function toTrack(json) {
    return cast(JSON.parse(json), o("Track"));
}

function trackToJson(value) {
    return JSON.stringify(value, null, 2);
}

function cast(obj, typ) {
    if (!isValid(typ, obj)) {
        throw `Invalid value`;
    }
    return obj;
}

function isValid(typ, val) {
    if (typ === undefined) return true;
    if (typ === null) return val === null || val === undefined;
    return typ.isUnion  ? isValidUnion(typ.typs, val)
            : typ.isArray  ? isValidArray(typ.typ, val)
            : typ.isMap    ? isValidMap(typ.typ, val)
            : typ.isEnum   ? isValidEnum(typ.name, val)
            : typ.isObject ? isValidObject(typ.cls, val)
            :                isValidPrimitive(typ, val);
}

function isValidPrimitive(typ, val) {
    return typeof typ === typeof val;
}

function isValidUnion(typs, val) {
    // val must validate against one typ in typs
    return typs.find(typ => isValid(typ, val)) !== undefined;
}

function isValidEnum(enumName, val) {
    const cases = typeMap[enumName];
    return cases.indexOf(val) !== -1;
}

function isValidArray(typ, val) {
    // val must be an array with no invalid elements
    return Array.isArray(val) && val.every(element => {
        return isValid(typ, element);
    });
}

function isValidMap(typ, val) {
    if (val === null || typeof val !== "object" || Array.isArray(val)) return false;
    // all values in the map must be typ
    return Object.keys(val).every(prop => {
        if (!Object.prototype.hasOwnProperty.call(val, prop)) return true;
        return isValid(typ, val[prop]);
    });
}

function isValidObject(className, val) {
    if (val === null || typeof val !== "object" || Array.isArray(val)) return false;
    let typeRep = typeMap[className];
    return Object.keys(typeRep).every(prop => {
        if (!Object.prototype.hasOwnProperty.call(typeRep, prop)) return true;
        return isValid(typeRep[prop], val[prop]);
    });
}

function a(typ) {
    return { typ, isArray: true };
}

function e(name) {
    return { name, isEnum: true };
}

function u(...typs) {
    return { typs, isUnion: true };
}

function m(typ) {
    return { typ, isMap: true };
}

function o(className) {
    return { cls: className, isObject: true };
}

const typeMap = {
    "Album": {
        error: o("Error"),
    },
    "Error": {
        status: 0,
        message: "",
    },
    "Artist": {
        error: o("Error"),
    },
    "Playlist": {
        error: o("Error"),
    },
    "Profile": {
        error: o("Error"),
    },
    "Track": {
        error: o("Error"),
    },
};

module.exports = {
    "albumToJson": albumToJson,
    "toAlbum": toAlbum,
    "artistToJson": artistToJson,
    "toArtist": toArtist,
    "playlistToJson": playlistToJson,
    "toPlaylist": toPlaylist,
    "profileToJson": profileToJson,
    "toProfile": toProfile,
    "trackToJson": trackToJson,
    "toTrack": toTrack,
};
