// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using QuickType;
//
//    var data = Album.FromJson(jsonString);

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
        public Artist[] Artists { get; set; }

        [JsonProperty("copyrights")]
        public Copyright[] Copyrights { get; set; }

        [JsonProperty("external_ids")]
        public ExternalIds ExternalIds { get; set; }

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
        public Tracks Tracks { get; set; }

        [JsonProperty("type")]
        public string PurpleType { get; set; }

        [JsonProperty("uri")]
        public string Uri { get; set; }
    }

    public partial class Artist
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
    }

    public partial class ExternalUrls
    {
        [JsonProperty("spotify")]
        public string Spotify { get; set; }
    }

    public partial class Copyright
    {
        [JsonProperty("text")]
        public string Text { get; set; }

        [JsonProperty("type")]
        public string PurpleType { get; set; }
    }

    public partial class ExternalIds
    {
        [JsonProperty("upc")]
        public string Upc { get; set; }
    }

    public partial class Image
    {
        [JsonProperty("height")]
        public long Height { get; set; }

        [JsonProperty("url")]
        public string Url { get; set; }

        [JsonProperty("width")]
        public long Width { get; set; }
    }

    public partial class Tracks
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
        [JsonProperty("artists")]
        public Artist[] Artists { get; set; }

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
    }

    public enum ArtistType { Artist };

    public enum ItemType { Track };

    public partial class Album
    {
        public static Album FromJson(string json) => JsonConvert.DeserializeObject<Album>(json, Converter.Settings);
    }

    static class ArtistTypeExtensions
    {
        public static ArtistType? ValueForString(string str)
        {
            switch (str)
            {
                case "artist": return ArtistType.Artist;
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
