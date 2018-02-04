//  To parse this JSON data, first install
//
//      Boost     http://www.boost.org
//      json.hpp  https://github.com/nlohmann/json
//
//  Then include this file, and then do
//
//     Album data = nlohmann::json::parse(jsonString);
//     Artist data = nlohmann::json::parse(jsonString);
//     Playlist data = nlohmann::json::parse(jsonString);
//     Profile data = nlohmann::json::parse(jsonString);
//     Track data = nlohmann::json::parse(jsonString);

#include "json.hpp"

namespace quicktype {
    using nlohmann::json;

    struct ExternalUrls {
        std::string spotify;
    };

    struct Followers {
        nlohmann::json href;
        int64_t total;
    };

    struct Image {
        std::unique_ptr<int64_t> height;
        std::string url;
        std::unique_ptr<int64_t> width;
    };

    enum class ArtistType { ARTIST, TRACK, USER };

    struct Profile {
        struct ExternalUrls external_urls;
        std::string href;
        std::string id;
        std::unique_ptr<std::string> name;
        ArtistType type;
        std::string uri;
        std::unique_ptr<std::string> display_name;
        std::unique_ptr<struct Followers> followers;
        std::unique_ptr<std::vector<struct Image>> images;
    };

    struct Copyright {
        std::string text;
        std::string type;
    };

    struct AlbumExternalIDS {
        std::string upc;
    };

    struct PurpleAlbum {
        std::string album_type;
        std::vector<struct Profile> artists;
        struct ExternalUrls external_urls;
        std::string href;
        std::string id;
        std::vector<struct Image> images;
        std::string name;
        std::string type;
        std::string uri;
    };

    struct ItemExternalIDS {
        std::string isrc;
    };

    enum class ItemType { TRACK };

    struct Track {
        std::vector<struct Profile> artists;
        int64_t disc_number;
        int64_t duration_ms;
        bool purple_explicit;
        struct ExternalUrls external_urls;
        std::string href;
        std::string id;
        bool is_playable;
        std::string name;
        std::unique_ptr<std::string> preview_url;
        int64_t track_number;
        ItemType type;
        std::string uri;
        std::unique_ptr<struct PurpleAlbum> album;
        std::unique_ptr<struct ItemExternalIDS> external_ids;
        std::unique_ptr<int64_t> popularity;
        std::unique_ptr<struct Profile> linked_from;
    };

    struct AlbumTracks {
        std::string href;
        std::vector<struct Track> items;
        int64_t limit;
        nlohmann::json next;
        int64_t offset;
        nlohmann::json previous;
        int64_t total;
    };

    struct Album {
        std::string album_type;
        std::vector<struct Profile> artists;
        std::vector<struct Copyright> copyrights;
        struct AlbumExternalIDS external_ids;
        struct ExternalUrls external_urls;
        std::vector<nlohmann::json> genres;
        std::string href;
        std::string id;
        std::vector<struct Image> images;
        std::string label;
        std::string name;
        int64_t popularity;
        std::string release_date;
        std::string release_date_precision;
        struct AlbumTracks tracks;
        std::string type;
        std::string uri;
    };

    struct ExternalUrls {
        std::string spotify;
    };

    struct Followers {
        nlohmann::json href;
        int64_t total;
    };

    struct Image {
        std::unique_ptr<int64_t> height;
        std::string url;
        std::unique_ptr<int64_t> width;
    };

    struct Artist {
        struct ExternalUrls external_urls;
        struct Followers followers;
        std::vector<std::string> genres;
        std::string href;
        std::string id;
        std::vector<struct Image> images;
        std::string name;
        int64_t popularity;
        std::string type;
        std::string uri;
    };

    struct ExternalUrls {
        std::string spotify;
    };

    struct Followers {
        nlohmann::json href;
        int64_t total;
    };

    struct Image {
        std::unique_ptr<int64_t> height;
        std::string url;
        std::unique_ptr<int64_t> width;
    };

    enum class ArtistType { ARTIST, TRACK, USER };

    struct Profile {
        struct ExternalUrls external_urls;
        std::string href;
        std::string id;
        std::unique_ptr<std::string> name;
        ArtistType type;
        std::string uri;
        std::unique_ptr<std::string> display_name;
        std::unique_ptr<struct Followers> followers;
        std::unique_ptr<std::vector<struct Image>> images;
    };

