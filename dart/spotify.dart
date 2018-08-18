// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);
//     final artist = artistFromJson(jsonString);
//     final playlist = playlistFromJson(jsonString);
//     final profile = profileFromJson(jsonString);
//     final track = trackFromJson(jsonString);

import 'dart:convert';

Track albumFromJson(String str) {
    final jsonData = json.decode(str);
    return Track.fromJson(jsonData);
}

String albumToJson(Track data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

Track artistFromJson(String str) {
    final jsonData = json.decode(str);
    return Track.fromJson(jsonData);
}

String artistToJson(Track data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

Track playlistFromJson(String str) {
    final jsonData = json.decode(str);
    return Track.fromJson(jsonData);
}

String playlistToJson(Track data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

Track profileFromJson(String str) {
    final jsonData = json.decode(str);
    return Track.fromJson(jsonData);
}

String profileToJson(Track data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

Track trackFromJson(String str) {
    final jsonData = json.decode(str);
    return Track.fromJson(jsonData);
}

String trackToJson(Track data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Track {
    Error error;

    Track({
        this.error,
    });

    factory Track.fromJson(Map<String, dynamic> json) => new Track(
        error: Error.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error.toJson(),
    };
}

class Error {
    int status;
    String message;

    Error({
        this.status,
        this.message,
    });

    factory Error.fromJson(Map<String, dynamic> json) => new Error(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
