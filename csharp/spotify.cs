// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do one of these:
//
//    using QuickType;
//
//    var data = Album.FromJson(jsonString);
//
//    var data = Artist.FromJson(jsonString);
//
//    var data = Playlist.FromJson(jsonString);
//
//    var data = Profile.FromJson(jsonString);
//
//    var data = Track.FromJson(jsonString);

namespace QuickType
{
    using System;
    using System.Net;
    using System.Collections.Generic;

    using Newtonsoft.Json;

    public partial class Album
    {
        [JsonProperty("album_type")]
        public string AlbumType { get; set; }

        [JsonProperty("artists")]
        public Profile[] Artists { get; set; }

        [JsonProperty("copyrights")]
        public Copyright[] Copyrights { get; set; }

        [JsonProperty("external_ids")]
        public AlbumExternalIds ExternalIds { get; set; }

        [JsonProperty("external_urls")]
        public ExternalUrls ExternalUrls { get; set; }

        [JsonProperty("genres")]
        public object[] Genres { get; set; }

        [JsonProperty("href")]
        public string Href { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("images")]
        public Image[] Images { get; set; }

        [JsonProperty("label")]
        public string Label { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("popularity")]
        public long Popularity { get; set; }

        [JsonProperty("release_date")]
        public System.DateTime ReleaseDate { get; set; }

        [JsonProperty("release_date_precision")]
        public string ReleaseDatePrecision { get; set; }

        [JsonProperty("tracks")]
        public AlbumTracks Tracks { get; set; }

        [JsonProperty("type")]
        public string PurpleType { get; set; }

        [JsonProperty("uri")]
        public string Uri { get; set; }
    }

    public partial class Profile
    {
        [JsonProperty("external_urls")]
        public ExternalUrls ExternalUrls { get; set; }

        [JsonProperty("href")]
        public string Href { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("type")]
        public ArtistType PurpleType { get; set; }

        [JsonProperty("uri")]
        public string Uri { get; set; }

        [JsonProperty("display_name")]
        public string DisplayName { get; set; }

        [JsonProperty("followers")]
        public Followers Followers { get; set; }

        [JsonProperty("images")]
        public Image[] Images { get; set; }
    }

    public partial class ExternalUrls
    {
        [JsonProperty("spotify")]
        public string Spotify { get; set; }
    }

    public partial class Followers
    {
        [JsonProperty("href")]
        public object Href { get; set; }

        [JsonProperty("total")]
        public long Total { get; set; }
    }

    public partial class Image
    {
        [JsonProperty("height")]
        public long? Height { get; set; }

        [JsonProperty("url")]
        public string Url { get; set; }

        [JsonProperty("width")]
        public long? Width { get; set; }
    }

    public partial class Copyright
    {
        [JsonProperty("text")]
        public string Text { get; set; }

        [JsonProperty("type")]
        public string PurpleType { get; set; }
    }

    public partial class AlbumExternalIds
    {
        [JsonProperty("upc")]
        public string Upc { get; set; }
    }

    public partial class AlbumTracks
    {
        [JsonProperty("href")]
        public string Href { get; set; }

        [JsonProperty("items")]
        public Track[] Items { get; set; }

        [JsonProperty("limit")]
        public long Limit { get; set; }

        [JsonProperty("next")]
        public object Next { get; set; }

        [JsonProperty("offset")]
        public long Offset { get; set; }

        [JsonProperty("previous")]
        public object Previous { get; set; }

        [JsonProperty("total")]
        public long Total { get; set; }
    }

    public partial class Track
    {
        [JsonProperty("artists")]
        public Profile[] Artists { get; set; }

        [JsonProperty("disc_number")]
        public long DiscNumber { get; set; }

        [JsonProperty("duration_ms")]
        public long DurationMs { get; set; }

        [JsonProperty("explicit")]
        public bool Explicit { get; set; }

        [JsonProperty("external_urls")]
        public ExternalUrls ExternalUrls { get; set; }

        [JsonProperty("href")]
        public string Href { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("is_playable")]
        public bool IsPlayable { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("preview_url")]
        public string PreviewUrl { get; set; }

        [JsonProperty("track_number")]
        public long TrackNumber { get; set; }

        [JsonProperty("type")]
        public ItemType PurpleType { get; set; }

        [JsonProperty("uri")]
        public string Uri { get; set; }

        [JsonProperty("album")]
        public PurpleAlbum Album { get; set; }

        [JsonProperty("external_ids")]
        public ItemExternalIds ExternalIds { get; set; }

        [JsonProperty("popularity")]
        public long? Popularity { get; set; }

        [JsonProperty("linked_from")]
        public Profile LinkedFrom { get; set; }
    }

    public partial class PurpleAlbum
    {
        [JsonProperty("album_type")]
        public string AlbumType { get; set; }

        [JsonProperty("artists")]
        public Profile[] Artists { get; set; }

        [JsonProperty("external_urls")]
        public ExternalUrls ExternalUrls { get; set; }

        [JsonProperty("href")]
        public string Href { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("images")]
        public Image[] Images { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("type")]
        public string PurpleType { get; set; }

        [JsonProperty("uri")]
        public string Uri { get; set; }
    }

    public partial class ItemExternalIds
    {
        [JsonProperty("isrc")]
        public string Isrc { get; set; }
    }