    struct PurpleAlbum {
        std::string album_type;
        std::vector<struct Profile> artists;
        struct ExternalUrls external_urls;
        std::string href;
        std::string id;
        std::vector<struct Image> images;
        std::string name;
        std::string type;
        std::string uri;
    };

    struct ItemExternalIDS {
        std::string isrc;
    };

    enum class ItemType { TRACK };

    struct Track {
        std::vector<struct Profile> artists;
        int64_t disc_number;
        int64_t duration_ms;
        bool purple_explicit;
        struct ExternalUrls external_urls;
        std::string href;
        std::string id;
        bool is_playable;
        std::string name;
        std::unique_ptr<std::string> preview_url;
        int64_t track_number;
        ItemType type;
        std::string uri;
        std::unique_ptr<struct PurpleAlbum> album;
        std::unique_ptr<struct ItemExternalIDS> external_ids;
        std::unique_ptr<int64_t> popularity;
        std::unique_ptr<struct Profile> linked_from;
    };

    struct Item {
        std::string added_at;
        struct Profile added_by;
        bool is_local;
        struct Track track;
    };

    struct PlaylistTracks {
        std::string href;
        std::vector<struct Item> items;
        int64_t limit;
        nlohmann::json next;
        int64_t offset;
        nlohmann::json previous;
        int64_t total;
    };

    struct Playlist {
        bool collaborative;
        std::string description;
        struct ExternalUrls external_urls;
        struct Followers followers;
        std::string href;
        std::string id;
        std::vector<struct Image> images;
        std::string name;
        struct Profile owner;
        bool purple_public;
        std::string snapshot_id;
        struct PlaylistTracks tracks;
        std::string type;
        std::string uri;
    };
    
    inline json get_untyped(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<json>();
        }
        return json();
    }
    
    template <typename T>
    inline std::unique_ptr<T> get_optional(const json &j, const char *property) {
        if (j.find(property) != j.end())
            return j.at(property).get<std::unique_ptr<T>>();
        return std::unique_ptr<T>();
    }
}

namespace nlohmann {
    template <typename T>
    struct adl_serializer<std::unique_ptr<T>> {
        static void to_json(json& j, const std::unique_ptr<T>& opt) {
            if (!opt)
                j = nullptr;
            else
                j = *opt;
        }

        static std::unique_ptr<T> from_json(const json& j) {
            if (j.is_null())
                return std::unique_ptr<T>();
            else
                return std::unique_ptr<T>(new T(j.get<T>()));
        }
    };

    inline void from_json(const json& _j, struct quicktype::ExternalUrls& _x) {
        _x.spotify = _j.at("spotify").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::ExternalUrls& _x) {
        _j = json::object();
        _j["spotify"] = _x.spotify;
    }

    inline void from_json(const json& _j, struct quicktype::Followers& _x) {
        _x.href = quicktype::get_untyped(_j, "href");
        _x.total = _j.at("total").get<int64_t>();
    }

    inline void to_json(json& _j, const struct quicktype::Followers& _x) {
        _j = json::object();
        _j["href"] = _x.href;
        _j["total"] = _x.total;
    }

    inline void from_json(const json& _j, struct quicktype::Image& _x) {
        _x.height = quicktype::get_optional<int64_t>(_j, "height");
        _x.url = _j.at("url").get<std::string>();
        _x.width = quicktype::get_optional<int64_t>(_j, "width");
    }

    inline void to_json(json& _j, const struct quicktype::Image& _x) {
        _j = json::object();
        _j["height"] = _x.height;
        _j["url"] = _x.url;
        _j["width"] = _x.width;
    }

    inline void from_json(const json& _j, struct quicktype::Profile& _x) {
        _x.external_urls = _j.at("external_urls").get<struct quicktype::ExternalUrls>();
        _x.href = _j.at("href").get<std::string>();
        _x.id = _j.at("id").get<std::string>();
        _x.name = quicktype::get_optional<std::string>(_j, "name");
        _x.type = _j.at("type").get<quicktype::ArtistType>();
        _x.uri = _j.at("uri").get<std::string>();
        _x.display_name = quicktype::get_optional<std::string>(_j, "display_name");
        _x.followers = quicktype::get_optional<struct quicktype::Followers>(_j, "followers");
        _x.images = quicktype::get_optional<std::vector<struct quicktype::Image>>(_j, "images");
    }

