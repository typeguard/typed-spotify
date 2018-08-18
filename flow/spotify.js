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
    return cast(JSON.parse(json), r("Track"));
}

function albumToJson(value) {
    return JSON.stringify(uncast(value, r("Track")), null, 2);
}

function toArtist(json) {
    return cast(JSON.parse(json), r("Track"));
}

function artistToJson(value) {
    return JSON.stringify(uncast(value, r("Track")), null, 2);
}

function toPlaylist(json) {
    return cast(JSON.parse(json), r("Track"));
}

function playlistToJson(value) {
    return JSON.stringify(uncast(value, r("Track")), null, 2);
}

function toProfile(json) {
    return cast(JSON.parse(json), r("Track"));
}

function profileToJson(value) {
    return JSON.stringify(uncast(value, r("Track")), null, 2);
}

function toTrack(json) {
    return cast(JSON.parse(json), r("Track"));
}

function trackToJson(value) {
    return JSON.stringify(uncast(value, r("Track")), null, 2);
}

function invalidValue(typ, val) {
    throw Error(`Invalid value ${JSON.stringify(val)} for type ${JSON.stringify(typ)}`);
}

function jsonToJSProps(typ) {
    if (typ.jsonToJS === undefined) {
        var map = {};
        typ.props.forEach((p) => map[p.json] = { key: p.js, typ: p.typ });
        typ.jsonToJS = map;
    }
    return typ.jsonToJS;
}

function jsToJSONProps(typ) {
    if (typ.jsToJSON === undefined) {
        var map = {};
        typ.props.forEach((p) => map[p.js] = { key: p.json, typ: p.typ });
        typ.jsToJSON = map;
    }
    return typ.jsToJSON;
}

function transform(val, typ, getProps) {
    function transformPrimitive(typ, val) {
        if (typeof typ === typeof val) return val;
        return invalidValue(typ, val);
    }

    function transformUnion(typs, val) {
        // val must validate against one typ in typs
        var l = typs.length;
        for (var i = 0; i < l; i++) {
            var typ = typs[i];
            try {
                return transform(val, typ, getProps);
            } catch (_) {}
        }
        return invalidValue(typs, val);
    }

    function transformEnum(cases, val) {
        if (cases.indexOf(val) !== -1) return val;
        return invalidValue(cases, val);
    }

    function transformArray(typ, val) {
        // val must be an array with no invalid elements
        if (!Array.isArray(val)) return invalidValue("array", val);
        return val.map(el => transform(el, typ, getProps));
    }

    function transformObject(props, additional, val) {
        if (val === null || typeof val !== "object" || Array.isArray(val)) {
            return invalidValue("object", val);
        }
        var result = {};
        Object.getOwnPropertyNames(props).forEach(key => {
            const prop = props[key];
            const v = Object.prototype.hasOwnProperty.call(val, key) ? val[key] : undefined;
            result[prop.key] = transform(v, prop.typ, getProps);
        });
        Object.getOwnPropertyNames(val).forEach(key => {
            if (!Object.prototype.hasOwnProperty.call(props, key)) {
                result[key] = transform(val[key], additional, getProps);
            }
        });
        return result;
    }

    if (typ === "any") return val;
    if (typ === null) {
        if (val === null) return val;
        return invalidValue(typ, val);
    }
    if (typ === false) return invalidValue(typ, val);
    while (typeof typ === "object" && typ.ref !== undefined) {
        typ = typeMap[typ.ref];
    }
    if (Array.isArray(typ)) return transformEnum(typ, val);
    if (typeof typ === "object") {
        return typ.hasOwnProperty("unionMembers") ? transformUnion(typ.unionMembers, val)
            : typ.hasOwnProperty("arrayItems")    ? transformArray(typ.arrayItems, val)
            : typ.hasOwnProperty("props")         ? transformObject(getProps(typ), typ.additional, val)
            : invalidValue(typ, val);
    }
    return transformPrimitive(typ, val);
}

function cast(val, typ) {
    return transform(val, typ, jsonToJSProps);
}

function uncast(val, typ) {
    return transform(val, typ, jsToJSONProps);
}

function a(typ) {
    return { arrayItems: typ };
}

function u(...typs) {
    return { unionMembers: typs };
}

function o(props, additional) {
    return { props, additional };
}

function m(additional) {
    return { props: [], additional };
}

function r(name) {
    return { ref: name };
}

const typeMap = {
    "Track": o([
        { json: "error", js: "error", typ: r("Error") },
    ], false),
    "Error": o([
        { json: "status", js: "status", typ: 0 },
        { json: "message", js: "message", typ: "" },
    ], false),
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
