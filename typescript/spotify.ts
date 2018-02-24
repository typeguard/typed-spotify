// To parse this data:
//
//   import { Convert, Album, Artist, Playlist, Profile, Track } from "./file";
//
//   const album = Convert.toAlbum(json);
//   const artist = Convert.toArtist(json);
//   const playlist = Convert.toPlaylist(json);
//   const profile = Convert.toProfile(json);
//   const track = Convert.toTrack(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

export interface Album {
    error: Error;
}

export interface Error {
    status:  number;
    message: string;
}

export interface Artist {
    error: Error;
}

export interface Playlist {
    error: Error;
}

export interface Profile {
    error: Error;
}

export interface Track {
    error: Error;
}

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
export module Convert {
    export function toAlbum(json: string): Album {
        return cast(JSON.parse(json), o("Album"));
    }

    export function albumToJson(value: Album): string {
        return JSON.stringify(value, null, 2);
    }

    export function toArtist(json: string): Artist {
        return cast(JSON.parse(json), o("Artist"));
    }

    export function artistToJson(value: Artist): string {
        return JSON.stringify(value, null, 2);
    }

    export function toPlaylist(json: string): Playlist {
        return cast(JSON.parse(json), o("Playlist"));
    }

    export function playlistToJson(value: Playlist): string {
        return JSON.stringify(value, null, 2);
    }

    export function toProfile(json: string): Profile {
        return cast(JSON.parse(json), o("Profile"));
    }

    export function profileToJson(value: Profile): string {
        return JSON.stringify(value, null, 2);
    }

    export function toTrack(json: string): Track {
        return cast(JSON.parse(json), o("Track"));
    }

    export function trackToJson(value: Track): string {
        return JSON.stringify(value, null, 2);
    }
    
    function cast<T>(obj: any, typ: any): T {
        if (!isValid(typ, obj)) {
            throw `Invalid value`;
        }
        return obj;
    }

    function isValid(typ: any, val: any): boolean {
        if (typ === undefined) return true;
        if (typ === null) return val === null || val === undefined;
        return typ.isUnion  ? isValidUnion(typ.typs, val)
                : typ.isArray  ? isValidArray(typ.typ, val)
                : typ.isMap    ? isValidMap(typ.typ, val)
                : typ.isEnum   ? isValidEnum(typ.name, val)
                : typ.isObject ? isValidObject(typ.cls, val)
                :                isValidPrimitive(typ, val);
    }

    function isValidPrimitive(typ: string, val: any) {
        return typeof typ === typeof val;
    }

    function isValidUnion(typs: any[], val: any): boolean {
        // val must validate against one typ in typs
        return typs.find(typ => isValid(typ, val)) !== undefined;
    }

    function isValidEnum(enumName: string, val: any): boolean {
        const cases = typeMap[enumName];
        return cases.indexOf(val) !== -1;
    }

    function isValidArray(typ: any, val: any): boolean {
        // val must be an array with no invalid elements
        return Array.isArray(val) && val.every(element => {
            return isValid(typ, element);
        });
    }

    function isValidMap(typ: any, val: any): boolean {
        if (val === null || typeof val !== "object" || Array.isArray(val)) return false;
        // all values in the map must be typ
        return Object.keys(val).every(prop => {
            if (!Object.prototype.hasOwnProperty.call(val, prop)) return true;
            return isValid(typ, val[prop]);
        });
    }

    function isValidObject(className: string, val: any): boolean {
        if (val === null || typeof val !== "object" || Array.isArray(val)) return false;
        let typeRep = typeMap[className];
        return Object.keys(typeRep).every(prop => {
            if (!Object.prototype.hasOwnProperty.call(typeRep, prop)) return true;
            return isValid(typeRep[prop], val[prop]);
        });
    }

    function a(typ: any) {
        return { typ, isArray: true };
    }

    function e(name: string) {
        return { name, isEnum: true };
    }

    function u(...typs: any[]) {
        return { typs, isUnion: true };
    }

    function m(typ: any) {
        return { typ, isMap: true };
    }

    function o(className: string) {
        return { cls: className, isObject: true };
    }

    const typeMap: any = {
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
}