    inline void to_json(json& _j, const struct quicktype::Profile& _x) {
        _j = json::object();
        _j["external_urls"] = _x.external_urls;
        _j["href"] = _x.href;
        _j["id"] = _x.id;
        _j["name"] = _x.name;
        _j["type"] = _x.type;
        _j["uri"] = _x.uri;
        _j["display_name"] = _x.display_name;
        _j["followers"] = _x.followers;
        _j["images"] = _x.images;
    }

    inline void from_json(const json& _j, struct quicktype::Copyright& _x) {
        _x.text = _j.at("text").get<std::string>();
        _x.type = _j.at("type").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Copyright& _x) {
        _j = json::object();
        _j["text"] = _x.text;
        _j["type"] = _x.type;
    }

    inline void from_json(const json& _j, struct quicktype::AlbumExternalIDS& _x) {
        _x.upc = _j.at("upc").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::AlbumExternalIDS& _x) {
        _j = json::object();
        _j["upc"] = _x.upc;
    }

    inline void from_json(const json& _j, struct quicktype::PurpleAlbum& _x) {
        _x.album_type = _j.at("album_type").get<std::string>();
        _x.artists = _j.at("artists").get<std::vector<struct quicktype::Profile>>();
        _x.external_urls = _j.at("external_urls").get<struct quicktype::ExternalUrls>();
        _x.href = _j.at("href").get<std::string>();
        _x.id = _j.at("id").get<std::string>();
        _x.images = _j.at("images").get<std::vector<struct quicktype::Image>>();
        _x.name = _j.at("name").get<std::string>();
        _x.type = _j.at("type").get<std::string>();
        _x.uri = _j.at("uri").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::PurpleAlbum& _x) {
        _j = json::object();
        _j["album_type"] = _x.album_type;
        _j["artists"] = _x.artists;
        _j["external_urls"] = _x.external_urls;
        _j["href"] = _x.href;
        _j["id"] = _x.id;
        _j["images"] = _x.images;
        _j["name"] = _x.name;
        _j["type"] = _x.type;
        _j["uri"] = _x.uri;
    }

    inline void from_json(const json& _j, struct quicktype::ItemExternalIDS& _x) {
        _x.isrc = _j.at("isrc").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::ItemExternalIDS& _x) {
        _j = json::object();
        _j["isrc"] = _x.isrc;
    }

    inline void from_json(const json& _j, struct quicktype::Track& _x) {
        _x.artists = _j.at("artists").get<std::vector<struct quicktype::Profile>>();
        _x.disc_number = _j.at("disc_number").get<int64_t>();
        _x.duration_ms = _j.at("duration_ms").get<int64_t>();
        _x.purple_explicit = _j.at("explicit").get<bool>();
        _x.external_urls = _j.at("external_urls").get<struct quicktype::ExternalUrls>();
        _x.href = _j.at("href").get<std::string>();
        _x.id = _j.at("id").get<std::string>();
        _x.is_playable = _j.at("is_playable").get<bool>();
        _x.name = _j.at("name").get<std::string>();
        _x.preview_url = quicktype::get_optional<std::string>(_j, "preview_url");
        _x.track_number = _j.at("track_number").get<int64_t>();
        _x.type = _j.at("type").get<quicktype::ItemType>();
        _x.uri = _j.at("uri").get<std::string>();
        _x.album = quicktype::get_optional<struct quicktype::PurpleAlbum>(_j, "album");
        _x.external_ids = quicktype::get_optional<struct quicktype::ItemExternalIDS>(_j, "external_ids");
        _x.popularity = quicktype::get_optional<int64_t>(_j, "popularity");
        _x.linked_from = quicktype::get_optional<struct quicktype::Profile>(_j, "linked_from");
    }

