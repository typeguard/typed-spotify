//  To parse this JSON data, first install
//
//      Boost     http://www.boost.org
//      json.hpp  https://github.com/nlohmann/json
//
//  Then include this file, and then do
//
//     Album data = nlohmann::json::parse(jsonString);

#include "json.hpp"

namespace quicktype {
    using nlohmann::json;

    struct ExternalUrls {
        std::string spotify;
    };

    enum class ArtistType { ARTIST };

    struct Artist {
        struct ExternalUrls external_urls;
        std::string href;
        std::string id;
        std::string name;
        ArtistType type;
        std::string uri;
    };

    struct Copyright {
        std::string text;
        std::string type;
    };

    struct ExternalIDS {
        std::string upc;
    };

    struct Image {
        int64_t height;
        std::string url;
        int64_t width;
    };

    enum class ItemType { TRACK };

    struct Item {
        std::vector<struct Artist> artists;
        int64_t disc_number;
        int64_t duration_ms;
        bool purple_explicit;
        struct ExternalUrls external_urls;
        std::string href;
        std::string id;
        bool is_playable;
        std::string name;
        std::string preview_url;
        int64_t track_number;
        ItemType type;
        std::string uri;
    };

    struct Tracks {
        std::string href;
        std::vector<struct Item> items;
        int64_t limit;
        nlohmann::json next;
        int64_t offset;
        nlohmann::json previous;
        int64_t total;
    };

    struct Album {
        std::string album_type;
        std::vector<struct Artist> artists;
        std::vector<struct Copyright> copyrights;
        struct ExternalIDS external_ids;
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
        struct Tracks tracks;
        std::string type;
        std::string uri;
    };
    
    inline json get_untyped(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<json>();
        }
        return json();
    }
}

namespace nlohmann {

    inline void from_json(const json& _j, struct quicktype::ExternalUrls& _x) {
        _x.spotify = _j.at("spotify").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::ExternalUrls& _x) {
        _j = json::object();
        _j["spotify"] = _x.spotify;
    }

    inline void from_json(const json& _j, struct quicktype::Artist& _x) {
        _x.external_urls = _j.at("external_urls").get<struct quicktype::ExternalUrls>();
        _x.href = _j.at("href").get<std::string>();
        _x.id = _j.at("id").get<std::string>();
        _x.name = _j.at("name").get<std::string>();
        _x.type = _j.at("type").get<quicktype::ArtistType>();
        _x.uri = _j.at("uri").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Artist& _x) {
        _j = json::object();
        _j["external_urls"] = _x.external_urls;
        _j["href"] = _x.href;
        _j["id"] = _x.id;
        _j["name"] = _x.name;
        _j["type"] = _x.type;
        _j["uri"] = _x.uri;
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

    inline void from_json(const json& _j, struct quicktype::ExternalIDS& _x) {
        _x.upc = _j.at("upc").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::ExternalIDS& _x) {
        _j = json::object();
        _j["upc"] = _x.upc;
    }

    inline void from_json(const json& _j, struct quicktype::Image& _x) {
        _x.height = _j.at("height").get<int64_t>();
        _x.url = _j.at("url").get<std::string>();
        _x.width = _j.at("width").get<int64_t>();
    }

    inline void to_json(json& _j, const struct quicktype::Image& _x) {
        _j = json::object();
        _j["height"] = _x.height;
        _j["url"] = _x.url;
        _j["width"] = _x.width;
    }

    inline void from_json(const json& _j, struct quicktype::Item& _x) {
        _x.artists = _j.at("artists").get<std::vector<struct quicktype::Artist>>();
        _x.disc_number = _j.at("disc_number").get<int64_t>();
        _x.duration_ms = _j.at("duration_ms").get<int64_t>();
        _x.purple_explicit = _j.at("explicit").get<bool>();
        _x.external_urls = _j.at("external_urls").get<struct quicktype::ExternalUrls>();
        _x.href = _j.at("href").get<std::string>();
        _x.id = _j.at("id").get<std::string>();
        _x.is_playable = _j.at("is_playable").get<bool>();
        _x.name = _j.at("name").get<std::string>();
        _x.preview_url = _j.at("preview_url").get<std::string>();
        _x.track_number = _j.at("track_number").get<int64_t>();
        _x.type = _j.at("type").get<quicktype::ItemType>();
        _x.uri = _j.at("uri").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Item& _x) {
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
    }

    inline void from_json(const json& _j, struct quicktype::Tracks& _x) {
        _x.href = _j.at("href").get<std::string>();
        _x.items = _j.at("items").get<std::vector<struct quicktype::Item>>();
        _x.limit = _j.at("limit").get<int64_t>();
        _x.next = quicktype::get_untyped(_j, "next");
        _x.offset = _j.at("offset").get<int64_t>();
        _x.previous = quicktype::get_untyped(_j, "previous");
        _x.total = _j.at("total").get<int64_t>();
    }

    inline void to_json(json& _j, const struct quicktype::Tracks& _x) {
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
        _x.artists = _j.at("artists").get<std::vector<struct quicktype::Artist>>();
        _x.copyrights = _j.at("copyrights").get<std::vector<struct quicktype::Copyright>>();
        _x.external_ids = _j.at("external_ids").get<struct quicktype::ExternalIDS>();
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
        _x.tracks = _j.at("tracks").get<struct quicktype::Tracks>();
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

    inline void from_json(const json& _j, quicktype::ArtistType& _x) {
        if (_j == "artist") _x = quicktype::ArtistType::ARTIST;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::ArtistType& _x) {
        switch (_x) {
            case quicktype::ArtistType::ARTIST: _j = "artist"; break;
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
