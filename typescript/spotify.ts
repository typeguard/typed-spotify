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
    album_type:             string;
    artists:                Profile[];
    copyrights:             Copyright[];
    external_ids:           AlbumExternalIDS;
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
    tracks:                 AlbumTracks;
    type:                   string;
    uri:                    string;
}

export interface Profile {
    external_urls: ExternalUrls;
    href:          string;
    id:            string;
    name?:         string;
    type:          ArtistType;
    uri:           string;
    display_name?: string;
    followers?:    Followers;
    images?:       Image[];
}

export interface ExternalUrls {
    spotify: string;
}

export interface Followers {
    href:  null;
    total: number;
}

export interface Image {
    height?: number;
    url:     string;
    width?:  number;
}

export enum ArtistType {
    Artist = "artist",
    Track = "track",
    User = "user",
}

export interface Copyright {
    text: string;
    type: string;
}

export interface AlbumExternalIDS {
    upc: string;
}

export interface AlbumTracks {
    href:     string;
    items:    Track[];
    limit:    number;
    next:     null;
    offset:   number;
    previous: null;
    total:    number;
}

export interface Track {
    artists:       Profile[];
    disc_number:   number;
    duration_ms:   number;
    explicit:      boolean;
    external_urls: ExternalUrls;
    href:          string;
    id:            string;
    is_playable:   boolean;
    name:          string;
    preview_url?:  string;
    track_number:  number;
    type:          ItemType;
    uri:           string;
    album?:        Album1;
    external_ids?: ItemExternalIDS;
    popularity?:   number;
    linked_from?:  Profile;
}

export interface Album1 {
    album_type:    string;
    artists:       Profile[];
    external_urls: ExternalUrls;
    href:          string;
    id:            string;
    images:        Image[];
    name:          string;
    type:          string;
    uri:           string;
}

export interface ItemExternalIDS {
    isrc: string;
}

export enum ItemType {
    Track = "track",
}

export interface Artist {
    external_urls: ExternalUrls;
    followers:     Followers;
    genres:        string[];
    href:          string;
    id:            string;
    images:        Image[];
    name:          string;
    popularity:    number;
    type:          string;
    uri:           string;
}

export interface Playlist {
    collaborative: boolean;
    description:   string;
    external_urls: ExternalUrls;
    followers:     Followers;
    href:          string;
    id:            string;
    images:        Image[];
    name:          string;
    owner:         Profile;
    public:        boolean;
    snapshot_id:   string;
    tracks:        PlaylistTracks;
    type:          string;
    uri:           string;
}

export interface PlaylistTracks {
    href:     string;
    items:    Item[];
    limit:    number;
    next:     null;
    offset:   number;
    previous: null;
    total:    number;
}

export interface Item {
    added_at: string;
    added_by: Profile;
    is_local: boolean;
    track:    Track;
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

    export function toArtist(json: string): Artist {
        return cast(JSON.parse(json), O("Artist"));
    }

    export function artistToJson(value: Artist): string {
        return JSON.stringify(value, null, 2);
    }

    export function toPlaylist(json: string): Playlist {
        return cast(JSON.parse(json), O("Playlist"));
    }

    export function playlistToJson(value: Playlist): string {
        return JSON.stringify(value, null, 2);
    }

    export function toProfile(json: string): Profile {
        return cast(JSON.parse(json), O("Profile"));
    }

    export function profileToJson(value: Profile): string {
        return JSON.stringify(value, null, 2);
    }

    export function toTrack(json: string): Track {
        return cast(JSON.parse(json), O("Track"));
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
            artists: A(O("Profile")),
            copyrights: A(O("Copyright")),
            external_ids: O("AlbumExternalIDS"),
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
            tracks: O("AlbumTracks"),
            type: "",
            uri: "",
        },
        "Profile": {
            external_urls: O("ExternalUrls"),
            href: "",
            id: "",
            name: U(null, ""),
            type: E("ArtistType"),
            uri: "",
            display_name: U(null, ""),
            followers: U(null, O("Followers")),
            images: U(null, A(O("Image"))),
        },
        "ExternalUrls": {
            spotify: "",
        },
        "Followers": {
            href: null,
            total: 0,
        },
        "Image": {
            height: U(0, null),
            url: "",
            width: U(0, null),
        },
        "Copyright": {
            text: "",
            type: "",
        },
        "AlbumExternalIDS": {
            upc: "",
        },
        "AlbumTracks": {
            href: "",
            items: A(O("Track")),
            limit: 0,
            next: null,
            offset: 0,
            previous: null,
            total: 0,
        },
        "Track": {
            artists: A(O("Profile")),
            disc_number: 0,
            duration_ms: 0,
            explicit: false,
            external_urls: O("ExternalUrls"),
            href: "",
            id: "",
            is_playable: false,
            name: "",
            preview_url: U(null, ""),
            track_number: 0,
            type: E("ItemType"),
            uri: "",
            album: U(null, O("Album1")),
            external_ids: U(null, O("ItemExternalIDS")),
            popularity: U(null, 0),
            linked_from: U(null, O("Profile")),
        },
        "Album1": {
            album_type: "",
            artists: A(O("Profile")),
            external_urls: O("ExternalUrls"),
            href: "",
            id: "",
            images: A(O("Image")),
            name: "",
            type: "",
            uri: "",
        },
        "ItemExternalIDS": {
            isrc: "",
        },
        "Artist": {
            external_urls: O("ExternalUrls"),
            followers: O("Followers"),
            genres: A(""),
            href: "",
            id: "",
            images: A(O("Image")),
            name: "",
            popularity: 0,
            type: "",
            uri: "",
        },
        "Playlist": {
            collaborative: false,
            description: "",
            external_urls: O("ExternalUrls"),
            followers: O("Followers"),
            href: "",
            id: "",
            images: A(O("Image")),
            name: "",
            owner: O("Profile"),
            public: false,
            snapshot_id: "",
            tracks: O("PlaylistTracks"),
            type: "",
            uri: "",
        },
        "PlaylistTracks": {
            href: "",
            items: A(O("Item")),
            limit: 0,
            next: null,
            offset: 0,
            previous: null,
            total: 0,
        },
        "Item": {
            added_at: "",
            added_by: O("Profile"),
            is_local: false,
            track: O("Track"),
        },
        "ArtistType": [
            ArtistType.Artist,
            ArtistType.Track,
            ArtistType.User,
        ],
        "ItemType": [
            ItemType.Track,
        ],
    };
}
