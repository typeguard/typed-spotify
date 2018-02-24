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

    struct Error {
        int64_t status;
        std::string message;
    };

    struct Album {
        struct Error error;
    };

    struct Artist {
        struct Error error;
    };

    struct Playlist {
        struct Error error;
    };

    struct Profile {
        struct Error error;
    };

    struct Track {
        struct Error error;
    };
    
    inline json get_untyped(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<json>();
        }
        return json();
    }
}

namespace nlohmann {
    inline void from_json(const json& _j, struct quicktype::Error& _x) {
        _x.status = _j.at("status").get<int64_t>();
        _x.message = _j.at("message").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Error& _x) {
        _j = json::object();
        _j["status"] = _x.status;
        _j["message"] = _x.message;
    }

    inline void from_json(const json& _j, struct quicktype::Album& _x) {
        _x.error = _j.at("error").get<struct quicktype::Error>();
    }

    inline void to_json(json& _j, const struct quicktype::Album& _x) {
        _j = json::object();
        _j["error"] = _x.error;
    }

    inline void from_json(const json& _j, struct quicktype::Artist& _x) {
        _x.error = _j.at("error").get<struct quicktype::Error>();
    }

    inline void to_json(json& _j, const struct quicktype::Artist& _x) {
        _j = json::object();
        _j["error"] = _x.error;
    }

    inline void from_json(const json& _j, struct quicktype::Playlist& _x) {
        _x.error = _j.at("error").get<struct quicktype::Error>();
    }

    inline void to_json(json& _j, const struct quicktype::Playlist& _x) {
        _j = json::object();
        _j["error"] = _x.error;
    }

    inline void from_json(const json& _j, struct quicktype::Profile& _x) {
        _x.error = _j.at("error").get<struct quicktype::Error>();
    }

    inline void to_json(json& _j, const struct quicktype::Profile& _x) {
        _j = json::object();
        _j["error"] = _x.error;
    }

    inline void from_json(const json& _j, struct quicktype::Track& _x) {
        _x.error = _j.at("error").get<struct quicktype::Error>();
    }

    inline void to_json(json& _j, const struct quicktype::Track& _x) {
        _j = json::object();
        _j["error"] = _x.error;
    }
}