    inline void to_json(json& _j, const struct quicktype::Track& _x) {
        _j = json::object();
        _j["artists"] = _x.artists;
        _j["disc_number"] = _x.disc_number;
        _j["duration_ms"] = _x.duration_ms;
        _j["explicit"] = _x.purple_explicit;
        _j["external_urls"] = _x.external_urls;
        _j["href"] = _x.href;
        _j["id"] = _x.id;
        _j["is_playable"] = _x.is_playable;
        _j["name"] = _x.name;
        _j["preview_url"] = _x.preview_url;
        _j["track_number"] = _x.track_number;
        _j["type"] = _x.type;
        _j["uri"] = _x.uri;
        _j["album"] = _x.album;
        _j["external_ids"] = _x.external_ids;
        _j["popularity"] = _x.popularity;
        _j["linked_from"] = _x.linked_from;
    }

    inline void from_json(const json& _j, struct quicktype::AlbumTracks& _x) {
        _x.href = _j.at("href").get<std::string>();
        _x.items = _j.at("items").get<std::vector<struct quicktype::Track>>();
        _x.limit = _j.at("limit").get<int64_t>();
        _x.next = quicktype::get_untyped(_j, "next");
        _x.offset = _j.at("offset").get<int64_t>();
        _x.previous = quicktype::get_untyped(_j, "previous");
        _x.total = _j.at("total").get<int64_t>();
    }

    inline void to_json(json& _j, const struct quicktype::AlbumTracks& _x) {
        _j = json::object();
        _j["href"] = _x.href;
        _j["items"] = _x.items;
        _j["limit"] = _x.limit;
        _j["next"] = _x.next;
        _j["offset"] = _x.offset;
        _j["previous"] = _x.previous;
        _j["total"] = _x.total;
    }

    inline void from_json(const json& _j, struct quicktype::Album& _x) {
        _x.album_type = _j.at("album_type").get<std::string>();
        _x.artists = _j.at("artists").get<std::vector<struct quicktype::Profile>>();
        _x.copyrights = _j.at("copyrights").get<std::vector<struct quicktype::Copyright>>();
        _x.external_ids = _j.at("external_ids").get<struct quicktype::AlbumExternalIDS>();
        _x.external_urls = _j.at("external_urls").get<struct quicktype::ExternalUrls>();
        _x.genres = _j.at("genres").get<std::vector<json>>();
        _x.href = _j.at("href").get<std::string>();
        _x.id = _j.at("id").get<std::string>();
        _x.images = _j.at("images").get<std::vector<struct quicktype::Image>>();
        _x.label = _j.at("label").get<std::string>();
        _x.name = _j.at("name").get<std::string>();
        _x.popularity = _j.at("popularity").get<int64_t>();
        _x.release_date = _j.at("release_date").get<std::string>();
        _x.release_date_precision = _j.at("release_date_precision").get<std::string>();
        _x.tracks = _j.at("tracks").get<struct quicktype::AlbumTracks>();
        _x.type = _j.at("type").get<std::string>();
        _x.uri = _j.at("uri").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Album& _x) {
        _j = json::object();
        _j["album_type"] = _x.album_type;
        _j["artists"] = _x.artists;
        _j["copyrights"] = _x.copyrights;
        _j["external_ids"] = _x.external_ids;
        _j["external_urls"] = _x.external_urls;
        _j["genres"] = _x.genres;
        _j["href"] = _x.href;
        _j["id"] = _x.id;
        _j["images"] = _x.images;
        _j["label"] = _x.label;
        _j["name"] = _x.name;
        _j["popularity"] = _x.popularity;
        _j["release_date"] = _x.release_date;
        _j["release_date_precision"] = _x.release_date_precision;
        _j["tracks"] = _x.tracks;
        _j["type"] = _x.type;
        _j["uri"] = _x.uri;
    }

    inline void from_json(const json& _j, struct quicktype::Artist& _x) {
        _x.external_urls = _j.at("external_urls").get<struct quicktype::ExternalUrls>();
        _x.followers = _j.at("followers").get<struct quicktype::Followers>();
        _x.genres = _j.at("genres").get<std::vector<std::string>>();
        _x.href = _j.at("href").get<std::string>();
        _x.id = _j.at("id").get<std::string>();
        _x.images = _j.at("images").get<std::vector<struct quicktype::Image>>();
        _x.name = _j.at("name").get<std::string>();
        _x.popularity = _j.at("popularity").get<int64_t>();
        _x.type = _j.at("type").get<std::string>();
        _x.uri = _j.at("uri").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Artist& _x) {
        _j = json::object();
        _j["external_urls"] = _x.external_urls;
        _j["followers"] = _x.followers;
        _j["genres"] = _x.genres;
        _j["href"] = _x.href;
        _j["id"] = _x.id;
        _j["images"] = _x.images;
        _j["name"] = _x.name;
        _j["popularity"] = _x.popularity;
        _j["type"] = _x.type;
        _j["uri"] = _x.uri;
    }

