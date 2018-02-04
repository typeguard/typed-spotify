-- To decode the JSON data, add this file to your project, run
--
--     elm-package install NoRedInk/elm-decode-pipeline
--
-- add these imports
--
--     import Json.Decode exposing (decodeString)`);
--     import QuickType exposing (album, artist, playlist, profile, track)
--
-- and you're off to the races with
--
--     decodeString album myJsonString
--     decodeString artist myJsonString
--     decodeString playlist myJsonString
--     decodeString profile myJsonString
--     decodeString track myJsonString

module QuickType exposing
    ( Album
    , albumToString
    , album
    , Artist
    , artistToString
    , artist
    , Playlist
    , playlistToString
    , playlist
    , Profile
    , profileToString
    , profile
    , Track
    , trackToString
    , track
    , ExternalUrls
    , Followers
    , Image
    , Copyright
    , AlbumExternalIDS
    , AlbumTracks
    , PurpleAlbum
    , ItemExternalIDS
    , PlaylistTracks
    , Item
    , ArtistType(..)
    , ItemType(..)
    )

import Json.Decode as Jdec
import Json.Decode.Pipeline as Jpipe
import Json.Encode as Jenc
import Dict exposing (Dict, map, toList)
import Array exposing (Array, map)

type alias Album =
    { albumType : String
    , artists : Array Profile
    , copyrights : Array Copyright
    , externalIDS : AlbumExternalIDS
    , externalUrls : ExternalUrls
    , genres : Array Jdec.Value
    , href : String
    , id : String
    , images : Array Image
    , label : String
    , name : String
    , popularity : Int
    , releaseDate : String
    , releaseDatePrecision : String
    , tracks : AlbumTracks
    , purpleType : String
    , uri : String
    }

type alias Profile =
    { externalUrls : ExternalUrls
    , href : String
    , id : String
    , name : Maybe String
    , purpleType : ArtistType
    , uri : String
    , displayName : Maybe String
    , followers : Maybe Followers
    , images : Maybe (Array Image)
    }

type alias ExternalUrls =
    { spotify : String
    }

type alias Followers =
    { href : ()
    , total : Int
    }

type alias Image =
    { height : Maybe Int
    , url : String
    , width : Maybe Int
    }

type ArtistType
    = PurpleArtist
    | PurpleTrack
    | User

type alias Copyright =
    { text : String
    , purpleType : String
    }

type alias AlbumExternalIDS =
    { upc : String
    }

type alias AlbumTracks =
    { href : String
    , items : Array Track
    , limit : Int
    , next : ()
    , offset : Int
    , previous : ()
    , total : Int
    }

type alias Track =
    { artists : Array Profile
    , discNumber : Int
    , durationMS : Int
    , explicit : Bool
    , externalUrls : ExternalUrls
    , href : String
    , id : String
    , isPlayable : Bool
    , name : String
    , previewURL : Maybe String
    , trackNumber : Int
    , purpleType : ItemType
    , uri : String
    , album : Maybe PurpleAlbum
    , externalIDS : Maybe ItemExternalIDS
    , popularity : Maybe Int
    , linkedFrom : Maybe Profile
    }

type alias PurpleAlbum =
    { albumType : String
    , artists : Array Profile
    , externalUrls : ExternalUrls
    , href : String
    , id : String
    , images : Array Image
    , name : String
    , purpleType : String
    , uri : String
    }

type alias ItemExternalIDS =
    { isrc : String
    }

type ItemType
    = FluffyTrack

type alias Artist =
    { externalUrls : ExternalUrls
    , followers : Followers
    , genres : Array String
    , href : String
    , id : String
    , images : Array Image
    , name : String
    , popularity : Int
    , purpleType : String
    , uri : String
    }

type alias ExternalUrls =
    { spotify : String
    }

type alias Followers =
    { href : ()
    , total : Int
    }

type alias Image =
    { height : Maybe Int
    , url : String
    , width : Maybe Int
    }

type alias Playlist =
    { collaborative : Bool
    , description : String
    , externalUrls : ExternalUrls
    , followers : Followers
    , href : String
    , id : String
    , images : Array Image
    , name : String
    , owner : Profile
    , public : Bool
    , snapshotID : String
    , tracks : PlaylistTracks
    , purpleType : String
    , uri : String
    }

type alias ExternalUrls =
    { spotify : String
    }

type alias Followers =
    { href : ()
    , total : Int
    }

type alias Image =
    { height : Maybe Int
    , url : String
    , width : Maybe Int
    }

type alias Profile =
    { externalUrls : ExternalUrls
    , href : String
    , id : String
    , name : Maybe String
    , purpleType : ArtistType
    , uri : String
    , displayName : Maybe String
    , followers : Maybe Followers
    , images : Maybe (Array Image)
    }

type ArtistType
    = PurpleArtist
    | PurpleTrack
    | User

type alias PlaylistTracks =
    { href : String
    , items : Array Item
    , limit : Int
    , next : ()
    , offset : Int
    , previous : ()
    , total : Int
    }

type alias Item =
    { addedAt : String
    , addedBy : Profile
    , isLocal : Bool
    , track : Track
    }

type alias Track =
    { artists : Array Profile
    , discNumber : Int
    , durationMS : Int
    , explicit : Bool
    , externalUrls : ExternalUrls
    , href : String
    , id : String
    , isPlayable : Bool
    , name : String
    , previewURL : Maybe String
    , trackNumber : Int
    , purpleType : ItemType
    , uri : String
    , album : Maybe PurpleAlbum
    , externalIDS : Maybe ItemExternalIDS
    , popularity : Maybe Int
    , linkedFrom : Maybe Profile
    }

type alias PurpleAlbum =
    { albumType : String
    , artists : Array Profile
    , externalUrls : ExternalUrls
    , href : String
    , id : String
    , images : Array Image
    , name : String
    , purpleType : String
    , uri : String
    }

type alias ItemExternalIDS =
    { isrc : String
    }

type ItemType
    = FluffyTrack

-- decoders and encoders

albumToString : Album -> String
albumToString r = Jenc.encode 0 (encodeAlbum r)

artistToString : Artist -> String
artistToString r = Jenc.encode 0 (encodeArtist r)

playlistToString : Playlist -> String
playlistToString r = Jenc.encode 0 (encodePlaylist r)

profileToString : Profile -> String
profileToString r = Jenc.encode 0 (encodeProfile r)

trackToString : Track -> String
trackToString r = Jenc.encode 0 (encodeTrack r)

album : Jdec.Decoder Album
album =
    Jpipe.decode Album
        |> Jpipe.required "album_type" Jdec.string
        |> Jpipe.required "artists" (Jdec.array profile)
        |> Jpipe.required "copyrights" (Jdec.array copyright)
        |> Jpipe.required "external_ids" albumExternalIDS
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "genres" (Jdec.array Jdec.value)
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "images" (Jdec.array image)
        |> Jpipe.required "label" Jdec.string
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.required "popularity" Jdec.int
        |> Jpipe.required "release_date" Jdec.string
        |> Jpipe.required "release_date_precision" Jdec.string
        |> Jpipe.required "tracks" albumTracks
        |> Jpipe.required "type" Jdec.string
        |> Jpipe.required "uri" Jdec.string

encodeAlbum : Album -> Jenc.Value
encodeAlbum x =
    Jenc.object
        [ ("album_type", Jenc.string x.albumType)
        , ("artists", makeArrayEncoder encodeProfile x.artists)
        , ("copyrights", makeArrayEncoder encodeCopyright x.copyrights)
        , ("external_ids", encodeAlbumExternalIDS x.externalIDS)
        , ("external_urls", encodeExternalUrls x.externalUrls)
        , ("genres", makeArrayEncoder identity x.genres)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("images", makeArrayEncoder encodeImage x.images)
        , ("label", Jenc.string x.label)
        , ("name", Jenc.string x.name)
        , ("popularity", Jenc.int x.popularity)
        , ("release_date", Jenc.string x.releaseDate)
        , ("release_date_precision", Jenc.string x.releaseDatePrecision)
        , ("tracks", encodeAlbumTracks x.tracks)
        , ("type", Jenc.string x.purpleType)
        , ("uri", Jenc.string x.uri)
        ]

profile : Jdec.Decoder Profile
profile =
    Jpipe.decode Profile
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.optional "name" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "type" artistType
        |> Jpipe.required "uri" Jdec.string
        |> Jpipe.optional "display_name" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "followers" (Jdec.nullable followers) Nothing
        |> Jpipe.optional "images" (Jdec.nullable (Jdec.array image)) Nothing

encodeProfile : Profile -> Jenc.Value
encodeProfile x =
    Jenc.object
        [ ("external_urls", encodeExternalUrls x.externalUrls)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("name", makeNullableEncoder Jenc.string x.name)
        , ("type", encodeArtistType x.purpleType)
        , ("uri", Jenc.string x.uri)
        , ("display_name", makeNullableEncoder Jenc.string x.displayName)
        , ("followers", makeNullableEncoder encodeFollowers x.followers)
        , ("images", makeNullableEncoder (makeArrayEncoder encodeImage) x.images)
        ]

externalUrls : Jdec.Decoder ExternalUrls
externalUrls =
    Jpipe.decode ExternalUrls
        |> Jpipe.required "spotify" Jdec.string

encodeExternalUrls : ExternalUrls -> Jenc.Value
encodeExternalUrls x =
    Jenc.object
        [ ("spotify", Jenc.string x.spotify)
        ]

followers : Jdec.Decoder Followers
followers =
    Jpipe.decode Followers
        |> Jpipe.optional "href" (Jdec.null ()) ()
        |> Jpipe.required "total" Jdec.int

encodeFollowers : Followers -> Jenc.Value
encodeFollowers x =
    Jenc.object
        [ ("href", always Jenc.null x.href)
        , ("total", Jenc.int x.total)
        ]

image : Jdec.Decoder Image
image =
    Jpipe.decode Image
        |> Jpipe.optional "height" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.required "url" Jdec.string
        |> Jpipe.optional "width" (Jdec.nullable Jdec.int) Nothing

encodeImage : Image -> Jenc.Value
encodeImage x =
    Jenc.object
        [ ("height", makeNullableEncoder Jenc.int x.height)
        , ("url", Jenc.string x.url)
        , ("width", makeNullableEncoder Jenc.int x.width)
        ]

artistType : Jdec.Decoder ArtistType
artistType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "artist" -> Jdec.succeed PurpleArtist
                "track" -> Jdec.succeed PurpleTrack
                "user" -> Jdec.succeed User
                somethingElse -> Jdec.fail <| "Invalid ArtistType: " ++ somethingElse
        )

encodeArtistType : ArtistType -> Jenc.Value
encodeArtistType x = case x of
    PurpleArtist -> Jenc.string "artist"
    PurpleTrack -> Jenc.string "track"
    User -> Jenc.string "user"

copyright : Jdec.Decoder Copyright
copyright =
    Jpipe.decode Copyright
        |> Jpipe.required "text" Jdec.string
        |> Jpipe.required "type" Jdec.string

encodeCopyright : Copyright -> Jenc.Value
encodeCopyright x =
    Jenc.object
        [ ("text", Jenc.string x.text)
        , ("type", Jenc.string x.purpleType)
        ]

albumExternalIDS : Jdec.Decoder AlbumExternalIDS
albumExternalIDS =
    Jpipe.decode AlbumExternalIDS
        |> Jpipe.required "upc" Jdec.string

encodeAlbumExternalIDS : AlbumExternalIDS -> Jenc.Value
encodeAlbumExternalIDS x =
    Jenc.object
        [ ("upc", Jenc.string x.upc)
        ]

albumTracks : Jdec.Decoder AlbumTracks
albumTracks =
    Jpipe.decode AlbumTracks
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "items" (Jdec.array track)
        |> Jpipe.required "limit" Jdec.int
        |> Jpipe.optional "next" (Jdec.null ()) ()
        |> Jpipe.required "offset" Jdec.int
        |> Jpipe.optional "previous" (Jdec.null ()) ()
        |> Jpipe.required "total" Jdec.int

encodeAlbumTracks : AlbumTracks -> Jenc.Value
encodeAlbumTracks x =
    Jenc.object
        [ ("href", Jenc.string x.href)
        , ("items", makeArrayEncoder encodeTrack x.items)
        , ("limit", Jenc.int x.limit)
        , ("next", always Jenc.null x.next)
        , ("offset", Jenc.int x.offset)
        , ("previous", always Jenc.null x.previous)
        , ("total", Jenc.int x.total)
        ]

track : Jdec.Decoder Track
track =
    Jpipe.decode Track
        |> Jpipe.required "artists" (Jdec.array profile)
        |> Jpipe.required "disc_number" Jdec.int
        |> Jpipe.required "duration_ms" Jdec.int
        |> Jpipe.required "explicit" Jdec.bool
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "is_playable" Jdec.bool
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.optional "preview_url" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "track_number" Jdec.int
        |> Jpipe.required "type" itemType
        |> Jpipe.required "uri" Jdec.string
        |> Jpipe.optional "album" (Jdec.nullable purpleAlbum) Nothing
        |> Jpipe.optional "external_ids" (Jdec.nullable itemExternalIDS) Nothing
        |> Jpipe.optional "popularity" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.optional "linked_from" (Jdec.nullable profile) Nothing

encodeTrack : Track -> Jenc.Value
encodeTrack x =
    Jenc.object
        [ ("artists", makeArrayEncoder encodeProfile x.artists)
        , ("disc_number", Jenc.int x.discNumber)
        , ("duration_ms", Jenc.int x.durationMS)
        , ("explicit", Jenc.bool x.explicit)
        , ("external_urls", encodeExternalUrls x.externalUrls)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("is_playable", Jenc.bool x.isPlayable)
        , ("name", Jenc.string x.name)
        , ("preview_url", makeNullableEncoder Jenc.string x.previewURL)
        , ("track_number", Jenc.int x.trackNumber)
        , ("type", encodeItemType x.purpleType)
        , ("uri", Jenc.string x.uri)
        , ("album", makeNullableEncoder encodePurpleAlbum x.album)
        , ("external_ids", makeNullableEncoder encodeItemExternalIDS x.externalIDS)
        , ("popularity", makeNullableEncoder Jenc.int x.popularity)
        , ("linked_from", makeNullableEncoder encodeProfile x.linkedFrom)
        ]

purpleAlbum : Jdec.Decoder PurpleAlbum
purpleAlbum =
    Jpipe.decode PurpleAlbum
        |> Jpipe.required "album_type" Jdec.string
        |> Jpipe.required "artists" (Jdec.array profile)
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "images" (Jdec.array image)
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.required "type" Jdec.string
        |> Jpipe.required "uri" Jdec.string

encodePurpleAlbum : PurpleAlbum -> Jenc.Value
encodePurpleAlbum x =
    Jenc.object
        [ ("album_type", Jenc.string x.albumType)
        , ("artists", makeArrayEncoder encodeProfile x.artists)
        , ("external_urls", encodeExternalUrls x.externalUrls)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("images", makeArrayEncoder encodeImage x.images)
        , ("name", Jenc.string x.name)
        , ("type", Jenc.string x.purpleType)
        , ("uri", Jenc.string x.uri)
        ]

itemExternalIDS : Jdec.Decoder ItemExternalIDS
itemExternalIDS =
    Jpipe.decode ItemExternalIDS
        |> Jpipe.required "isrc" Jdec.string

encodeItemExternalIDS : ItemExternalIDS -> Jenc.Value
encodeItemExternalIDS x =
    Jenc.object
        [ ("isrc", Jenc.string x.isrc)
        ]

itemType : Jdec.Decoder ItemType
itemType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "track" -> Jdec.succeed FluffyTrack
                somethingElse -> Jdec.fail <| "Invalid ItemType: " ++ somethingElse
        )

encodeItemType : ItemType -> Jenc.Value
encodeItemType x = case x of
    FluffyTrack -> Jenc.string "track"

artist : Jdec.Decoder Artist
artist =
    Jpipe.decode Artist
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "followers" followers
        |> Jpipe.required "genres" (Jdec.array Jdec.string)
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "images" (Jdec.array image)
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.required "popularity" Jdec.int
        |> Jpipe.required "type" Jdec.string
        |> Jpipe.required "uri" Jdec.string

encodeArtist : Artist -> Jenc.Value
encodeArtist x =
    Jenc.object
        [ ("external_urls", encodeExternalUrls x.externalUrls)
        , ("followers", encodeFollowers x.followers)
        , ("genres", makeArrayEncoder Jenc.string x.genres)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("images", makeArrayEncoder encodeImage x.images)
        , ("name", Jenc.string x.name)
        , ("popularity", Jenc.int x.popularity)
        , ("type", Jenc.string x.purpleType)
        , ("uri", Jenc.string x.uri)
        ]

externalUrls : Jdec.Decoder ExternalUrls
externalUrls =
    Jpipe.decode ExternalUrls
        |> Jpipe.required "spotify" Jdec.string

encodeExternalUrls : ExternalUrls -> Jenc.Value
encodeExternalUrls x =
    Jenc.object
        [ ("spotify", Jenc.string x.spotify)
        ]

followers : Jdec.Decoder Followers
followers =
    Jpipe.decode Followers
        |> Jpipe.optional "href" (Jdec.null ()) ()
        |> Jpipe.required "total" Jdec.int

encodeFollowers : Followers -> Jenc.Value
encodeFollowers x =
    Jenc.object
        [ ("href", always Jenc.null x.href)
        , ("total", Jenc.int x.total)
        ]

image : Jdec.Decoder Image
image =
    Jpipe.decode Image
        |> Jpipe.optional "height" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.required "url" Jdec.string
        |> Jpipe.optional "width" (Jdec.nullable Jdec.int) Nothing

encodeImage : Image -> Jenc.Value
encodeImage x =
    Jenc.object
        [ ("height", makeNullableEncoder Jenc.int x.height)
        , ("url", Jenc.string x.url)
        , ("width", makeNullableEncoder Jenc.int x.width)
        ]

playlist : Jdec.Decoder Playlist
playlist =
    Jpipe.decode Playlist
        |> Jpipe.required "collaborative" Jdec.bool
        |> Jpipe.required "description" Jdec.string
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "followers" followers
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "images" (Jdec.array image)
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.required "owner" profile
        |> Jpipe.required "public" Jdec.bool
        |> Jpipe.required "snapshot_id" Jdec.string
        |> Jpipe.required "tracks" playlistTracks
        |> Jpipe.required "type" Jdec.string
        |> Jpipe.required "uri" Jdec.string

encodePlaylist : Playlist -> Jenc.Value
encodePlaylist x =
    Jenc.object
        [ ("collaborative", Jenc.bool x.collaborative)
        , ("description", Jenc.string x.description)
        , ("external_urls", encodeExternalUrls x.externalUrls)
        , ("followers", encodeFollowers x.followers)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("images", makeArrayEncoder encodeImage x.images)
        , ("name", Jenc.string x.name)
        , ("owner", encodeProfile x.owner)
        , ("public", Jenc.bool x.public)
        , ("snapshot_id", Jenc.string x.snapshotID)
        , ("tracks", encodePlaylistTracks x.tracks)
        , ("type", Jenc.string x.purpleType)
        , ("uri", Jenc.string x.uri)
        ]

externalUrls : Jdec.Decoder ExternalUrls
externalUrls =
    Jpipe.decode ExternalUrls
        |> Jpipe.required "spotify" Jdec.string

encodeExternalUrls : ExternalUrls -> Jenc.Value
encodeExternalUrls x =
    Jenc.object
        [ ("spotify", Jenc.string x.spotify)
        ]

followers : Jdec.Decoder Followers
followers =
    Jpipe.decode Followers
        |> Jpipe.optional "href" (Jdec.null ()) ()
        |> Jpipe.required "total" Jdec.int

encodeFollowers : Followers -> Jenc.Value
encodeFollowers x =
    Jenc.object
        [ ("href", always Jenc.null x.href)
        , ("total", Jenc.int x.total)
        ]

image : Jdec.Decoder Image
image =
    Jpipe.decode Image
        |> Jpipe.optional "height" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.required "url" Jdec.string
        |> Jpipe.optional "width" (Jdec.nullable Jdec.int) Nothing

encodeImage : Image -> Jenc.Value
encodeImage x =
    Jenc.object
        [ ("height", makeNullableEncoder Jenc.int x.height)
        , ("url", Jenc.string x.url)
        , ("width", makeNullableEncoder Jenc.int x.width)
        ]

profile : Jdec.Decoder Profile
profile =
    Jpipe.decode Profile
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.optional "name" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "type" artistType
        |> Jpipe.required "uri" Jdec.string
        |> Jpipe.optional "display_name" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "followers" (Jdec.nullable followers) Nothing
        |> Jpipe.optional "images" (Jdec.nullable (Jdec.array image)) Nothing

encodeProfile : Profile -> Jenc.Value
encodeProfile x =
    Jenc.object
        [ ("external_urls", encodeExternalUrls x.externalUrls)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("name", makeNullableEncoder Jenc.string x.name)
        , ("type", encodeArtistType x.purpleType)
        , ("uri", Jenc.string x.uri)
        , ("display_name", makeNullableEncoder Jenc.string x.displayName)
        , ("followers", makeNullableEncoder encodeFollowers x.followers)
        , ("images", makeNullableEncoder (makeArrayEncoder encodeImage) x.images)
        ]

artistType : Jdec.Decoder ArtistType
artistType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "artist" -> Jdec.succeed PurpleArtist
                "track" -> Jdec.succeed PurpleTrack
                "user" -> Jdec.succeed User
                somethingElse -> Jdec.fail <| "Invalid ArtistType: " ++ somethingElse
        )

encodeArtistType : ArtistType -> Jenc.Value
encodeArtistType x = case x of
    PurpleArtist -> Jenc.string "artist"
    PurpleTrack -> Jenc.string "track"
    User -> Jenc.string "user"

playlistTracks : Jdec.Decoder PlaylistTracks
playlistTracks =
    Jpipe.decode PlaylistTracks
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "items" (Jdec.array item)
        |> Jpipe.required "limit" Jdec.int
        |> Jpipe.optional "next" (Jdec.null ()) ()
        |> Jpipe.required "offset" Jdec.int
        |> Jpipe.optional "previous" (Jdec.null ()) ()
        |> Jpipe.required "total" Jdec.int

encodePlaylistTracks : PlaylistTracks -> Jenc.Value
encodePlaylistTracks x =
    Jenc.object
        [ ("href", Jenc.string x.href)
        , ("items", makeArrayEncoder encodeItem x.items)
        , ("limit", Jenc.int x.limit)
        , ("next", always Jenc.null x.next)
        , ("offset", Jenc.int x.offset)
        , ("previous", always Jenc.null x.previous)
        , ("total", Jenc.int x.total)
        ]

item : Jdec.Decoder Item
item =
    Jpipe.decode Item
        |> Jpipe.required "added_at" Jdec.string
        |> Jpipe.required "added_by" profile
        |> Jpipe.required "is_local" Jdec.bool
        |> Jpipe.required "track" track

encodeItem : Item -> Jenc.Value
encodeItem x =
    Jenc.object
        [ ("added_at", Jenc.string x.addedAt)
        , ("added_by", encodeProfile x.addedBy)
        , ("is_local", Jenc.bool x.isLocal)
        , ("track", encodeTrack x.track)
        ]

track : Jdec.Decoder Track
track =
    Jpipe.decode Track
        |> Jpipe.required "artists" (Jdec.array profile)
        |> Jpipe.required "disc_number" Jdec.int
        |> Jpipe.required "duration_ms" Jdec.int
        |> Jpipe.required "explicit" Jdec.bool
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "is_playable" Jdec.bool
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.optional "preview_url" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "track_number" Jdec.int
        |> Jpipe.required "type" itemType
        |> Jpipe.required "uri" Jdec.string
        |> Jpipe.optional "album" (Jdec.nullable purpleAlbum) Nothing
        |> Jpipe.optional "external_ids" (Jdec.nullable itemExternalIDS) Nothing
        |> Jpipe.optional "popularity" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.optional "linked_from" (Jdec.nullable profile) Nothing

encodeTrack : Track -> Jenc.Value
encodeTrack x =
    Jenc.object
        [ ("artists", makeArrayEncoder encodeProfile x.artists)
        , ("disc_number", Jenc.int x.discNumber)
        , ("duration_ms", Jenc.int x.durationMS)
        , ("explicit", Jenc.bool x.explicit)
        , ("external_urls", encodeExternalUrls x.externalUrls)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("is_playable", Jenc.bool x.isPlayable)
        , ("name", Jenc.string x.name)
        , ("preview_url", makeNullableEncoder Jenc.string x.previewURL)
        , ("track_number", Jenc.int x.trackNumber)
        , ("type", encodeItemType x.purpleType)
        , ("uri", Jenc.string x.uri)
        , ("album", makeNullableEncoder encodePurpleAlbum x.album)
        , ("external_ids", makeNullableEncoder encodeItemExternalIDS x.externalIDS)
        , ("popularity", makeNullableEncoder Jenc.int x.popularity)
        , ("linked_from", makeNullableEncoder encodeProfile x.linkedFrom)
        ]

purpleAlbum : Jdec.Decoder PurpleAlbum
purpleAlbum =
    Jpipe.decode PurpleAlbum
        |> Jpipe.required "album_type" Jdec.string
        |> Jpipe.required "artists" (Jdec.array profile)
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "images" (Jdec.array image)
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.required "type" Jdec.string
        |> Jpipe.required "uri" Jdec.string

encodePurpleAlbum : PurpleAlbum -> Jenc.Value
encodePurpleAlbum x =
    Jenc.object
        [ ("album_type", Jenc.string x.albumType)
        , ("artists", makeArrayEncoder encodeProfile x.artists)
        , ("external_urls", encodeExternalUrls x.externalUrls)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("images", makeArrayEncoder encodeImage x.images)
        , ("name", Jenc.string x.name)
        , ("type", Jenc.string x.purpleType)
        , ("uri", Jenc.string x.uri)
        ]

itemExternalIDS : Jdec.Decoder ItemExternalIDS
itemExternalIDS =
    Jpipe.decode ItemExternalIDS
        |> Jpipe.required "isrc" Jdec.string

encodeItemExternalIDS : ItemExternalIDS -> Jenc.Value
encodeItemExternalIDS x =
    Jenc.object
        [ ("isrc", Jenc.string x.isrc)
        ]

itemType : Jdec.Decoder ItemType
itemType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "track" -> Jdec.succeed FluffyTrack
                somethingElse -> Jdec.fail <| "Invalid ItemType: " ++ somethingElse
        )

encodeItemType : ItemType -> Jenc.Value
encodeItemType x = case x of
    FluffyTrack -> Jenc.string "track"

--- encoder helpers

makeArrayEncoder : (a -> Jenc.Value) -> Array a -> Jenc.Value
makeArrayEncoder f arr =
    Jenc.array (Array.map f arr)

makeDictEncoder : (a -> Jenc.Value) -> Dict String a -> Jenc.Value
makeDictEncoder f dict =
    Jenc.object (toList (Dict.map (\k -> f) dict))

makeNullableEncoder : (a -> Jenc.Value) -> Maybe a -> Jenc.Value
makeNullableEncoder f m =
    case m of
    Just x -> f x
    Nothing -> Jenc.null
