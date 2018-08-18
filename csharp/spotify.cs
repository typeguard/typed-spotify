// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do one of these:
//
//    using QuickType;
//
//    var album = Album.FromJson(jsonString);
//    var artist = Artist.FromJson(jsonString);
//    var playlist = Playlist.FromJson(jsonString);
//    var profile = Profile.FromJson(jsonString);
//    var track = Track.FromJson(jsonString);

namespace QuickType
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class Track
    {
        [JsonProperty("error")]
        public Error Error { get; set; }
    }

    public partial class Error
    {
        [JsonProperty("status")]
        public long Status { get; set; }

        [JsonProperty("message")]
        public string Message { get; set; }
    }

    public partial class Album
    {
        public static Track FromJson(string json) => JsonConvert.DeserializeObject<Track>(json, QuickType.Converter.Settings);
    }

    public partial class Artist
    {
        public static Track FromJson(string json) => JsonConvert.DeserializeObject<Track>(json, QuickType.Converter.Settings);
    }

    public partial class Playlist
    {
        public static Track FromJson(string json) => JsonConvert.DeserializeObject<Track>(json, QuickType.Converter.Settings);
    }

    public partial class Profile
    {
        public static Track FromJson(string json) => JsonConvert.DeserializeObject<Track>(json, QuickType.Converter.Settings);
    }

    public partial class Track
    {
        public static Track FromJson(string json) => JsonConvert.DeserializeObject<Track>(json, QuickType.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this Track self) => JsonConvert.SerializeObject(self, QuickType.Converter.Settings);
    }

    internal static class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters = {
                new IsoDateTimeConverter { DateTimeStyles = DateTimeStyles.AssumeUniversal }
            },
        };
    }
}
