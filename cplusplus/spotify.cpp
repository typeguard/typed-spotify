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

#pragma once

#include "json.hpp"

#include <boost/optional.hpp>
#include <stdexcept>
#include <regex>
namespace quicktype {
    using nlohmann::json;

    inline json get_untyped(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<json>();
        }
        return json();
    }

    class Error {
        public:
        Error() = default;
        virtual ~Error() = default;

        private:
        int64_t status;
        std::string message;

        public:
        const int64_t & get_status() const { return status; }
        int64_t & get_mutable_status() { return status; }
        void set_status(const int64_t& value) { this->status = value; }

        const std::string & get_message() const { return message; }
        std::string & get_mutable_message() { return message; }
        void set_message(const std::string& value) { this->message = value; }
    };

    class Track {
        public:
        Track() = default;
        virtual ~Track() = default;

        private:
        Error error;

        public:
        const Error & get_error() const { return error; }
        Error & get_mutable_error() { return error; }
        void set_error(const Error& value) { this->error = value; }
    };
}

namespace nlohmann {
    inline void from_json(const json& _j, quicktype::Error& _x) {
        _x.set_status( _j.at("status").get<int64_t>() );
        _x.set_message( _j.at("message").get<std::string>() );
    }

    inline void to_json(json& _j, const quicktype::Error& _x) {
        _j = json::object();
        _j["status"] = _x.get_status();
        _j["message"] = _x.get_message();
    }

    inline void from_json(const json& _j, quicktype::Track& _x) {
        _x.set_error( _j.at("error").get<quicktype::Error>() );
    }

    inline void to_json(json& _j, const quicktype::Track& _x) {
        _j = json::object();
        _j["error"] = _x.get_error();
    }
}
