// To parse this data:
//
//   import { Convert, Album } from "./file";
//
//   const album = Convert.toAlbum(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

export interface Album {
    album_type:             string;
    artists:                Artist[];
    copyrights:             Copyright[];
    external_ids:           ExternalIDS;
    external_urls:          ExternalUrls;
    genres:                 any[];
    href:                   string;
    id:                     string;
    images:                 Image[];
    label:                  string;
    name:                   string;
    popularity:             number;
    release_date:           string;
    release_date_precision: string;
    tracks:                 Tracks;
    type:                   string;
    uri:                    string;
}

export interface Artist {
    external_urls: ExternalUrls;
    href:          string;
    id:            string;
    name:          string;
    type:          ArtistType;
    uri:           string;
}

export interface ExternalUrls {
    spotify: string;
}

export enum ArtistType {
    Artist = "artist",
}

export interface Copyright {
    text: string;
    type: string;
}

export interface ExternalIDS {
    upc: string;
}

export interface Image {
    height: number;
    url:    string;
    width:  number;
}

export interface Tracks {
    href:     string;
    items:    Item[];
    limit:    number;
    next:     null;
    offset:   number;
    previous: null;
    total:    number;
}

export interface Item {
    artists:       Artist[];
    disc_number:   number;
    duration_ms:   number;
    explicit:      boolean;
    external_urls: ExternalUrls;
    href:          string;
    id:            string;
    is_playable:   boolean;
    name:          string;
    preview_url:   string;
    track_number:  number;
    type:          ItemType;
    uri:           string;
}

export enum ItemType {
    Track = "track",
}

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
export module Convert {
    export function toAlbum(json: string): Album {
        return cast(JSON.parse(json), O("Album"));
    }

    export function albumToJson(value: Album): string {
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
        return Array.isArray(val) && val.every((element, i) => {
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

    function A(typ: any) {
        return { typ, isArray: true };
    }

    function E(name: string) {
        return { name, isEnum: true };
    }

    function U(...typs: any[]) {
        return { typs, isUnion: true };
    }

    function M(typ: any) {
        return { typ, isMap: true };
    }

    function O(className: string) {
        return { cls: className, isObject: true };
    }

    const typeMap: any = {
        "Album": {
            album_type: "",
            artists: A(O("Artist")),
            copyrights: A(O("Copyright")),
            external_ids: O("ExternalIDS"),
            external_urls: O("ExternalUrls"),
            genres: A(undefined),
            href: "",
            id: "",
            images: A(O("Image")),
            label: "",
            name: "",
            popularity: 0,
            release_date: "",
            release_date_precision: "",
            tracks: O("Tracks"),
            type: "",
            uri: "",
        },
        "Artist": {
            external_urls: O("ExternalUrls"),
            href: "",
            id: "",
            name: "",
            type: E("ArtistType"),
            uri: "",
        },
        "ExternalUrls": {
            spotify: "",
        },
        "Copyright": {
            text: "",
            type: "",
        },
        "ExternalIDS": {
            upc: "",
        },
        "Image": {
            height: 0,
            url: "",
            width: 0,
        },
        "Tracks": {
            href: "",
            items: A(O("Item")),
            limit: 0,
            next: null,
            offset: 0,
            previous: null,
            total: 0,
        },
        "Item": {
            artists: A(O("Artist")),
            disc_number: 0,
            duration_ms: 0,
            explicit: false,
            external_urls: O("ExternalUrls"),
            href: "",
            id: "",
            is_playable: false,
            name: "",
            preview_url: "",
            track_number: 0,
            type: E("ItemType"),
            uri: "",
        },
        "ArtistType": [
            ArtistType.Artist,
        ],
        "ItemType": [
            ItemType.Track,
        ],
    };
}
