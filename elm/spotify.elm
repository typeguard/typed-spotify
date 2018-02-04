-- To decode the JSON data, add this file to your project, run
--
--     elm-package install NoRedInk/elm-decode-pipeline
--
-- add these imports
--
--     import Json.Decode exposing (decodeString)`);
--     import QuickType exposing (album)
--
-- and you're off to the races with
--
--     decodeString album myJsonString

module QuickType exposing
    ( Album
    , albumToString
    , album
    , AlbumArtist
    , ExternalUrls
    , Copyright
    , ExternalIDS
    , Image
    , Tracks
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
    , artists : Array AlbumArtist
    , copyrights : Array Copyright
    , externalIDS : ExternalIDS
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
    , tracks : Tracks
    , purpleType : String
    , uri : String
    }

type alias AlbumArtist =
    { externalUrls : ExternalUrls
    , href : String
    , id : String
    , name : String
    , purpleType : ArtistType
    , uri : String
    }

type alias ExternalUrls =
    { spotify : String
    }

type ArtistType
    = TypeArtist

type alias Copyright =
    { text : String
    , purpleType : String
    }

type alias ExternalIDS =
    { upc : String
    }

type alias Image =
    { height : Int
    , url : String
    , width : Int
    }

type alias Tracks =
    { href : String
    , items : Array Item
    , limit : Int
    , next : ()
    , offset : Int
    , previous : ()
    , total : Int
    }

type alias Item =
    { artists : Array AlbumArtist
    , discNumber : Int
    , durationMS : Int
    , explicit : Bool
    , externalUrls : ExternalUrls
    , href : String
    , id : String
    , isPlayable : Bool
    , name : String
    , previewURL : String
    , trackNumber : Int
    , purpleType : ItemType
    , uri : String
    }

type ItemType
    = Track

-- decoders and encoders

albumToString : Album -> String
albumToString r = Jenc.encode 0 (encodeAlbum r)

album : Jdec.Decoder Album
album =
    Jpipe.decode Album
        |> Jpipe.required "album_type" Jdec.string
        |> Jpipe.required "artists" (Jdec.array albumArtist)
        |> Jpipe.required "copyrights" (Jdec.array copyright)
        |> Jpipe.required "external_ids" externalIDS
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
        |> Jpipe.required "tracks" tracks
        |> Jpipe.required "type" Jdec.string
        |> Jpipe.required "uri" Jdec.string

encodeAlbum : Album -> Jenc.Value
encodeAlbum x =
    Jenc.object
        [ ("album_type", Jenc.string x.albumType)
        , ("artists", makeArrayEncoder encodeAlbumArtist x.artists)
        , ("copyrights", makeArrayEncoder encodeCopyright x.copyrights)
        , ("external_ids", encodeExternalIDS x.externalIDS)
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
        , ("tracks", encodeTracks x.tracks)
        , ("type", Jenc.string x.purpleType)
        , ("uri", Jenc.string x.uri)
        ]

albumArtist : Jdec.Decoder AlbumArtist
albumArtist =
    Jpipe.decode AlbumArtist
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.required "type" artistType
        |> Jpipe.required "uri" Jdec.string

encodeAlbumArtist : AlbumArtist -> Jenc.Value
encodeAlbumArtist x =
    Jenc.object
        [ ("external_urls", encodeExternalUrls x.externalUrls)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("name", Jenc.string x.name)
        , ("type", encodeArtistType x.purpleType)
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

artistType : Jdec.Decoder ArtistType
artistType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "artist" -> Jdec.succeed TypeArtist
                somethingElse -> Jdec.fail <| "Invalid ArtistType: " ++ somethingElse
        )

encodeArtistType : ArtistType -> Jenc.Value
encodeArtistType x = case x of
    TypeArtist -> Jenc.string "artist"

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

externalIDS : Jdec.Decoder ExternalIDS
externalIDS =
    Jpipe.decode ExternalIDS
        |> Jpipe.required "upc" Jdec.string

encodeExternalIDS : ExternalIDS -> Jenc.Value
encodeExternalIDS x =
    Jenc.object
        [ ("upc", Jenc.string x.upc)
        ]

image : Jdec.Decoder Image
image =
    Jpipe.decode Image
        |> Jpipe.required "height" Jdec.int
        |> Jpipe.required "url" Jdec.string
        |> Jpipe.required "width" Jdec.int

encodeImage : Image -> Jenc.Value
encodeImage x =
    Jenc.object
        [ ("height", Jenc.int x.height)
        , ("url", Jenc.string x.url)
        , ("width", Jenc.int x.width)
        ]

tracks : Jdec.Decoder Tracks
tracks =
    Jpipe.decode Tracks
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "items" (Jdec.array item)
        |> Jpipe.required "limit" Jdec.int
        |> Jpipe.optional "next" (Jdec.null ()) ()
        |> Jpipe.required "offset" Jdec.int
        |> Jpipe.optional "previous" (Jdec.null ()) ()
        |> Jpipe.required "total" Jdec.int

encodeTracks : Tracks -> Jenc.Value
encodeTracks x =
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
        |> Jpipe.required "artists" (Jdec.array albumArtist)
        |> Jpipe.required "disc_number" Jdec.int
        |> Jpipe.required "duration_ms" Jdec.int
        |> Jpipe.required "explicit" Jdec.bool
        |> Jpipe.required "external_urls" externalUrls
        |> Jpipe.required "href" Jdec.string
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.required "is_playable" Jdec.bool
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.required "preview_url" Jdec.string
        |> Jpipe.required "track_number" Jdec.int
        |> Jpipe.required "type" itemType
        |> Jpipe.required "uri" Jdec.string

encodeItem : Item -> Jenc.Value
encodeItem x =
    Jenc.object
        [ ("artists", makeArrayEncoder encodeAlbumArtist x.artists)
        , ("disc_number", Jenc.int x.discNumber)
        , ("duration_ms", Jenc.int x.durationMS)
        , ("explicit", Jenc.bool x.explicit)
        , ("external_urls", encodeExternalUrls x.externalUrls)
        , ("href", Jenc.string x.href)
        , ("id", Jenc.string x.id)
        , ("is_playable", Jenc.bool x.isPlayable)
        , ("name", Jenc.string x.name)
        , ("preview_url", Jenc.string x.previewURL)
        , ("track_number", Jenc.int x.trackNumber)
        , ("type", encodeItemType x.purpleType)
        , ("uri", Jenc.string x.uri)
        ]

itemType : Jdec.Decoder ItemType
itemType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "track" -> Jdec.succeed Track
                somethingElse -> Jdec.fail <| "Invalid ItemType: " ++ somethingElse
        )

encodeItemType : ItemType -> Jenc.Value
encodeItemType x = case x of
    Track -> Jenc.string "track"

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