    public partial class Artist
    {
        [JsonProperty("external_urls")]
        public ExternalUrls ExternalUrls { get; set; }

        [JsonProperty("followers")]
        public Followers Followers { get; set; }

        [JsonProperty("genres")]
        public string[] Genres { get; set; }

        [JsonProperty("href")]
        public string Href { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("images")]
        public Image[] Images { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("popularity")]
        public long Popularity { get; set; }

        [JsonProperty("type")]
        public string PurpleType { get; set; }

        [JsonProperty("uri")]
        public string Uri { get; set; }
    }

    public partial class Playlist
    {
        [JsonProperty("collaborative")]
        public bool Collaborative { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }

        [JsonProperty("external_urls")]
        public ExternalUrls ExternalUrls { get; set; }

        [JsonProperty("followers")]
        public Followers Followers { get; set; }

        [JsonProperty("href")]
        public string Href { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("images")]
        public Image[] Images { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("owner")]
        public Profile Owner { get; set; }

        [JsonProperty("public")]
        public bool Public { get; set; }

        [JsonProperty("snapshot_id")]
        public string SnapshotId { get; set; }

        [JsonProperty("tracks")]
        public PlaylistTracks Tracks { get; set; }

        [JsonProperty("type")]
        public string PurpleType { get; set; }

        [JsonProperty("uri")]
        public string Uri { get; set; }
    }

    public partial class PlaylistTracks
    {
        [JsonProperty("href")]
        public string Href { get; set; }

        [JsonProperty("items")]
        public Item[] Items { get; set; }

        [JsonProperty("limit")]
        public long Limit { get; set; }

        [JsonProperty("next")]
        public object Next { get; set; }

        [JsonProperty("offset")]
        public long Offset { get; set; }

        [JsonProperty("previous")]
        public object Previous { get; set; }

        [JsonProperty("total")]
        public long Total { get; set; }
    }

    public partial class Item
    {
        [JsonProperty("added_at")]
        public System.DateTime AddedAt { get; set; }

        [JsonProperty("added_by")]
        public Profile AddedBy { get; set; }

        [JsonProperty("is_local")]
        public bool IsLocal { get; set; }

        [JsonProperty("track")]
        public Track Track { get; set; }
    }

    public enum ArtistType { Artist, Track, User };

    public enum ItemType { Track };

    public partial class Album
    {
        public static Album FromJson(string json) => JsonConvert.DeserializeObject<Album>(json, Converter.Settings);
    }

    public partial class Artist
    {
        public static Artist FromJson(string json) => JsonConvert.DeserializeObject<Artist>(json, Converter.Settings);
    }

    public partial class Playlist
    {
        public static Playlist FromJson(string json) => JsonConvert.DeserializeObject<Playlist>(json, Converter.Settings);
    }

    public partial class Profile
    {
        public static Profile FromJson(string json) => JsonConvert.DeserializeObject<Profile>(json, Converter.Settings);
    }

    public partial class Track
    {
        public static Track FromJson(string json) => JsonConvert.DeserializeObject<Track>(json, Converter.Settings);
    }

    static class ArtistTypeExtensions
    {
        public static ArtistType? ValueForString(string str)
        {
            switch (str)
            {
                case "artist": return ArtistType.Artist;
                case "track": return ArtistType.Track;
                case "user": return ArtistType.User;
                default: return null;
            }
        }

        public static ArtistType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this ArtistType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case ArtistType.Artist: serializer.Serialize(writer, "artist"); break;
                case ArtistType.Track: serializer.Serialize(writer, "track"); break;
                case ArtistType.User: serializer.Serialize(writer, "user"); break;
            }
        }
    }

    static class ItemTypeExtensions
    {
        public static ItemType? ValueForString(string str)
        {
            switch (str)
            {
                case "track": return ItemType.Track;
                default: return null;
            }
        }

        public static ItemType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this ItemType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case ItemType.Track: serializer.Serialize(writer, "track"); break;
            }
        }
    }

    public static class Serialize
    {
        public static string ToJson(this Album self) => JsonConvert.SerializeObject(self, Converter.Settings);
        public static string ToJson(this Artist self) => JsonConvert.SerializeObject(self, Converter.Settings);
        public static string ToJson(this Playlist self) => JsonConvert.SerializeObject(self, Converter.Settings);
        public static string ToJson(this Profile self) => JsonConvert.SerializeObject(self, Converter.Settings);
        public static string ToJson(this Track self) => JsonConvert.SerializeObject(self, Converter.Settings);
    }

    public class Converter: JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(ArtistType) || t == typeof(ItemType) || t == typeof(ArtistType?) || t == typeof(ItemType?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (t == typeof(ArtistType))
                return ArtistTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(ItemType))
                return ItemTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(ArtistType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return ArtistTypeExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(ItemType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return ItemTypeExtensions.ReadJson(reader, serializer);
            }
            throw new Exception("Unknown type");
        }

        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            var t = value.GetType();
            if (t == typeof(ArtistType))
            {
                ((ArtistType)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(ItemType))
            {
                ((ItemType)value).WriteJson(writer, serializer);
                return;
            }
            throw new Exception("Unknown type");
        }

        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters = { new Converter() },
        };
    }
}