    inline void from_json(const json& _j, struct quicktype::Item& _x) {
        _x.added_at = _j.at("added_at").get<std::string>();
        _x.added_by = _j.at("added_by").get<struct quicktype::Profile>();
        _x.is_local = _j.at("is_local").get<bool>();
        _x.track = _j.at("track").get<struct quicktype::Track>();
    }

    inline void to_json(json& _j, const struct quicktype::Item& _x) {
        _j = json::object();
        _j["added_at"] = _x.added_at;
        _j["added_by"] = _x.added_by;
        _j["is_local"] = _x.is_local;
        _j["track"] = _x.track;
    }

    inline void from_json(const json& _j, struct quicktype::PlaylistTracks& _x) {
        _x.href = _j.at("href").get<std::string>();
        _x.items = _j.at("items").get<std::vector<struct quicktype::Item>>();
        _x.limit = _j.at("limit").get<int64_t>();
        _x.next = quicktype::get_untyped(_j, "next");
        _x.offset = _j.at("offset").get<int64_t>();
        _x.previous = quicktype::get_untyped(_j, "previous");
        _x.total = _j.at("total").get<int64_t>();
    }

    inline void to_json(json& _j, const struct quicktype::PlaylistTracks& _x) {
        _j = json::object();
        _j["href"] = _x.href;
        _j["items"] = _x.items;
        _j["limit"] = _x.limit;
        _j["next"] = _x.next;
        _j["offset"] = _x.offset;
        _j["previous"] = _x.previous;
        _j["total"] = _x.total;
    }

    inline void from_json(const json& _j, struct quicktype::Playlist& _x) {
        _x.collaborative = _j.at("collaborative").get<bool>();
        _x.description = _j.at("description").get<std::string>();
        _x.external_urls = _j.at("external_urls").get<struct quicktype::ExternalUrls>();
        _x.followers = _j.at("followers").get<struct quicktype::Followers>();
        _x.href = _j.at("href").get<std::string>();
        _x.id = _j.at("id").get<std::string>();
        _x.images = _j.at("images").get<std::vector<struct quicktype::Image>>();
        _x.name = _j.at("name").get<std::string>();
        _x.owner = _j.at("owner").get<struct quicktype::Profile>();
        _x.purple_public = _j.at("public").get<bool>();
        _x.snapshot_id = _j.at("snapshot_id").get<std::string>();
        _x.tracks = _j.at("tracks").get<struct quicktype::PlaylistTracks>();
        _x.type = _j.at("type").get<std::string>();
        _x.uri = _j.at("uri").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Playlist& _x) {
        _j = json::object();
        _j["collaborative"] = _x.collaborative;
        _j["description"] = _x.description;
        _j["external_urls"] = _x.external_urls;
        _j["followers"] = _x.followers;
        _j["href"] = _x.href;
        _j["id"] = _x.id;
        _j["images"] = _x.images;
        _j["name"] = _x.name;
        _j["owner"] = _x.owner;
        _j["public"] = _x.purple_public;
        _j["snapshot_id"] = _x.snapshot_id;
        _j["tracks"] = _x.tracks;
        _j["type"] = _x.type;
        _j["uri"] = _x.uri;
    }

    inline void from_json(const json& _j, quicktype::ArtistType& _x) {
        if (_j == "artist") _x = quicktype::ArtistType::ARTIST;
        else if (_j == "track") _x = quicktype::ArtistType::TRACK;
        else if (_j == "user") _x = quicktype::ArtistType::USER;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::ArtistType& _x) {
        switch (_x) {
            case quicktype::ArtistType::ARTIST: _j = "artist"; break;
            case quicktype::ArtistType::TRACK: _j = "track"; break;
            case quicktype::ArtistType::USER: _j = "user"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::ItemType& _x) {
        if (_j == "track") _x = quicktype::ItemType::TRACK;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::ItemType& _x) {
        switch (_x) {
            case quicktype::ItemType::TRACK: _j = "track"; break;
            default: throw "This should not happen";
        }
    }

}
